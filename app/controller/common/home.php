<?php
class ControllerCommonHome extends Controller {
	public function index() {
		if ($this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {

			$data['logout'] = $this->url->link('common/logout','token='.$this->session->data['token']);
			
			$data['token'] = $this->session->data['token'];
		} else {
			$this->session->data['redirect'] = $this->url->link('common/home');
			$this->response->redirect($this->url->link('common/login'));
		}
		$data['chatlist'] = $this->load->controller('common/chatlist');
		$data['messagelist'] = $this->load->controller('common/messagelist');
		$data['inputpanel'] = null;//$this->load->controller('common/inputpanel');
		$data['rightsidebar'] = null;//$this->load->controller('common/rightsidebar');

		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}