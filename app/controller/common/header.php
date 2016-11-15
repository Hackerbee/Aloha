<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		if ($this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {

			$data['logout'] = $this->url->link('common/logout','token='.$this->session->data['token']);
			
			$data['token'] = $this->session->data['token'];
		}
		return $this->load->view('common/header');
	}
}
