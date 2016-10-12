<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		
		return $this->load->view('common/header');
	}
}
