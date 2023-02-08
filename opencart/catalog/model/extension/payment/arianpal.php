<?php 
class ModelExtensionPaymentArianpal extends Model {
  	public function getMethod($address, $total) {
		$this->load->language('extension/payment/arianpal');

		if ($this->config->get('payment_arianpal_status')) {
      		$status = true;
      	} else {
			$status = false;
		}

		$method_data = array();
		
		if ($status) {
      		$method_data = array( 
        		'code'       => 'arianpal',
        		'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('payment_arianpal_sort_order')
      		);
    	}
		
    	return $method_data;
  	}
}
?>