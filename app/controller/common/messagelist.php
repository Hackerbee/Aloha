<?php
class ControllerCommonMessagelist extends Controller {
	public function index() {
		if ($this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
			
			$data['token'] = $this->session->data['token'];

			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->user->getId(), $url, $referer);
		}

		$data['sender'] = $this->user->getId();
		$this->load->model('tool/chat');

		if(isset($this->request->get['q'])) {
			$data['rows'] = $this->model_tool_chat->messageReceiveNew($data['sender']);
			$this->model_tool_chat->messageReceiveNotify($data['sender']);
			echo $this->load->view('common/messagelistnew', $data);
		} elseif (isset($this->request->get['old']) && isset($this->request->get['id'])) {
			$data['rows'] = $this->model_tool_chat->messageReceiveOld($data['sender'],$this->request->get['old'],$this->request->get['id']);
			echo $this->load->view('common/messagelistnew', $data);
		} else {
			$data['rows'] = $this->model_tool_chat->messageReceive($data['sender']);
			$this->model_tool_chat->messageReceiveNotify($data['sender']);
			return $this->load->view('common/messagelist', $data);
		}
	}
}