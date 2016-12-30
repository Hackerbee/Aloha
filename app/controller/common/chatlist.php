<?php
class ControllerCommonChatlist extends Controller {
	public function index() {
		if ($this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {

			$data['logout'] = $this->url->link('common/logout','token='.$this->session->data['token']);
			
			$data['messagedelete'] = $this->url->link('common/messagedelete','token='.$this->session->data['token']);
			
			$data['token'] = $this->session->data['token'];

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
		$this->load->model('tool/chat');

		$results = $this->model_tool_chat->getContacts($this->user->isLogged());
		$data['chatheads'] = array();

		foreach ($results as $result) {
			$data['chatheads'][] = array(
					'id' => $result['contactId'],
					'src' => 'dist/img/img_avatar.png',
					'name' => $this->model_tool_chat->getContactName($result['contactId']),
					'status' => ($this->model_tool_online->isOnline($result['contactId']) ? 'onnline' : 'offline' ),
				);
		}

		if (!isset($this->request->get['q'])) {
			$data['currid'] = null;
			return $this->load->view('common/chatlist',$data);
		} else {
			$data['currid'] = $this->request->get['q'];
		}

		echo $this->load->view('common/chatlist',$data);
	}
}