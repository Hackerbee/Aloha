<?php
class ControllerCommonMessageDelete extends Controller {
	public function index() {

		$data['sender'] = $this->user->getId();
		$this->load->model('search/chat');
		$this->model_search_chat->messageDelete($data['sender'],$this->request->get['receive']);
		
	}
}