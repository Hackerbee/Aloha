<?php
class ControllerSearchUserlist extends Controller {
	public function index(){
		$q = $this->request->get['q'];
		$id = $this->request->get['id'];
		$this->load->model('search/search');

		$results = $this->model_search_search->getUsers($q,$id);

		$data = null;

		foreach ($results as $result) {
			$data .= "<li id=".$result['userid']." onclick='javascript:addContact(".$result['userid'].")'>".$result['username']."</li>";
		}

		$this->response->setOutput($data);
	}
}