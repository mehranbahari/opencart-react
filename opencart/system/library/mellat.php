<?php
final class Mellat {
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
	
	public function getErrors($errCode = '', $note = '', $errNote = 'خطای وب سرویس') {
		
		switch($errCode) {
			case 11: $err = "شماره کارت معتبر نیست"; break;
			case 12: $err = "موجودی کافی نیست"; break;
			case 13: $err = "رمز دوم شما صحیح نیست"; break;
			case 14: $err = "دفعات مجاز ورود رمز بیش از حد است"; break;
			case 15: $err = "کارت معتبر نیست"; break;
			case 16: $err = "دفعات برداشت وجه بیش از حد مجاز است"; break;
			case 17: $err = "کاربر از انجام تراکنش منصرف شده است"; break;
			case 18: $err = "تاریخ انقضای کارت گذشته است"; break;
			case 19: $err = "مبلغ برداشت وجه بیش از حد مجاز است"; break;
			case 21: $err = "پذیرنده معتبر نیست"; break;
			case 23: $err = "خطای امنیتی رخ داده است"; break;
			case 24: $err = "اطلاعات کاربری پذیرنده معتبر نیست"; break;
			case 25: $err = "مبلغ نامعتبر است"; break;
			case 31: $err = "پاسخ نامعتبر است"; break;
			case 32: $err = "فرمت اطلاعات وارد شده صحیح نیست"; break;
			case 33: $err = "حساب نامعتبر است"; break;
			case 34: $err = "خطای سیستمی"; break;
			case 35: $err = "تاریخ نامعتبر است"; break;
			case 41: $err = "شماره درخواست تکراری است"; break;
			case 42: $err = "تراکنش Sale یافت نشد"; break;
			case 43: $err = "قبلا درخواست Verify داده شده است"; break;
			case 44: $err = "درخواست Verify یافت نشد"; break;
			case 45: $err = "تراکنش Settle شده است"; break;
			case 46: $err = "تراکنش Settle نشده است"; break;
			case 47: $err = "تراکنش Settle یافت نشد"; break;
			case 48: $err = "تراکنش Reverse شده است"; break;
			case 49: $err = "تراکنش Refund یافت نشد"; break;
			case 51: $err = "تراکنش تکراری است"; break;
			case 54: $err = "تراکنش مرجع موجود نیست"; break;
			case 55: $err = "تراکنش نامعتبر است"; break;
			case 61: $err = "خطا در واریز"; break;
			case 111: $err = "صادر کننده کارت نامعتبر است"; break;
			case 112: $err = "خطای سوییچ صادر کننده کارت"; break;
			case 113: $err = "پاسخی از صادر کننده کارت دریافت نشد"; break;
			case 114: $err = "دارنده کارت مجاز به انجام این تراکنش نمی باشد"; break;
			case 412: $err = "شناسه قبض نادرست است"; break;
			case 413: $err = "شناسه پرداخت نادرست است"; break;
			case 414: $err = "سازمان صادر کننده قبض معتبر نیست"; break;
			case 415: $err = "زمان جلسه کاری به پایان رسیده است"; break;
			case 416: $err = "خطا در ثبت اطلاعات"; break;
			case 417: $err = "شناسه پرداخت کننده نامعتبر است"; break;
			case 418: $err = "اشکال در تعریف اطلاعات مشتری"; break;
			case 419: $err = "تعداد دفعات ورود اطلاعات بیش از حد مجاز است"; break;
			case 421: $err = "IP معتبر نیست"; break;
		}
		
		if (isset($err) && $errCode) {
			$this->errors[] = $errNote . ' (' . $errCode . ' :: ' . $err . ')' . (!empty($note) ? ' - ' . $note : '');
		} 
		
		return isset($err) && $errCode ? ($errNote . ' (' . $errCode . ' :: ' . $err . ')' . (!empty($note) ? ' - ' . $note : '')) : true;
	}
	
	private function Connect() {
		$this->data['Config']['nameSpace'] = 'http://interfaces.core.sw.bps.com/';
		
		//$this->data['Config']['Wsdl'] = 'https://pgws.bpm.bankmellat.ir/pgwchannel/services/pgw?wsdl'; ## PayMode (WebService)
		//$this->data['Config']['Action'] = 'https://pgw.bpm.bankmellat.ir/pgwchannel/startpay.mellat'; ## PayMode (Form)
		$this->data['Config']['Wsdl'] = 'https://bpm.shaparak.ir/pgwchannel/services/pgw?wsdl'; ## PayMode (WebService)
		$this->data['Config']['Action'] = 'https://bpm.shaparak.ir/pgwchannel/startpay.mellat'; ## PayMode (Form)
		
		## WSDL
		$soapClient	= new nusoap_client($this->data['Config']['Wsdl']);
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
		
		$this->data['Resources']['localData'] = date("Ymd");
		$this->data['Resources']['localTime'] = date("His");
		$this->data['Resources']['orderId'] = date("YHis") . rand(1, 10000) . rand(1, 10000);
		$this->data['Resources']['orderTotal'] = $orderTotal;
		$this->data['Resources']['additionalData'] = $additional_data;
		$this->data['Resources']['address_confirm'] = $address_confirm;
		$this->data['Resources']['payerId'] = ('0');
		
		$this->data['Parameters']['Action'] = array(
			'terminalId'   => $this->data['Config']['Terminal_id'],
			'userName'     => $this->data['Config']['Username'],
			'userPassword' => $this->data['Config']['Password'],
			'orderId' 	   		=> $this->data['Resources']['orderId'],
			'localDate'       => $this->data['Resources']['localData'],
			'localTime'	   => $this->data['Resources']['localTime'],
			'amount' 	   	=> $this->data['Resources']['orderTotal'],
			'additionalData' => $this->data['Resources']['additionalData'],
			'callBackUrl'		 => $this->data['Resources']['address_confirm'],
			'payerId' 		 => $this->data['Resources']['payerId']
		);
		
		$this->data['Calls']['bpPayRequest'] = $this->data['Proxy']->call('bpPayRequest', $this->data['Parameters']['Action'], $this->data['Config']['nameSpace']);
		$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
		
		if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
			$this->data['setErrors'] = $this->setErrors($this->data['Proxy']->fault ? $this->data['Calls']['bpPayRequest'] : $this->data['Calls']['getError']);
		} else {
	
			## Explode
			$result = explode(',', $this->getString($this->data['Calls']['bpPayRequest']));
			
			## Resources
			if (isset($result[1]) && $result[0] == "0") {

				$this->data['Resources']['code'] = trim($result[1]);
			} else {
				## -- getErrors --
				$this->getErrors($result[0]);
			}
		}
		
		## Return
		return $this->data['Resources']['code'];
	}
	
	public function PayConfirm($address_cancel) {
		if (isset($_POST['ResCode'])) {
		
			$this->Connect();
			$this->data['Resources']['VerifyData'] = "";
			$this->data['Resources']['SettleData'] = "";
			$this->data['Resources']['InquiryData'] = "";
			$this->data['Resources']['ReversalData'] = "";
			
			$this->data['Resources']['refId'] = isset($_POST['RefId']) ? $_POST['RefId'] : "";
			$this->data['Resources']['resCode'] = isset($_POST['ResCode']) ? $_POST['ResCode'] : "";
			$this->data['Resources']['saleOrderId'] = isset($_POST['SaleOrderId']) ? $_POST['SaleOrderId'] : "";
			$this->data['Resources']['saleReferenceId'] = isset($_POST['SaleReferenceId']) ? $_POST['SaleReferenceId'] : "";
			
			$this->data['Resources']['orderId'] = date('YHis') . rand(1, 10000) . rand(1, 10000);
			$this->data['Resources']['address_cancel'] = $address_cancel;
		
			$this->data['Parameters']['Confirm'] = array(
				'terminalId'   => $this->data['Config']['Terminal_id'],
				'userName'     => $this->data['Config']['Username'],
				'userPassword' => $this->data['Config']['Password'],
				'orderId'	   	  	  => $this->data['Resources']['orderId'],
				'saleOrderId'      => $this->data['Resources']['saleOrderId'],
				'saleReferenceId' => $this->data['Resources']['saleReferenceId']
			);
			
			if ($this->data['Resources']['resCode'] == "0") {
		
				## Varify Request
				$this->data['Calls']['bpVerifyRequest'] = $this->data['Proxy']->call('bpVerifyRequest', $this->data['Parameters']['Confirm'], $this->data['Config']['nameSpace']);
				$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
				
				if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
					
					## Inquiry Request
					$this->data['Calls']['bpInquiryRequest'] = $this->data['Proxy']->call('bpInquiryRequest', $this->data['Parameters']['Confirm'], $this->data['Config']['nameSpace']);
					$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
					
					if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
						
						## Reversal Request
						$this->data['Calls']['bpReversalRequest'] = $this->data['Proxy']->call('bpReversalRequest', $this->data['Parameters']['Confirm'], $this->data['Config']['nameSpace']);
						$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
						
						if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
							$this->data['setErrors'] = $this->setErrors($this->data['Proxy']->fault ? $this->data['Calls']['bpReversalRequest'] : $this->data['Calls']['getError']);
						} else {
							$this->data['Resources']['ReversalData'] = $this->getString($this->data['Calls']['bpReversalRequest']);
						}
					} else {
						$this->data['Resources']['InquiryData'] = $this->getString($this->data['Calls']['bpInquiryRequest']);
					}
				} else {
					$this->data['Resources']['VerifyData'] = $this->getString($this->data['Calls']['bpVerifyRequest']);
				}
			} else {
				## -- getErrors --
				$this->getErrors($this->data['Resources']['resCode'], 'Info :: ConfirmError');
			}
			
			if (($this->data['Resources']['VerifyData'] == "0") || ($this->data['Resources']['InquiryData'] == "0")) {
				
				## Settle Request
				$this->data['Calls']['bpSettleRequest'] = $this->data['Proxy']->call('bpSettleRequest', $this->data['Parameters']['Confirm'], $this->data['Config']['nameSpace']);
				$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
				
				if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
					$this->data['setErrors'] = $this->setErrors($this->data['Proxy']->fault ? $this->data['Calls']['bpSettleRequest'] : $this->data['Calls']['getError']);
				} else {
					$this->data['Resources']['SettleData'] = $this->getString($this->data['Calls']['bpSettleRequest']);
				}
				
			} else {
				## -- getErrors --
				$this->getErrors($this->data['Resources']['VerifyData'], 'Info :: VerifyError');
				$this->getErrors($this->data['Resources']['InquiryData'], 'Info :: InquiryError');
			}
			
			if ($this->data['Resources']['SettleData'] == "0") {
				return array('settled' => true, 'orderId' => $this->data['Parameters']['Confirm']['orderId'], 'saleOrderId' => $this->data['Parameters']['Confirm']['saleOrderId'], 'saleReferenceId' => $this->data['Parameters']['Confirm']['saleReferenceId']);
			} else {
				return array('settled' => false, 'orderId' => $this->data['Parameters']['Confirm']['orderId'], 'saleOrderId' => $this->data['Parameters']['Confirm']['saleOrderId'], 'saleReferenceId' => $this->data['Parameters']['Confirm']['saleReferenceId']);
			}
		
		} else {
			header('Status: ' . 302);
			header('Location: ' . str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $address_cancel));
			exit();
		}
	}
	
	public function Refund($orderTotal, $saleOrderId, $saleReferenceId) {
		
		$this->Connect();
		$this->data['Resources']['code'] = "";
		$this->data['Resources']['VerifyData'] = "";
		$this->data['Resources']['InquiryData'] = "";
		
		$this->data['Resources']['orderId'] = date('YHis') . rand(1, 10000) . rand(1, 10000);
		$this->data['Resources']['orderTotal'] = $orderTotal;
		$this->data['Resources']['saleOrderId'] = $saleOrderId;
		$this->data['Resources']['saleReferenceId'] = $saleReferenceId;
		
		$this->data['Parameters']['Refund_1'] = array(
			'terminalId'   => $this->data['Config']['Terminal_id'],
			'userName'     => $this->data['Config']['Username'],
			'userPassword' => $this->data['Config']['Password'],
			'orderId' 	   		=> $this->data['Resources']['orderId'],
			'saleOrderId'     => $this->data['Resources']['saleOrderId'],
			'saleReferenceId' => $this->data['Resources']['saleReferenceId'],
			'refundAmount'  => $this->data['Resources']['orderTotal'],
		);
		
		$this->data['Calls']['bpRefundRequest'] = $this->data['Proxy']->call('bpRefundRequest', $this->data['Parameters']['Refund_1'], $this->data['Config']['nameSpace']);
		$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
		
		if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
			$this->data['setErrors'] = $this->setErrors($this->data['Proxy']->fault ? $this->data['Calls']['bpRefundRequest'] : $this->data['Calls']['getError']);
		} else {
	
			## Explode
			$result = explode(',', $this->getString($this->data['Calls']['bpRefundRequest']));
			
			## Resources
			if (isset($result[1]) && $result[0] == "0") {

				$this->data['Resources']['code'] = trim($result[1]);
			} else {
				## -- getErrors --
				$this->getErrors($result[0]);
			}
		}
		
		if ($this->data['Resources']['code']) {
			
			$this->data['Parameters']['Refund_2'] = array(
				'terminalId'   => $this->data['Config']['Terminal_id'],
				'userName'     => $this->data['Config']['Username'],
				'userPassword' => $this->data['Config']['Password'],
				'orderId'	   	  => $this->data['Resources']['saleOrderId'],
				'saleOrderId'     => $this->data['Resources']['saleOrderId'],
				'saleReferenceId' => $this->data['Resources']['saleReferenceId']
			);
			
			## Varify Reauest
			$this->data['Calls']['bpRefundVerifyRequest'] = $this->data['Proxy']->call('bpRefundVerifyRequest', $this->data['Parameters']['Refund_2'], $this->data['Config']['nameSpace']);
			$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
			
			if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
				
				## Inquiry Reauest
				$this->data['Calls']['bpRefundInquiryRequest'] = $this->data['Proxy']->call('bpRefundInquiryRequest', $this->data['Parameters']['Refund_2'], $this->data['Config']['nameSpace']);
				$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
				
				if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
					$this->data['setErrors'] = $this->setErrors($this->data['Proxy']->fault ? $this->data['Calls']['bpRefundRequest'] : $this->data['Calls']['getError']);
				} else {
					$this->data['Resources']['InquiryData'] = $this->getString($this->data['Calls']['bpRefundInquiryRequest']);
				}
			} else {
				$this->data['Resources']['VerifyData'] = $this->getString($this->data['Calls']['bpRefundVerifyRequest']);
			}
		}
		
		if ($this->data['Resources']['VerifyData'] == "0" || $this->data['Resources']['InquiryData'] == "0") { return (true); }
		return (false);
	}
	
	public function Settle($saleOrderId, $saleReferenceId) {
		
		$this->Connect();
		$this->data['Resources']['SettleData'] = "";
		
		$this->data['Resources']['orderId'] = date('YHis') . rand(1, 10000) . rand(1, 10000);
		$this->data['Resources']['saleOrderId'] = $saleOrderId;
		$this->data['Resources']['saleReferenceId'] = $saleReferenceId;
		
		$this->data['Parameters']['Settle'] = array(
			'terminalId'     => $this->data['Config']['Terminal_id'],
			'userName'      => $this->data['Config']['Username'],
			'userPassword'  => $this->data['Config']['Password'],
			'orderId'	   	  => $this->data['Resources']['orderId'],
			'saleOrderId'  => $this->data['Resources']['saleOrderId'],
			'saleReferenceId' => $this->data['Resources']['saleReferenceId']
		);
		
		## Settle Request
		$this->data['Calls']['bpSettleRequest'] = $this->data['Proxy']->call('bpSettleRequest', $this->data['Parameters']['Settle'], $this->data['Config']['nameSpace']);
		$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
		
		if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
			$this->data['setErrors'] = $this->setErrors($this->data['Proxy']->fault ? $this->data['Calls']['bpSettleRequest'] : $this->data['Calls']['getError']);
		} else {
			$this->data['Resources']['SettleData'] = $this->getString($this->data['Calls']['bpSettleRequest']);
		}
		
		if ($this->data['Resources']['SettleData'] == "0") {
			return (true);
		} else {
			$this->getErrors($this->data['Resources']['SettleData'], 'Info :: SettleError');
			return (false);
		}		
	}
}
?>