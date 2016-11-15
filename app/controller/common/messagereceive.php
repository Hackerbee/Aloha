<?php
class ControllerCommonMessageReceive extends Controller {
	public function index(){
		$sender = $this->request->get['send'];
		$this->load->model('search/chat');
		$this->model_search_chat->messageReceive($sender,'text');
		$data = null;
		$this->response->setOutput(true);

		echo $id;
	}
}