<?php
Class ControllerCommonLogin extends Controller {
	private $error = array();
	
	public function index() {

		if ($this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
			$this->response->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], true));
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->session->data['token'] = token(32);
			
			if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], HTTP_SERVER) === 0 || strpos($this->request->post['redirect'], HTTPS_SERVER) === 0)) {
				$this->response->redirect($this->request->post['redirect'] . '&token=' . $this->session->data['token']);
			} else if (isset($this->session->data['redirect']) && (strpos($this->session->data['redirect'], HTTP_SERVER) === 0 || strpos($this->session->data['redirect'], HTTPS_SERVER) === 0)) {
				$this->response->redirect($this->session->data['redirect'] . '&token=' . $this->session->data['token']);
			} else {
				$this->response->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], true));
			}
		}

		if ((isset($this->session->data['token']) && !isset($this->request->get['token'])) || ((isset($this->request->get['token']) && (isset($this->session->data['token']) && ($this->request->get['token'] != $this->session->data['token']))))) {
			$this->error['warning'] = '<p class="alert alert-warning" style="align:center;width:100%">Wrong token!</p>';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['action'] = $this->url->link('common/login', '', true);
		$data['signup'] = $this->url->link('common/register', '', true);

		if (isset($this->request->post['username'])) {
			$data['username'] = $this->request->post['username'];
		} else {
			$data['username'] = '';
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->get['route'])) {
			$route = $this->request->get['route'];

			unset($this->request->get['route']);
			unset($this->request->get['token']);

			$url = '';

			if ($this->request->get) {
				$url .= http_build_query($this->request->get);
			}

			$data['redirect'] = $this->url->link($route, $url, true);
		} else {
			$data['redirect'] = '';
		}

		if ($this->config->get('config_password')) {
			$data['forgotten'] = $this->url->link('common/forgotten', '', true);
		} else {
			$data['forgotten'] = '';
		}

		// $data['header'] = $this->load->controller('common/header');
		// $data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('common/login', $data));
	}

	protected function validate() {
		if (!isset($this->request->post['username']) || !isset($this->request->post['password']) || !$this->user->login($this->request->post['username'], html_entity_decode($this->request->post['password'], ENT_QUOTES, 'UTF-8'))) {
			$this->error['warning'] = '<p class="alert alert-warning" style="align:center;width:100%">Error in login</p>';
		}

		return !$this->error;
	}
}