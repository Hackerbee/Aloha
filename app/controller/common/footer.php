<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$data = array();

		if ($this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
			$data['search'] = $this->url->link('search/userlist','token='.$this->session->data['token']);
			
			$data['addchat'] = $this->url->link('search/chat','token='.$this->session->data['token']);

			$data['chatlist'] = $this->url->link('common/chatlist','token='.$this->session->data['token']);
			
			$data['chatlistnew'] = $this->url->link('common/chatlistnew','token='.$this->session->data['token']);

			$data['messagesent'] = $this->url->link('common/messagesent','token='.$this->session->data['token']);

			$data['messagereceive'] = $this->url->link('common/messagelist','token='.$this->session->data['token']);
			
			$data['logout'] = $this->url->link('common/logout','token='.$this->session->data['token']);
			
			$data['token'] = $this->session->data['token'];

			$data['uploadimage'] = $this->url->link('tool/upload','token='.$this->session->data['token']);
			$data['uploadaudio'] = $this->url->link('tool/upload/audio','token='.$this->session->data['token']);
			$data['uploaddoc'] = $this->url->link('tool/upload/doc','token='.$this->session->data['token']);
		}

		// Whos Online
		if ($this->user->isLogged()) {
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

		$data['url'] = str_replace('&amp;', '&', $url );
		$data['userid'] = $this->user->isLogged();
		return $this->load->view('common/footer',$data);
	}
}
