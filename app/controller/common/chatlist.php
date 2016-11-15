<?php
class ControllerCommonChatlist extends Controller {
	public function index() {
		if ($this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {

			$data['logout'] = $this->url->link('common/logout','token='.$this->session->data['token']);
			
			$data['token'] = $this->session->data['token'];
		}
		$this->load->model('tool/chat');

		$results = $this->model_tool_chat->getContacts($this->user->isLogged());
		$data['chatheads'] = array();

		foreach ($results as $result) {
			$data['chatheads'][] = array(
					'id' => $result['contactId'],
					'src' => 'dist/img/img_avatar.png',
					'name' => $this->model_tool_chat->getContactName($result['contactId']),
				);
		}

		if (!isset($this->request->get['q'])) {
			$data['currid'] = null;
			return $this->load->view('common/chatlist',$data);
		} else {
			$data['currid'] = $this->request->get['q'];
		}
		$data['messagedelete'] = $this->url->link('common/messagedelete','token='.$this->session->data['token']);
		echo $this->load->view('common/chatlist',$data);
	}
}