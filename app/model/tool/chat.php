<?php
class ModelToolChat extends Model  {
		public function setDelivered($user){
			$contacts = $this->db->query("SELECT contact u". $user)->rows;
			foreach($contacts as $contact){
			if($contact['contactId'] > $user)
				$this->db->query("UPDATE u" . $user . ":u" . $contact ." SET status = 'DELIVERED' ");
			else
				$this->db->query("UPDATE u" . $contact . ":u" . $user  ." SET status = 'DELIVERED' ");
			}
			return true;
		}

		public function getChat($user){
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

		public function getContacts($user){
			return $this->db->query("SELECT contactId FROM u". $user)->rows;
			}

		public function messageSent($user,$message,$contact){
			if($contact['contactId'] > $user) {
				$this->db->query("INSERT INTO u" .  $user . ":u" . $contact ."(sender,message,time,status) VALUES ('" . $user . "' , '" . $message . "' , NOW() , 'PENDING')");
			} else {
				$this->db->query("INSERT INTO u" . $contact . ":u" . $user ."(sender,message,time,status) VALUES ('" . $user . "' , '" . $message . "' , NOW() , 'PENDING')");
			}
			return true;
		}

		public function messageDelete($user,$messageId,$contact){
			if($contact['contactId'] > $user) {
				$this->db->query("DELETE FROM u" . $user . ":u" . $contact ."WHERE messageId = " . $messageId);
			} else {
				$this->db->query("DELETE FROM u" . $contact . ":u" . $user ."WHERE messageId = " . $messageId);
			}
			return true;
		}

		public function addChat($user,$contact){
			if($contact['contactId'] > $user) {
				$this->db->query("CREATE TABLE u" . $user . ":u" . $contact ."(messageId int NOT NULL AUTO_INCREMENT, sender varchar(40), message varchar(1024), time DATETIME, status varchar(15)))");
			} else {
				$this->db->query("CREATE TABLE u" . $contact . ":u" . $user ."(messageId int NOT NULL AUTO_INCREMENT, sender varchar(40), message varchar(1024), time DATETIME,  status varchar(15)))");
			}
			return true;
		}

		public function addContact($contactid) {
			return $this->db->query("INSERT INTO u" .  $user . "(contactId,status) VALUES ('" . $contactid . "' , 'Unblocked')")->getLastId();
		}

		public function getContactName($id = 0) {
			return $this->db->query('SELECT username FROM users WHERE userid ='.$id)->row['username'];
		}

		public function getChatMessage($user,$contact){
				if($contact > $user)
					$data[] = $this->db->query("SELECT * FROM u" . $user . ":u" . $contact)->rows;
				else
					$data[] = $this->db->query("SELECT * FROM u" . $contact . ":u" . $user)->rows;
	
			return $data;
		}


	}
?>