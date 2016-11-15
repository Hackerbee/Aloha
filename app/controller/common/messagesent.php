<?php
class ControllerCommonMessageSent extends Controller {
	public function index(){
		$type = $this->request->get['type'];
		$receiver = $this->request->get['receive'];
		$sender = $this->request->get['send'];
		$message = $this->request->get['messagesent'];
		$this->load->model('search/chat');
		if(strlen($message)>0 && strlen($message)<1000 )
			$this->model_search_chat->messageSent($sender,$message,$receiver,$type);
		$data = null;
		$this->response->setOutput(true);

		echo $id;
	}
}