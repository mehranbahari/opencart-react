<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$this->load->language('common/header');
		
		$data['title'] = $this->document->getTitle();
		$data['description'] = $this->document->getDescription();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();

		// Add By Mojtaba Moghani
		if (isset($this->session->data['language']) and ($this->session->data['language'] == 'fa-ir')) {
			$data['direction'] = 'rtl';
			$data['lang'] = 'fa';
		} else {
			$data['direction'] = 'ltr';
			$data['lang'] = 'en';
		}

		$data['base'] = HTTP_SERVER;

		return $this->load->view('common/header', $data);
	}
}