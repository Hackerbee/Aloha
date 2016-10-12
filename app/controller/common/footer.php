<?php
class ControllerCommonFooter extends Controller {
	public function index() {

		// // Whos Online
		// if ($this->config->get('config_customer_online')) {
		// 	$this->load->model('tool/online');

		// 	if (isset($this->request->server['REMOTE_ADDR'])) {
		// 		$ip = $this->request->server['REMOTE_ADDR'];
		// 	} else {
		// 		$ip = '';
		// 	}

		// 	if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
		// 		$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
		// 	} else {
		// 		$url = '';
		// 	}

		// 	if (isset($this->request->server['HTTP_REFERER'])) {
		// 		$referer = $this->request->server['HTTP_REFERER'];
		// 	} else {
		// 		$referer = '';
		// 	}

		// 	$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		// }

		return $this->load->view('common/footer');
	}
}
