<?php
class ControllerCommonChatlistnew extends Controller {
	public function index() {
		if ($this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {

			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->user->getId(), $url, $referer);
		}
		if (isset($this->request->get['onnline'])) {
			$online = explode(',',$this->request->get['onnline']);
		} else {
			$online = array();
		}
		
		if (isset($this->request->get['offline'])) {
			$offline = explode(',',$this->request->get['offline']);
		} else {
			$offline = array();
		}

		if( isset($this->request->get['q']) && $this->request->get['q'] != 'null') {
			$open = $this->request->get['q'];
		} else {
			$open = '0';
		}


		$this->load->model('tool/chat');

		$results = $this->model_tool_chat->getContacts($this->user->isLogged());
		$onlineusers = $this->model_tool_online->getOnlineContacts($this->user->isLogged());
		
		// print_r($online);
		// echo "<br/>";
		// print_r($offline);
		// echo "<br/>";
		// print_r($onlineusers);
		// echo "<br/>";

		$data['chatlist'] = array();

		foreach ($results as $result) {
			if ( !in_array($result['contactId'],$online) && !in_array($result['contactId'],$offline) ) {
				$data['chatlist'][] = array(
					'op'	=> 'add',
					'id'	=> $result['contactId'],
					'class'	=> trim(( in_array($result['contactId'],$onlineusers) ? 'onnline' : 'offline' ).' '.( $open == $result['contactId'] ? 'chip-open' : '' )),
					'src'	=> 'dist/img/img_avatar.png',
					'name'	=> $this->model_tool_chat->getContactName($result['contactId']),
				);
			} elseif ( in_array($result['contactId'],$onlineusers) && in_array($result['contactId'],$offline) ) {
				$data['chatlist'][] = array(
					'op'	=> 'status',
					'id'	=> $result['contactId'],
					'class'	=> trim('chip onnline '.( $open == $result['contactId'] ? 'chip-open' : '' )),
				);
			} elseif ( !in_array($result['contactId'],$onlineusers) && in_array($result['contactId'],$online) ) {
				$data['chatlist'][] = array(
					'op'	=> 'status',
					'id'	=> $result['contactId'],
					'class'	=> trim('chip offline '.( $open == $result['contactId'] ? 'chip-open' : '' )),
				);
			}
		}
		header("content-type:application/json");
		echo json_encode($data);
	}
}