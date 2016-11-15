<?php
class ControllerCommonRegister extends Controller {
	private $error = array();

	public function index() {
		if ($this->user->isLogged()) {
			$this->response->redirect($this->url->link('common/home', '', true));
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->load->model('tool/upload');
			// // Clear any previous login attempts for unregistered accounts.
			$this->model_tool_upload->addUser($this->request->post['email'],sha1($this->request->post['password']),$this->request->post['username']);

			// $this->customer->login($this->request->post['email'], $this->request->post['password']);

			// unset($this->session->data['guest']);

			$this->response->redirect($this->url->link('common/home'));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['username'])) {
			$data['error_username'] = $this->error['username'];
		} else {
			$data['error_username'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}

		if (isset($this->error['confirm'])) {
			$data['error_confirm'] = $this->error['confirm'];
		} else {
			$data['error_confirm'] = '';
		}

		if (isset($this->request->post['username'])) {
			$data['username'] = $this->request->post['username'];
		} else {
			$data['username'] = '';
		}
		
		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}

		$data['action'] = $this->url->link('common/register', '', true);
		$data['login'] = $this->url->link('common/login', '', true);

		// $data['footer'] = $this->load->controller('common/footer');
		// $data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/register',$data));
	}

	private function validate() {
		if ((utf8_strlen(trim($this->request->post['username'])) < 1) || (utf8_strlen(trim($this->request->post['username'])) > 32)) {
			$this->error['username'] = '<p class="alert alert-warning" style="align:center;width:100%">error_username</p>';
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = '<p class="alert alert-warning" style="align:center;width:100%">error_email</p>';
		}

		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = '<p class="alert alert-warning" style="align:center;width:100%">error_password</p>';
		}
			$this->load->model('tool/upload');
			
			if($this->model_tool_upload->findUserEmail($this->request->post['email'])!=0){
					$this->error['email'] = '<p class="alert alert-warning" style="align:center;width:100%">Email exists</p>';
			}

			if($this->model_tool_upload->findUser($this->request->post['username'])!=0){
					$this->error['username'] = '<p class="alert alert-warning" style="align:center;width:100%">Username exists</p>';
			}

		// if ($this->request->post['confirm'] != $this->request->post['password']) {
		// 	$this->error['confirm'] = error_confirm;
		// }

		return !$this->error;
	}
}