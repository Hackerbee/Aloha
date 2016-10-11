<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$data['test'] = "successful!";

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}