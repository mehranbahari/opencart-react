<?php
class ControllerCommonGoogle extends Controller {
    public function index($error = array()) {
        $this->load->language('common/google');

		$data['text_captcha'] = $this->language->get('text_captcha');

		$data['entry_captcha'] = $this->language->get('entry_captcha');

        if (isset($error['captcha'])) {
			$data['error_captcha'] = $error['captcha'];
		} else {
			$data['error_captcha'] = '';
		}

		$data['site_key'] = $this->config->get('captcha_google_key');

		return $this->load->view('common/google', $data);
    }

    public function validate() {
		if (empty($this->session->data['gcapcha'])) {
			$this->load->language('common/google');

			$recaptcha = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . urlencode($this->config->get('captcha_google_secret')) . '&response=' . $this->request->post['g-recaptcha-response'] . '&remoteip=' . $this->request->server['REMOTE_ADDR']);
	
			$recaptcha = json_decode($recaptcha, true);
	
			if ($recaptcha['success']) {
				$this->session->data['gcapcha']	= true;
			} else {
				return $this->language->get('error_captcha');
			}
		}
    }
}
?>