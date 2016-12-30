<?php
class ControllerCommonMessageSent extends Controller {
	public function index(){
		$type = $this->request->get['type'];
		$receiver = $this->request->get['receive'];
		$sender = $this->request->get['send'];
		$message = $this->request->get['messagesent'];
		$this->load->model('tool/chat');
		if(strlen($message)>0 && strlen($message)<1000 )
			$id = $this->model_tool_chat->messageSent($sender,$message,$receiver,$type);
		$data = null;
		// $this->response->setOutput(true);

		echo $id;
	}
}