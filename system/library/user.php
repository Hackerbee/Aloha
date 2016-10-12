<?php
class User {
	private $userid;
	private $username;
	private $password;
	private $email;
	private $status;

	public function __construct($registry) {
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');

		if (isset($this->session->data['userid'])) {
			$user_query = $this->db->query("SELECT * FROM users WHERE userid = '" . (int)$this->session->data['userid'] . "' AND status = '1'");

			if ($user_query->num_rows) {
				$this->userid = $user_query->row['userid'];
				$this->username = $user_query->row['username'];

				// $this->db->query("UPDATE " . DB_PREFIX . "user SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE userid = '" . (int)$this->session->data['userid'] . "'");
				
			} else {
				$this->logout();
			}
		}
	}

	public function login($username, $password) {
		$user_query = $this->db->query("SELECT * FROM users WHERE username = '" . $this->db->escape($username) . "' AND (password = SHA1('" . $this->db->escape(htmlspecialchars($password, ENT_QUOTES)) . "') OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1'");

		if ($user_query->num_rows) {
			$this->session->data['userid'] = $user_query->row['userid'];

			$this->userid = $user_query->row['userid'];
			$this->username = $user_query->row['username'];

			return true;
		} else {
			return false;
		}
	}

	public function logout() {
		unset($this->session->data['userid']);

		$this->userid = '';
		$this->username = '';
	}

	public function isLogged() {
		return $this->userid;
	}

	public function getId() {
		return $this->userid;
	}

	public function getUserName() {
		return $this->username;
	}
}
