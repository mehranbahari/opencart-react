<?php 
class ModelExtensionPaymentOCFParsian extends Model {
  	public function getMethod($address) {
		$this->load->language('extension/payment/ocf_parsian');
      	
		if ($this->config->get('payment_ocf_parsian_status')) {
			$status = true;
		} else {
			$status = false;
		}
		
		$method_data = array();
	
		if ($status) {
      		$method_data = array(
        		'code'       => 'ocf_parsian',
        		'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('payment_ocf_parsian_sort_order')
      		);
    	}
		
    	return $method_data;
  	}
}
?>