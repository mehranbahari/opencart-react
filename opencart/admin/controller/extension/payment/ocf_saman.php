<?php
class ControllerExtensionPaymentOCFSaman extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/payment/ocf_saman');
		$this->install();

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('payment_ocf_saman', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['merchant_id'])) {
			$data['error_merchant_id'] = $this->error['merchant_id'];
		} else {
			$data['error_merchant_id'] = '';
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
			'href' => $this->url->link('extension/payment/ocf_saman', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/payment/ocf_saman', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true);

		if (isset($this->request->post['payment_ocf_saman_merchant_id'])) {
			$data['payment_ocf_saman_merchant_id'] = $this->request->post['payment_ocf_saman_merchant_id'];
		} else {
			$data['payment_ocf_saman_merchant_id'] = $this->config->get('payment_ocf_saman_merchant_id');
		}

		if (isset($this->request->post['payment_ocf_saman_order_status_id'])) {
			$data['payment_ocf_saman_order_status_id'] = $this->request->post['payment_ocf_saman_order_status_id'];
		} else {
			$data['payment_ocf_saman_order_status_id'] = $this->config->get('payment_ocf_saman_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['payment_ocf_saman_status'])) {
			$data['payment_ocf_saman_status'] = $this->request->post['payment_ocf_saman_status'];
		} else {
			$data['payment_ocf_saman_status'] = $this->config->get('payment_ocf_saman_status');
		}

		if (isset($this->request->post['payment_ocf_saman_sort_order'])) {
			$data['payment_ocf_saman_sort_order'] = $this->request->post['payment_ocf_saman_sort_order'];
		} else {
			$data['payment_ocf_saman_sort_order'] = $this->config->get('payment_ocf_saman_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/payment/ocf_saman', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/ocf_saman')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['payment_ocf_saman_merchant_id']) {
			$this->error['merchant_id'] = $this->language->get('error_merchant_id');
		}

		return !$this->error;
	}

	public function install() {
		$unFiles = array(
			DIR_APPLICATION . 'controller/payment/saman.php',
			DIR_APPLICATION . 'language/english/payment/saman.php',
			DIR_APPLICATION . 'language/en-gb/payment/saman.php',
			DIR_APPLICATION . 'language/persian/payment/saman.php',
			DIR_APPLICATION . 'language/fa-ir/payment/saman.php',
			DIR_APPLICATION . 'view/template/payment/saman.tpl',
			DIR_CATALOG . 'controller/payment/saman.php',
			DIR_CATALOG . 'language/english/payment/saman.php',
			DIR_CATALOG . 'language/en-gb/payment/saman.php',
			DIR_CATALOG . 'language/persian/payment/saman.php',
			DIR_CATALOG . 'language/fa-ir/payment/saman.php',
			DIR_CATALOG . 'model/payment/saman.php',
			DIR_CATALOG . 'view/theme/default/template/payment/saman.tpl',
			DIR_CATALOG . 'view/theme/default/template/payment/saman_confirm.tpl',

			DIR_APPLICATION . 'controller/payment/ocf_saman.php',
			DIR_APPLICATION . 'language/english/payment/ocf_saman.php',
			DIR_APPLICATION . 'language/en-gb/payment/ocf_saman.php',
			DIR_APPLICATION . 'language/persian/payment/ocf_saman.php',
			DIR_APPLICATION . 'language/fa-ir/payment/ocf_saman.php',
			DIR_APPLICATION . 'view/template/payment/ocf_saman.tpl',
			DIR_CATALOG . 'controller/payment/ocf_saman.php',
			DIR_CATALOG . 'language/english/payment/ocf_saman.php',
			DIR_CATALOG . 'language/en-gb/payment/ocf_saman.php',
			DIR_CATALOG . 'language/persian/payment/ocf_saman.php',
			DIR_CATALOG . 'language/fa-ir/payment/ocf_saman.php',
			DIR_CATALOG . 'model/payment/ocf_saman.php',
			DIR_CATALOG . 'view/theme/default/template/payment/ocf_saman.tpl',
			DIR_CATALOG . 'view/theme/default/template/payment/ocf_saman_confirm.tpl',
		);
		
		foreach ($unFiles as $unFile) {
			if (file_exists($unFile)) { unlink($unFile); }
		}
	}
}
?>