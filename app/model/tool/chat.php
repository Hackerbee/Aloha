<?php
class ModelToolChat extends Model  {
	public function addChat($user,$contact){
		if($contact > $user) {
			$this->db->query("CREATE TABLE `achat`.`u" . $user . ":u" . $contact ."` ( `messgeId` INT(11) NOT NULL AUTO_INCREMENT , `sender` VARCHAR(40) NOT NULL , `time` DATETIME NOT NULL , `status` VARCHAR(40) NOT NULL , `message` VARCHAR(1024) NOT NULL, `messagetype` VARCHAR(15) , PRIMARY KEY (`messgeId`) )");
		}
		else
			$this->db->query("CREATE TABLE `achat`.`u" . $contact . ":u" . $user ."` ( `messgeId` INT(11) NOT NULL AUTO_INCREMENT , `sender` VARCHAR(40) NOT NULL , `time` DATETIME NOT NULL , `status` VARCHAR(40) NOT NULL , `message` VARCHAR(1024) NOT NULL, `messagetype` VARCHAR(15), PRIMARY KEY (`messgeId`) )");
		$this->db->query("INSERT INTO u" . $contact ."(contactId,status) VALUES ('" . $user . "' ,  'Unblocked')");
		$this->db->query("INSERT INTO u" .  $user ."(contactId,status) VALUES ('" . $contact . "' , 'Unblocked')");
	}

	public function setDelivered($user){
		$contacts = $this->db->query("SELECT contact u". $user)->rows;
		foreach($contacts as $contact) {
		if($contact['contactId'] > $user)
			$this->db->query("UPDATE u" . $user . ":u" . $contact ." SET status = 'DELIVERED' ");
		else
			$this->db->query("UPDATE u" . $contact . ":u" . $user  ." SET status = 'DELIVERED' ");
		}
		return true;
	}

	public function getChat($user) {
		$contacts = $this->db->query("SELECT contact u". $user)->rows;
		$data = array();
		foreach($contacts as $contact){
			if($contact['contactId'] > $user)
				$data[$contact['contactId']] = $this->db->query("SELECT * from u" . $user . ":u" . $contact);
			else
				$data[$contact['contactId']] = $this->db->query("SELECT * from u" . $contact . ":u" . $user);
			
		}
		return $data;
	}

	public function getContacts($user) {
		return $this->db->query("SELECT contactId FROM u". $user)->rows;
		}

	public function getContactNumber($user,$contact){
		return $this->db->query("SELECT count(contactId) AS no FROM `u". $user . "` WHERE contactId = '" . $contact . "'")->row['no'];
		}

	public function messageSent($user,$message,$contact,$type){
		if($contact > $user){
			$this->db->query("INSERT INTO `u" .  $user . ":u" . $contact ."` (sender,message,time,status,messagetype) VALUES ('" . $user . "' , '" . $message . "' , NOW() , 'PENDING' , '" . $type . "' )");
		}
		else{
			$this->db->query("INSERT INTO `u" . $contact . ":u" . $user ."` (sender,message,time,status,messagetype) VALUES ('" . $user . "' , '" . $message . "' , NOW() , 'PENDING' , '" . $type . "' )");
		}
		return $this->db->getLastId();
	}

	public function messageDelete($user,$contact){
		if($contact > $user) {
			$this->db->query("TRUNCATE `u" . $user . ":u" . $contact ."`");
		} else {
			$this->db->query("TRUNCATE `u" . $contact . ":u" . $user ."`");
		}
		return true;
	}

	public function addContact($contactid) {
		return $this->db->query("INSERT INTO u" .  $user . "(contactId,status) VALUES ('" . $contactid . "' , 'Unblocked')")->getLastId();
	}

	public function getContactName($id = 0) {
		return $this->db->query('SELECT username FROM users WHERE userid ='.$id)->row['username'];
	}

	public function messageReceive($user){
		$contacts = $this->db->query("SELECT contactId from u". $user)->rows;
		$data = array();
		foreach($contacts as $contact){
			if($contact['contactId'] > $user){
				$data[] = array('contactid' => $contact['contactId'],
								'username' 	=> $this->getUserById($contact['contactId']),
								'messages' => $this->db->query("SELECT messgeId as id, message as text , messagetype as type, time as date, sender FROM `u" . $user . ":u" . $contact['contactId'] . "` ORDER BY time DESC LIMIT  20")->rows,
								);
				
			}
			else{
				$data[] = array('contactid' => $contact['contactId'],
								'username' 	=> $this->getUserById($contact['contactId']),
								'messages' => $this->db->query("SELECT messgeId as id, message as text , messagetype as type, time as date, sender FROM `u" . $contact['contactId'] . ":u" . $user . "` ORDER BY time DESC LIMIT  20")->rows,
								);
			}
			
		}
		return $data;
	}

	public function messageReceiveNew($user){
		$contacts = $this->db->query("SELECT contactId from u". $user)->rows;
		$data = array();
		foreach($contacts as $contact){
			if($contact['contactId'] > $user){
				$data[] = array('contactid' => $contact['contactId'],
								'username' 	=> $this->getUserById($contact['contactId']),
								'messages' 	=> $this->db->query("SELECT messgeId as id, message as text , messagetype as type, time as date, sender FROM `u" . $user . ":u" . $contact['contactId'] . "` WHERE sender = ".$contact['contactId']." AND status LIKE 'PENDING' ORDER BY time DESC LIMIT  20")->rows,
								);
				
			}
			else{
				$data[] = array('contactid' => $contact['contactId'],
								'username' 	=> $this->getUserById($contact['contactId']),
								'messages' 	=> $this->db->query("SELECT messgeId as id, message as text , messagetype as type, time as date, sender FROM `u" . $contact['contactId'] . ":u" . $user . "` WHERE sender = ".$contact['contactId']." AND status LIKE 'PENDING' ORDER BY time DESC LIMIT  20")->rows,
								);
			}
			
		}
		return $data;
	}

	public function messageReceiveNotify($user) {
		$contacts = $this->db->query("SELECT contactId from u". $user)->rows;
		foreach($contacts as $contact){
			if($contact['contactId'] > $user){
				$this->db->query("UPDATE `u" . $user . ":u" . $contact['contactId'] . "` SET status = 'RECEIVED' WHERE sender = ".$contact['contactId']." AND status LIKE 'PENDING'");
				
			}
			else{
				$this->db->query("UPDATE `u" . $contact['contactId'] . ":u" . $user . "` SET status = 'RECEIVED' WHERE sender = ".$contact['contactId']." AND status LIKE 'PENDING'");
			}
		}
	}
		
	public function getUserById($id = 0) {
		$query = $this->db->query('SELECT username FROM users WHERE userid = "'. $id . '" LIMIT 1');

		return $query->row['username'];
	}
}
?>