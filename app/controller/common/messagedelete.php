<?php
class ControllerCommonMessagedelete extends Controller {
	public function index() {
		if ($this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
			
			$data['token'] = $this->session->data['token'];
		}
		
		$data['sender'] = $this->user->getId();
		$this->load->model('tool/chat');
		$this->model_tool_chat->messageDelete($data['sender'],$this->request->get['receive']);
		
	}
}