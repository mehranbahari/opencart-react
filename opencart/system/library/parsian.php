<?php
final class Parsian {
	public $data = array();
	public $errors = array();
		
	public function __construct($terminal_id = null, $username = null, $password = null) {
		
		## (Class)->Costruction
		$this->data['Config']['Terminal_id'] = isset($terminal_id) && !empty($terminal_id) ? ($terminal_id) : null;
		$this->data['Config']['Username'] = isset($username) && !empty($username) ? ($username) : null;
		$this->data['Config']['Password'] = isset($password) && !empty($password) ? ($password) : null;
	}
	
	public function __destruct() {
	
		## (Class)->Destruction
		$this->data = array();
		$this->errors = array();
	}
	
	public function getString($array) {
		if (is_array($array)) {
			foreach ($array as $key => $value) { $resultStr = $value; }
		} else {
			$resultStr = $array; 
		}
		return $resultStr;
	}
	
	public function setErrors($errData = '', $note = '', $errNote = 'خطای سیستم') {
		
		## ErrData
		$errData = is_array($errData) ? implode(", ", $errData) : $errData;
		
		if (!empty($errData)) {
			$this->errors[] = $errNote . ' :: ' . $errData . (!empty($note) ? ' - ' . $note : '');
		}
	}
	
	public function getErrors($errCode, $note = '', $errNote = 'خطای وب سرویس') {
		
		switch($errCode) {
			case 20 : $err = "شماره پین کد فروشنده نادرست است"; break;
			case 22 : $err = "شماره پین یا آی پی فروشنده نادرست است"; break;
			case 30 : $err = "عملیات مورد نظر قبلا با موفقیت انجام شده است"; break;
			case 34 : $err = "شماره تراکنش اعلام شده توسط فروشنده صحیح نمی باشد"; break;
			default : $err = "خطای نامشخص روی داده است"; break;
		}
		
		if (isset($err)) {
			$this->errors[] = $errNote . ' (' . $errCode . ' :: ' . $err . ')' . (!empty($note) ? ' - ' . $note : '');
		}
		
		return isset($err) ? ($errNote . ' (' . $errCode . ' :: ' . $err . ')' . (!empty($note) ? ' - ' . $note : '')) : true;
	}
	
	private function Connect() {
		
//		$this->data['Config']['Wsdl'] = 'https://www.pec24.com:443/pecpaymentgateway/eshopservice.asmx?wsdl'; ## PayMode (WebService)
		$this->data['Config']['Wsdl'] = 'https://pec.shaparak.ir/pecpaymentgateway/EShopService.asmx?wsdl'; ## PayMode (WebService)
//		$this->data['Config']['Action'] = 'https://www.pec24.com/pecpaymentgateway/?au='; ## PayMode (Form)
		$this->data['Config']['Action'] = 'https://pec.shaparak.ir/pecpaymentgateway/default.aspx?au='; ## PayMode (Form)
		
		## WSDL
		$soapClient	= new nusoap_client($this->data['Config']['Wsdl'], true);
		$soapClient->xml_encoding = "UTF-8";
		$soapClient->soap_defencoding = "UTF-8";
		$soapClient->decode_utf8 = false;
		
		## Construct Errors
		$this->setErrors($soapClient->getError(), 'Info :: ConstructError');
		
		$this->data['Proxy'] = $soapClient;
	}
	
	public function PayAction($orderTotal, $address_confirm, $additional_data = '') {
		
		$this->Connect();
		$this->data['Resources']['code'] = "";
		
		$this->data['Resources']['orderId'] = date("YHis");
		$this->data['Resources']['orderTotal'] = $orderTotal;
		$this->data['Resources']['address_confirm'] = $address_confirm;
		$this->data['Resources']['authority'] = (0);
		$this->data['Resources']['status'] = (1);
		
		$this->data['Parameters']['Action'] = array(
			'pin' => $this->data['Config']['Terminal_id'],
			'orderId' => $this->data['Resources']['orderId'],
			'amount' =>  $this->data['Resources']['orderTotal'],
			'callbackUrl' => $this->data['Resources']['address_confirm'],
			'authority' => $this->data['Resources']['authority'],
			'status' => $this->data['Resources']['status']
		);
		
		$this->data['Calls']['PinPaymentRequest'] = $this->data['Proxy']->call('PinPaymentRequest', array($this->data['Parameters']['Action']));
		$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
		
		if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
			$this->data['setErrors'] = $this->setErrors($this->data['Proxy']->fault ? $this->data['Calls']['PinPaymentRequest'] : $this->data['Calls']['getError']);
		} else {
			$results = array(
				'authority' => isset($this->data['Calls']['PinPaymentRequest']['authority']) ? $this->data['Calls']['PinPaymentRequest']['authority'] : "",
				'status' => isset($this->data['Calls']['PinPaymentRequest']['status']) ? $this->data['Calls']['PinPaymentRequest']['status'] : ""
			);
		
			## Resources
			if ($results['authority'] != (-1) && $results['status'] == (0)) {
			
				$this->data['Resources']['code'] = $results['authority'];
			} else {
				## -- getErrors --
				$this->getErrors($results['status']);
			}
			
			## Return
			return $this->data['Resources']['code'];
		}
	}
	
	public function PayConfirm($address_cancel) {
		if (isset($_REQUEST['au'], $_REQUEST['rs'])) {
		
			$this->Connect();
			$this->data['Resources']['authority'] = isset($_REQUEST['au']) ? $_REQUEST['au'] : "";
			$this->data['Resources']['status'] = isset($_REQUEST['rs']) ? $_REQUEST['rs'] : "";
			
			if ($this->data['Resources']['authority'] && $this->data['Resources']['status'] == 0) {
				
				$this->data['Parameters']['Confirm'] = array(
					'pin' 		  => $this->data['Config']['Terminal_id'],
					'authority' => $this->data['Resources']['authority'],
					'status' 	  => (1)
				);
			
				$this->data['Calls']['PinPaymentEnquiry'] = $this->data['Proxy']->call('PinPaymentEnquiry', array($this->data['Parameters']['Confirm']));
				$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
				
				if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
					$this->data['setErrors'] = $this->setErrors($this->data['Proxy']->fault ? $this->data['Calls']['PinPaymentEnquiry'] : $this->data['Calls']['getError']);
				} else {
					$results = array(
						'authority' => isset($this->data['Calls']['PinPaymentEnquiry']['authority']) ? $this->data['Calls']['PinPaymentEnquiry']['authority'] : "",
						'status' => isset($this->data['Calls']['PinPaymentEnquiry']['status']) ? $this->data['Calls']['PinPaymentEnquiry']['status'] : ""
					);
				
					if ($results['status'] == 0) {
						
						return array('results' => $this->data['Resources']['authority']);
					} else {
						## -- getErrors --
						$this->getErrors($results['status'], 'Info :: EnquiryError');
					}
				}
			} else {
				## -- getErrors --
				$this->getErrors($this->data['Resources']['status'], 'Info :: VefiryError');
			}
			
		} else {
			header('Status: ' . 302);
			header('Location: ' . str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $address_cancel));
			exit();
		}
	}
}
?>