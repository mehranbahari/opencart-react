<?php
require_once(DIR_SYSTEM.'library/nuSoap/nusoap.php');

class ControllerExtensionPaymentArianpal extends Controller {
	public function index() {
		$this->load->language('extension/payment/arianpal');
		
		$data['text_connect'] = $this->language->get('text_connect');
		$data['text_loading'] = $this->language->get('text_loading');
 		$data['text_wait'] = $this->language->get('text_wait');
		
		$data['button_confirm'] = $this->language->get('button_confirm');

		return $this->load->view('extension/payment/arianpal', $data);
	}

	public function confirm() {
		$this->load->language('extension/payment/arianpal');

		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		
		$amount = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
		$amount = $this->currency->convert($amount, $order_info['currency_code'], "TOM");
	
		$data['PIN'] = $this->config->get('payment_arianpal_pin');
		$data['PASS'] = $this->config->get('payment_arianpal_pass');

		$data['return'] = $this->url->link('checkout/success', '', true);
		$data['cancel_return'] = $this->url->link('checkout/payment', '', true);
		$data['back'] = $this->url->link('checkout/payment', '', true);
		
		/*$client = new SoapClient("https://www.arianpal.com/WebserviceGateway/wsdl");*/
		/*$client = new nusoap_client('http://merchant.arianpal.com/WebService.asmx?wsdl', true);*/
		
	   /*if((!$client)){
			$json = array();
			$json['error']= "Can not connect to Arianpal.<br>";
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}*/
	
		//$ResNumber = 1234 ;// Order Id In Your System
		$Description = $order_info['comment'];
		$Paymenter =  $order_info['firstname'] . ' ' . $order_info['lastname'];
		$Email = isset($order_info['email']) ? $order_info['email'] : '';
		$Mobile =  isset($order_info['fax']) ? $order_info['fax'] : $order_info['telephone'];
	
		/*$order_id = $this->encryption->encrypt($this->config->get('config_encryption'), $this->session->data['order_id']);*/
		$order_id = $this->encrypt($this->session->data['order_id']);
		$callbackUrl  =  $this->url->link('extension/payment/arianpal/callback', 'order_id=' . $order_id, true);
		
		/*$res = $client->PaymentRequest($data['PIN'], $amount, $callbackUrl, urlencode(' خريد شماره: '.$order_info['order_id']) );*/
		$client = new SoapClient('http://merchant.arianpal.com/WebService.asmx?wsdl');
		
		$parameters = array(
			"MerchantID" 	=> $data['PIN'],
			"Password" 		=> $data['PASS'],
			"Price" 		=> $amount,
			"ReturnPath" 	=> $callbackUrl,
			"ResNumber" 	=> $this->session->data['order_id'],
			"Description" 	=> $Description,
			"Paymenter" 	=> $Paymenter,
			"Email" 		=> $Email,
			"Mobile" 		=> $Mobile
		);
		$res = $client->RequestPayment($parameters);

		$PayPath = $res->RequestPaymentResult->PaymentPath;
		$Status = $res->RequestPaymentResult->ResultStatus;
		
		if($Status == 'Succeed') {
			$data['action'] = $PayPath;
			$json = array();
			$json['success']= $data['action'];
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		} else {
			$this->CheckState($Status);
			//die();
		}
	
	}

	public function CheckState($status) {
		$json = array();
		$json['error'] = $status;
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function verify_payment($authority, $amount){
		$this->load->language('extension/payment/arianpal');

		if($authority){
			//$client = new SoapClient("http://www.arianpal.com/WebserviceGateway/wsdl");
			 $client = new nusoap_client('https://www.arianpal.com/WebserviceGateway/wsdl', true);
			if ((!$client)) {
				echo  "Error: can not connect to Arianpal.<br>";
				return false;
			} else {
				$data['PIN'] = $this->config->get('payment_arianpal_pin');
				$parameters = array(
					'MerchantID'	=> $data['PIN'],
					'Authority' 	=> $authority,
					'Amount'	 	=> $amount
				);
				//$res = $client->PaymentVerification($data['PIN'], $authority ,$amount);
				$res = $client->call('PaymentVerification', $parameters);
				
				//$this->CheckState($res);
				if($res == 1) {
					return true;
				} else {
					return false;
				}
			}
		} else {
			return false;
		}
		return false;
	}

	public function callback() {
		if ($this->session->data['payment_method']['code'] == 'arianpal') {
			$this->load->language('extension/payment/arianpal');

			$this->document->setTitle($this->language->get('text_title'));
			
			$data['heading_title'] = $this->language->get('text_title');
			$data['results'] = "";

			$MerchantID = $this->config->get('payment_arianpal_pin');
			$Password = $this->config->get('payment_arianpal_pass');
			
			$data['breadcrumbs'] = array();
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'), 
				'href' => $this->url->link('common/home', '', true)
			);
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_title'), 
				'href' => $this->url->link('extension/payment/arianpal/callback', '', true)
			);

			$this->load->model('checkout/order');

			if(isset($_POST['status']) && $_POST['status'] == 100){
				$Status = $_POST['status'];
				$Refnumber = $_POST['refnumber'];
				$Resnumber = $_POST['resnumber'];

				/*if (isset($this->request->get['order_id'])) {
					$order_id = $this->encryption->decrypt($this->config->get('config_encryption'), $this->request->get['order_id']);
				} else {
					$order_id = 0;
				}*/
				/*if(isset($this->request->get['order_id'])) {
					$order_id = $this->decrypt($this->request->get['order_id']);
				} else {
					$order_id = 0;
				}*/
				if (isset($this->session->data['order_id'])) {
					$order_id = $this->session->data['order_id'];
				} else {
					$order_id = 0;
				}
				
				$order_info = $this->model_checkout_order->getOrder($order_id);

				if ($order_info) { //verify here
					$amount = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
					$amount = $this->currency->convert($amount, $order_info['currency_code'], "TOM");
					
					$client = new SoapClient('http://merchant.arianpal.com/WebService.asmx?wsdl');
					$parameters = array(
						"MerchantID" 	=> $MerchantID,
						"Password" 		=> $Password,
						"Price" 		=> $amount,
						"RefNum" 		=> $Refnumber
					);
					$res = $client->VerifyPayment($parameters);
					
					$Status = $res->verifyPaymentResult->ResultStatus;
					$PayPrice = $res->verifyPaymentResult->PayementedPrice;
					
					if($Status == 'Success') { // Your Peyment Code Only This Event
						$comment = $this->language->get('text_results') . $Refnumber;
						$this->model_checkout_order->addOrderHistory($order_id, $this->config->get('payment_arianpal_order_status_id'), $comment, true);
						
						$data['error_warning'] = NULL;
						$data['results'] = $Refnumber;
						$data['button_continue'] = $this->language->get('button_complete');
						$data['continue'] = $this->url->link('checkout/success');
					} else {			
						$data['error_warning'] = 'خطا در عملیات پردازش پرداخت، کد خطا: ' . $Status;
						$data['button_continue'] = $this->language->get('button_view_cart');
						$data['continue'] = $this->url->link('checkout/cart');
					}
			
				} else {
					$data['error_warning'] = 'سفارش شما پیدا نشد !';
					$data['button_continue'] = $this->language->get('button_view_cart');
					$data['continue'] = $this->url->link('checkout/cart');
				}

			} else {
				$data['error_warning'] = 'انصراف از پرداخت، اطلاعات پرداخت دريافت نشد !';
				$data['button_continue'] = $this->language->get('button_view_cart');
				$data['continue'] = $this->url->link('checkout/cart');
			}

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('extension/payment/arianpal_confirm', $data));
		}
	}

	// Encryption Fumction From 2.3.0.2
	public function encrypt($value) {
		$key = $this->config->get('config_encryption');
		$my_key = hash('sha256', $key, true);
		return strtr(base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, hash('sha256', $my_key, true), $value, MCRYPT_MODE_ECB)), '+/=', '-_,');
	}

	public function decrypt($value) {
		$key = $this->config->get('config_encryption');
		$my_key = hash('sha256', $key, true);
		return trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, hash('sha256', $my_key, true), base64_decode(strtr($value, '-_,', '+/=')), MCRYPT_MODE_ECB));
	}

}
?>