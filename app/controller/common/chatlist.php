<?php
class ControllerCommonChatlist extends Controller {
	public function index() {
		$data['chatheads'] = array(
			array(
				'id' => 'u1',
				'src' => 'dist/img/img_avatar.png',
				'name' => 'Oliver Queen',
				),
			array(
				'id' => 'u2',
				'src' => 'dist/img/img_avatar2.png',
				'name' => 'Laurel Lance',
				),
			array(
				'id' => 'u3',
				'src' => 'dist/img/img_avatar.png',
				'name' => 'Felicity Smoak',
				),
			);

		return $this->load->view('common/chatlist',$data);
	}
}