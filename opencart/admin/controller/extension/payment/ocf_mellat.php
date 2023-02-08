<?php
require_once(DIR_SYSTEM . 'library/nuSoap/nusoap.php');
class ControllerExtensionPaymentOCFMellat extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/payment/ocf_mellat');
		$this->install();

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('payment_ocf_mellat', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/payment/ocf_mellat', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/payment/ocf_mellat', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true);

		if (isset($this->request->post['payment_ocf_mellat_terminal_id'])) {
			$data['payment_ocf_mellat_terminal_id'] = $this->request->post['payment_ocf_mellat_terminal_id'];
		} else {
			$data['payment_ocf_mellat_terminal_id'] = $this->config->get('payment_ocf_mellat_terminal_id');
		}

		if (isset($this->request->post['payment_ocf_mellat_username'])) {
			$data['payment_ocf_mellat_username'] = $this->request->post['payment_ocf_mellat_username'];
		} else {
			$data['payment_ocf_mellat_username'] = $this->config->get('payment_ocf_mellat_username');
		}

		if (isset($this->request->post['payment_ocf_mellat_password'])) {
			$data['payment_ocf_mellat_password'] = $this->request->post['payment_ocf_mellat_password'];
		} else {
			$data['payment_ocf_mellat_password'] = $this->config->get('payment_ocf_mellat_password');
		}

		if (isset($this->request->post['payment_ocf_mellat_order_status_id'])) {
			$data['payment_ocf_mellat_order_status_id'] = $this->request->post['payment_ocf_mellat_order_status_id'];
		} else {
			$data['payment_ocf_mellat_order_status_id'] = $this->config->get('payment_ocf_mellat_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['payment_ocf_mellat_status'])) {
			$data['payment_ocf_mellat_status'] = $this->request->post['payment_ocf_mellat_status'];
		} else {
			$data['payment_ocf_mellat_status'] = $this->config->get('payment_ocf_mellat_status');
		}

		if (isset($this->request->post['payment_ocf_mellat_sort_order'])) {
			$data['payment_ocf_mellat_sort_order'] = $this->request->post['payment_ocf_mellat_sort_order'];
		} else {
			$data['payment_ocf_mellat_sort_order'] = $this->config->get('payment_ocf_mellat_sort_order');
		}
		
		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/payment/ocf_mellat', $data));
	}
	
	public function settle() {
		
		$json = array();
		if (!isset($this->request->get['sale_order_id'])) { $json['error'] = $this->language->get('error_sale_order_id'); }
		if (!isset($this->request->get['sale_reference_id'])) { $json['error'] = $this->language->get('error_sale_reference_id'); }
		
		if (!$json) {
			
			/* Connect */
			$this->load->library('mellat');
			$this->WebService = new Mellat($this->config->get('payment_ocf_mellat_terminal_id'), $this->config->get('payment_ocf_mellat_username'), $this->config->get('payment_ocf_mellat_password'));
			
			$data['settle'] = $this->WebService->Settle($this->request->get['sale_order_id'], $this->request->get['sale_reference_id']);
			//$data['action'] = $this->WebService->data['Config']['Action'];
			
			if ($this->WebService->errors) {
				$json['error'] = implode(', ', $this->WebService->errors);
			} else {
				if ($data['settle']) {
					$json['success'] = $this->language->get('text_settle_success'); 
				} else {
					$json['error'] = $this->language->get('text_settle_error');
				}
			}
		}
		
		$this->response->setOutput(json_encode($json));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/ocf_mellat')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function install() {
		$unFiles = array(
			DIR_APPLICATION . 'controller/payment/mellat.php',
			DIR_APPLICATION . 'language/english/payment/mellat.php',
			DIR_APPLICATION . 'language/en-gb/payment/mellat.php',
			DIR_APPLICATION . 'language/persian/payment/mellat.php',
			DIR_APPLICATION . 'language/fa-ir/payment/mellat.php',
			DIR_APPLICATION . 'view/template/payment/mellat.tpl',
			DIR_CATALOG . 'controller/payment/mellat.php',
			DIR_CATALOG . 'language/english/payment/mellat.php',
			DIR_CATALOG . 'language/en-gb/payment/mellat.php',
			DIR_CATALOG . 'language/persian/payment/mellat.php',
			DIR_CATALOG . 'language/fa-ir/payment/mellat.php',
			DIR_CATALOG . 'model/payment/mellat.php',
			DIR_CATALOG . 'view/theme/default/template/payment/mellat.tpl',
			DIR_CATALOG . 'view/theme/default/template/payment/mellat_confirm.tpl',

			DIR_APPLICATION . 'controller/payment/ocf_mellat.php',
			DIR_APPLICATION . 'language/english/payment/ocf_mellat.php',
			DIR_APPLICATION . 'language/en-gb/payment/ocf_mellat.php',
			DIR_APPLICATION . 'language/persian/payment/ocf_mellat.php',
			DIR_APPLICATION . 'language/fa-ir/payment/ocf_mellat.php',
			DIR_APPLICATION . 'view/template/payment/ocf_mellat.tpl',
			DIR_CATALOG . 'controller/payment/ocf_mellat.php',
			DIR_CATALOG . 'language/english/payment/ocf_mellat.php',
			DIR_CATALOG . 'language/en-gb/payment/ocf_mellat.php',
			DIR_CATALOG . 'language/persian/payment/ocf_mellat.php',
			DIR_CATALOG . 'language/fa-ir/payment/ocf_mellat.php',
			DIR_CATALOG . 'model/payment/ocf_mellat.php',
			DIR_CATALOG . 'view/theme/default/template/payment/ocf_mellat.tpl',
			DIR_CATALOG . 'view/theme/default/template/payment/ocf_mellat_confirm.tpl',
		);
		
		foreach ($unFiles as $unFile) {
			if (file_exists($unFile)) { unlink($unFile); }
		}
	}
}
?>