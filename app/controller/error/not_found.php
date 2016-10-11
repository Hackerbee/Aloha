<?php
class ControllerErrorNotFound extends Controller {
	public function index() {

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => 'LP',//$this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['route'])) {
			$url_data = $this->request->get;

			unset($url_data['_route_']);

			$route = $url_data['route'];

			unset($url_data['route']);

			$url = '';

			if ($url_data) {
				$url = '&' . urldecode(http_build_query($url_data, '', '&'));
			}

			$data['breadcrumbs'][] = array(
				'text' => 'LP',//$this->language->get('heading_title'),
				'href' => $this->url->link($route, $url, $this->request->server['HTTPS'])
			);
		}

		$data['heading_title'] = 'LP';//$this->language->get('heading_title');

		$data['text_error'] = 'LP';//$this->language->get('text_error');

		$data['button_continue'] = 'LP';//$this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = null;//$this->load->controller('common/column_left');
		$data['column_right'] = null;//$this->load->controller('common/column_right');
		$data['content_top'] = null;//$this->load->controller('common/content_top');
		$data['content_bottom'] = null;//$this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

		$this->response->setOutput($this->load->view('error/not_found', $data));
	}
}