<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$data['chatlist'] = $this->load->controller('common/chatlist');
		$data['messagelist'] = $this->load->controller('common/messagelist');
		$data['inputpanel'] = null;//$this->load->controller('common/inputpanel');
		$data['rightsidebar'] = null;//$this->load->controller('common/rightsidebar');

		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}