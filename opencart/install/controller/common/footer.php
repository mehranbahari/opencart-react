<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');
		
		$data['text_project'] = $this->language->get('text_project');
		$data['text_documentation'] = $this->language->get('text_documentation');
		$data['text_support'] = $this->language->get('text_support');
		$data['text_website'] = $this->language->get('text_website');
		$data['text_shop'] = $this->language->get('text_shop');
		$data['text_footer'] = $this->language->get('text_footer');

		return $this->load->view('common/footer', $data);
	}
}
