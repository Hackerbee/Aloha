<?php
class ModelSearchChat extends Model {
	public function addChat($user,$contact){
			if($contact > $user){
				$this->db->query("CREATE TABLE `achat`.`u" . $user . ":u" . $contact ."` ( `messgeId` INT(11) NOT NULL AUTO_INCREMENT , `sender` VARCHAR(40) NOT NULL , `time` DATETIME NOT NULL , `status` VARCHAR(40) NOT NULL , `message` VARCHAR(1024) NOT NULL, `messagetype` VARCHAR(15) , PRIMARY KEY (`messgeId`) )");
			}
			else
				$this->db->query("CREATE TABLE `achat`.`u" . $contact . ":u" . $user ."` ( `messgeId` INT(11) NOT NULL AUTO_INCREMENT , `sender` VARCHAR(40) NOT NULL , `time` DATETIME NOT NULL , `status` VARCHAR(40) NOT NULL , `message` VARCHAR(1024) NOT NULL, `messagetype` VARCHAR(15), PRIMARY KEY (`messgeId`) )");
			$this->db->query("INSERT INTO u" . $contact ."(contactId,status) VALUES ('" . $user . "' ,  'Unblocked')");
			$this->db->query("INSERT INTO u" .  $user ."(contactId,status) VALUES ('" . $contact . "' , 'Unblocked')");
			
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
			
			return true;
		}

	public function messageReceive($user,$text){
			$contacts = $this->db->query("SELECT contactId from u". $user)->rows;
			$data = array();
			foreach($contacts as $contact){
				if($contact['contactId'] > $user){
					$data[] = array('contactid' => $contact['contactId'],
									'messages' => $this->db->query("SELECT messgeId as id, message as text , messagetype as type, time as date, sender FROM `u" . $user . ":u" . $contact['contactId'] . "` ORDER BY time DESC LIMIT  20")->rows,
									);
					
				}
				else{
					$data[] = array('contactid' => $contact['contactId'],
									'messages' => $this->db->query("SELECT messgeId as id, message as text , messagetype as type, time as date, sender FROM `u" . $contact['contactId'] . ":u" . $user . "` ORDER BY time DESC LIMIT  20")->rows,
									);
				}
				
			}
			return $data;

	}

	public function messageReceiveNew($user,$text){
			$contacts = $this->db->query("SELECT contactId from u". $user)->rows;
			$data = array();
			foreach($contacts as $contact){
				if($contact['contactId'] > $user){
					$data[] = array('contactid' => $contact['contactId'],
									'messages' => $this->db->query("SELECT messgeId as id, message as text , messagetype as type, time as date, sender FROM `u" . $user . ":u" . $contact['contactId'] . "` WHERE sender = ".$contact['contactId']." AND status LIKE 'PENDING' ORDER BY time DESC LIMIT  20")->rows,
									);
					
				}
				else{
					$data[] = array('contactid' => $contact['contactId'],
									'messages' => $this->db->query("SELECT messgeId as id, message as text , messagetype as type, time as date, sender FROM `u" . $contact['contactId'] . ":u" . $user . "` WHERE sender = ".$contact['contactId']." AND status LIKE 'PENDING' ORDER BY time DESC LIMIT  20")->rows,
									);
				}
				
			}
			return $data;

	}

	public function messageReceiveNotify($user,$text) {
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

	public function messageDelete($user,$contact){
			if($contact > $user)
				$this->db->query("DELETE FROM `u" . $user . ":u" . $contact ."` WHERE 1");
			else
				$this->db->query("DELETE FROM `u" . $contact . ":u" . $user ."` WHERE 1");
			}
		


}
