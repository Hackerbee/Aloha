<?php
class ModelToolUpload extends Model {
	public function addUpload($name, $filename) {
		$code = sha1(uniqid(mt_rand(), true));

		$this->db->query("INSERT INTO `upload` SET `name` = '" . $this->db->escape($name) . "', `filename` = '" . $this->db->escape($filename) . "', `code` = '" . $this->db->escape($code) . "', `date_added` = NOW()");

		return $code;
	}

	public function getUploadByCode($code) {
		$query = $this->db->query("SELECT * FROM `upload` WHERE code = '" . $this->db->escape($code) . "'");

		return $query->row;
	}
	public function addUser($email,$password,$username){
			$this->db->query("INSERT INTO users (username,password,email,date_joined,userstate) VALUES ('" . $username . "' , '" . $password . "' , '" . $email . "' , NOW() , 'Online')");
			$userid = $this->db->query("SELECT userid FROM users WHERE email = '" . $email . "'")->row['userid'];
			$this->db->query("CREATE TABLE u" . $userid . " (contactId int, status varchar(10));");
		}
	public function findUser($username){
			return $this->db->query("SELECT count(userid) as no FROM users WHERE username = '" . $username . "'")->row['no'];
		}
	public function findUserEmail($email){
			return $this->db->query("SELECT count(userid) as no FROM users WHERE email = '" . $email . "'")->row['no'];
		}
}