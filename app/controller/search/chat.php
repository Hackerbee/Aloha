<?php
class ControllerSearchChat extends Controller {
	public function index(){
		$q = $this->request->get['q'];
		$id = $this->request->get['id'];
		$this->load->model('tool/chat');
		$number = $this->model_tool_chat->getContactNumber($q,$id);
		$flag = 0;
		if($number == 0) $flag = $this->model_tool_chat->addChat($q,$id);
		echo $id.' '.$flag;
	}
}