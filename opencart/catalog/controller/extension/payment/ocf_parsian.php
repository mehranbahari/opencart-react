<?php
require_once(DIR_SYSTEM . 'library/nuSoap/nusoap.php');
class ControllerExtensionPaymentOCFParsian extends Controller {
	private $WebService = array();
	private $errors = array();
	
	public function index() {
		$this->load->language('extension/payment/ocf_parsian');
		
		$data['button_confirm'] = $this->language->get('button_confirm');
		$data['text_wait'] = $this->language->get('text_wait');
		$data['text_loading'] = $this->language->get('text_loading');
		
		return $this->load->view('extension/payment/ocf_parsian', $data);
	}
	
	public function confirm() {
		$this->load->language('extension/payment/ocf_parsian');
		
		$this->load->model('checkout/order');
		
		$json = array();
		$data['address_cancel'] = $this->url->link('checkout/checkout', '', true);
		$data['address_success'] = $this->url->link('checkout/success', '', true);
		
		if (isset($this->session->data['order_id'])) {
			$order_id = $this->session->data['order_id'];
		} else {
			$order_id = 0;
		}
		$order_info = $this->model_checkout_order->getOrder($order_id);
		
		if ($order_info) {
			$data['orderTotal'] = $this->currency->format($order_info['total'], $order_info['currency_code'], false, false);
			$data['orderTotal'] = $this->currency->convert($data['orderTotal'], $order_info['currency_code'], "RLS");
			$data['orderId'] = $order_id;
			
			/*$data['address_confirm'] = $this->url->link('extension/payment/ocf_parsian/callback', 'order_id=' . $this->encryption->encrypt($this->config->get('config_encryption'), $order_id), true);*/
			$data['address_confirm'] = $this->url->link('extension/payment/ocf_parsian/callback', 'order_id=' . $this->encrypt($order_id), true);

			/* Connect */
			$this->load->library('parsian');
			$this->WebService = new Parsian($this->config->get('payment_ocf_parsian_terminal_id'), null, null);
		
			$data['refId'] = $this->WebService->PayAction($data['orderTotal'], $data['address_confirm'], "Order No: " . $data['orderId']);
			$data['action'] = $this->WebService->data['Config']['Action'];
		
			if ($this->WebService->errors) {
				$json['error'] = implode(', ', $this->WebService->errors);
			} else {
				$json['action'] = $data['action'];
				$json['refId'] = $data['refId'];
			}
		} else {
			$json['error'] = $this->language->get('error_order_id');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function callback() {
		if ($this->session->data['payment_method']['code'] == 'ocf_parsian') {
			$this->load->language('extension/payment/ocf_parsian');
			
			$this->document->setTitle($this->language->get('text_heading'));
			
			$data['heading_title'] = $this->language->get('text_heading');
			
			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home')
			); 

			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_heading'),
				'href'      => $this->url->link('extension/payment/ocf_parsian/callback', '', true)
			);
			
			$this->load->model('checkout/order');
			
			//$data = array();
			$data['address_cancel'] = $this->url->link('checkout/checkout', '', true);
			$data['address_success'] = $this->url->link('checkout/success', '', true);
			
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
			
			if ($order_info) {
				
				/* Connect */
				$this->load->library('parsian');
				$this->WebService = new Parsian($this->config->get('payment_ocf_parsian_terminal_id'), null, null);

				$data['error_warning'] = "";
				$data['confirm'] = $this->WebService->PayConfirm($data['address_cancel']);
			
				if ($this->WebService->errors) {
					$data['error_warning'] = implode(', ', $this->WebService->errors);
					$data['continue'] = $data['address_cancel'];
				} else {
					$data['results'] = $data['confirm']['results'];
				
					$comment = $this->language->get('text_results') . $data['results'] . "\n";
					
					$this->model_checkout_order->addOrderHistory($order_info['order_id'], $this->config->get('payment_ocf_parsian_order_status_id'), $comment, true);
					$data['continue'] = $data['address_success'];
				}
			} else {
				$data['error_warning'] = $this->language->get('error_order_id');
				$data['continue'] = $data['address_cancel'];
			}
		
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('extension/payment/ocf_parsian_confirm', $data));
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