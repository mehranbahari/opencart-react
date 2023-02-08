<?php
class ControllerExtensionPaymentOCFSaman extends Controller {
	public function index() {
		$this->load->language('extension/payment/ocf_saman');
		
    	$data['button_confirm'] = $this->language->get('button_confirm');
		$data['text_loading'] = $this->language->get('text_loading');

		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

		$data['action'] = 'https://sep.shaparak.ir/Payment.aspx';

		$data['Amount'] = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
		$data['Amount'] = $this->currency->convert($data['Amount'], $order_info['currency_code'], "RLS");

		$data['merchant_id'] = $this->config->get('payment_ocf_saman_merchant_id');
		/*$data['RedirectURL'] = $this->url->link('extension/payment/ocf_saman/callback&order_id=' . $this->encryption->encrypt($this->config->get('config_encryption'), $this->session->data['order_id']), true);*/
		$data['RedirectURL'] = $this->url->link('extension/payment/ocf_saman/callback&order_id=' . $this->encrypt($order_id), true);
		$data['ResNum'] = $this->session->data['order_id'];

		return $this->load->view('extension/payment/ocf_saman', $data);
	}

	public function getState($State) {

		switch($State){ 
	
			case 'Canceled By User' : 
				return("تراکنش توسط خريدار کنسل شده است."); 
				break; 
	
			case 'Invalid Amount' : 
				return("مبلغ سند برگشتی، از مبلغ تراکنش اصلی بيشتر است."); 
				break; 
	
			case 'Invalid Transaction' : 
				return("درخواست برگشت يک تراکنش رسيده است، در حالی که تراکنش اصلی پيدا نمی شود."); 
				break; 
	
			case 'Invalid Card Number' : 
				return("شماره کارت اشتباه است.");
				break; 
	
			case 'No Such Issuer' : 
				return("چنين صادر کننده کارتی وجود ندارد."); 
				break; 
	
			case 'Expired Card Pick Up' : 
				return("از تاريخ انقضای کارت گذشته است و کارت ديگر معتبر نيست."); 
				break; 
	
			case 'Allowable PIN Tries Exceeded Pick Up' : 
				return("رمز کارت (PIN) 3 مرتبه اشتباه وارد شده است در نتيجه کارت غير فعال خواهد شد."); 
				break; 
	
			case 'Incorrect PIN' : 
				return("خريدار رمز کارت (PIN) را اشتباه وارد کرده است.");
				break; 
	
			case 'Exceeds Withdrawal Amount Limit' : 
				return("مبلغ بيش از سقف برداشت می باشد.");
				break; 
	
			case 'Transaction Cannot Be Completed' : 
				return("تراکنش Authorize شده است ( شماره PIN و PAN درست هستند) ولی امکان سند خوردن وجود ندارد.");
				break; 
	
			case 'Response Received Too Late' : 
				return("تراکنش در شبکه بانکی Timeout خورده است.");
				break; 
	
			case 'Suspected Fraud Pick Up' : 
				return("خريدار يا فيلد CVV2 و يا فيلد ExpDate را اشتباه زده است. ( يا اصلا وارد نکرده است)");
				break; 
	
			case 'No Sufficient Funds' : 
				return("موجودی به اندازی کافی در حساب وجود ندارد.");
				break; 
	
			case 'Issuer Down Slm' : 
				return("سيستم کارت بانک صادر کننده در وضعيت عملياتی نيست.");
				break; 
	
			case 'TME Error' : 
				return("خطا ايجاد شده قابل شناسايى نيست. لطفا با مديريت سايت تماس بگيريد");
				break; 
	
			}  

		return("پرداخت صورت نگرفت");
	}

	public function callback() {
		if ($this->session->data['payment_method']['code'] == 'ocf_saman') {
			$this->load->language('extension/payment/ocf_saman');

			$State = isset($this->request->post['State']) ? $this->request->post['State'] : 'NO';
			$RefNum = isset($this->request->post['RefNum']) ? $this->request->post['RefNum'] : 0;
			$ResNum = isset($this->request->post['ResNum']) ? $this->request->post['ResNum'] : 0;
			$MerchantID = $this->config->get('payment_ocf_saman_merchant_id');
			$debugmod = false;

			$this->document->setTitle($this->language->get('text_title'));  
			$data['heading_title'] = $this->language->get('text_title');
			
			$data['results'] = "";
			
			//breadcrumbs
			$data['breadcrumbs'] = array();
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'), 
				'href' => $this->url->link('common/home', '', true)
			);
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_title'), 
				'href' => $this->url->link('extension/payment/ocf_saman/callback', '', true)
			);

			$this->load->model('checkout/order');

			if(($State == 'OK') or ($debugmod == true)) {

				/*if (isset($this->request->get['order_id'])) {
					$order_id = $this->encryption->decrypt($this->config->get('config_encryption'), $this->request->get['order_id']);
				} else {
					$order_id = 0;
				}*/
				if(isset($this->request->get['order_id'])) {
					$order_id = $this->decrypt($this->request->get['order_id']);
				} else {
					$order_id = 0;
				}
				$order_info = $this->model_checkout_order->getOrder($order_id);

				if ($order_info) { //verify here
					$Amount = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
					$Amount = $this->currency->convert($Amount, $order_info['currency_code'], "RLS");
					$order_id = $order_info['order_id'];
			
					if($debugmod == false) {
						$Client = new SoapClient("https://sep.shaparak.ir/payments/referencepayment.asmx?WSDL");
						$result = $Client->VerifyTransaction($RefNum, $MerchantID);
					} else { 
						$result = $Amount; $RefNum = 'debug_test'; 
					}

					if ( ($result > 0) and ($result == $Amount) ) {
						$comment = $this->language->get('text_results') .' '. $RefNum;
						$this->model_checkout_order->addOrderHistory($order_id, $this->config->get('payment_ocf_saman_order_status_id'), $comment, true);
			
						$data['error_warning'] = NULL;
						$data['results'] = $RefNum;
						$data['button_continue'] = $this->language->get('button_complete');
						$data['continue'] = $this->url->link('checkout/success');
					} else {
						$error = $this->getState($State).($debugmod == true? 'err1<br>state:'.$State.'<br>ref:'.$RefNum.'<br>res:'.$ResNum.'<br>MerchantID:'.$MerchantID : '');
			
						$data['error_warning'] = $error;
						$data['button_continue'] = $this->language->get('button_view_cart');
						$data['continue'] = $this->url->link('checkout/cart');
					}
				} else {
					$data['error_warning'] = $this->language->get('error_order_id');
					$data['button_continue'] = $this->language->get('button_view_cart');
					$data['continue'] = $this->url->link('checkout/cart');
				}//End Of Verify

			} else {
				$error = $this->getState($State).($debugmod == true? 'err2<br>state:'.$State.'<br>ref:'.$RefNum.'<br>res:'.$ResNum.'<br>MerchantID:'.$MerchantID : '');
				$data['error_warning'] = $error;
				$data['button_continue'] = $this->language->get('button_view_cart');
				$data['continue'] = $this->url->link('checkout/cart');

			}

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('extension/payment/ocf_saman_confirm', $data));
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