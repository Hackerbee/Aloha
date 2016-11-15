<?php
class ControllerCommonMessagelist extends Controller {
	public function index() {

		$data['sender'] = $this->user->getId();
		$this->load->model('search/chat');

		if(!isset($this->request->get['q'])) {
			$data['rows'] = $this->model_search_chat->messageReceive($data['sender'],'text');
			$this->model_search_chat->messageReceiveNotify($data['sender'],'text');
			return $this->load->view('common/messagelist', $data);
		} else {
			$data['rows'] = $this->model_search_chat->messageReceiveNew($data['sender'],'text');
			$this->model_search_chat->messageReceiveNotify($data['sender'],'text');
			echo $this->load->view('common/messagelistnew', $data);
		}
	}
}