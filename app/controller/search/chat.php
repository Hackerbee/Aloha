<?php
class ControllerSearchChat extends Controller {
	public function index(){
		$q = $this->request->get['q'];
		$id = $this->request->get['id'];
		$this->load->model('tool/chat');
		$number = $this->model_tool_chat->getContactNumber($q,$id);
		if($number == 0)
			$this->model_tool_chat->addChat($q,$id);
		$data = null;
		$this->response->setOutput(true);

		echo $id;
	}
}