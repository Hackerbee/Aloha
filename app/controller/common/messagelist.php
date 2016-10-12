<?php
class ControllerCommonMessagelist extends Controller {
	public function index() {
		$data['messages'] = array(
			array(
				'type' => 'date-separator',
				'text' => 'September 10',
				),
			array(
				'type' => 'me',
				'text' => 'asdfghjkl',
				'time' => '10:01 AM',
				'name' => 'Oliver',
				),
			array(
				'type' => 'other',
				'text' => 'zxcvbnm',
				'time' => '10:11 AM',
				'name' => 'Mia',
				),
			);

		$data['id'] = 'u2';

		return $this->load->view('common/messagelist', $data);
	}
}