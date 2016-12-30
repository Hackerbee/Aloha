<?php
class ModelToolOnline extends Model {
	public function addOnline($ip, $user_id, $url, $referer) {
		$this->db->query("DELETE FROM `users_online` WHERE date_added < '" . date('Y-m-d H:i:s', strtotime('-3 second')) . "'");

		$flag = $this->db->query("SELECT COUNT(userid) AS c FROM `users_online` WHERE `userid` = '" . (int)$user_id ."'")->row['c'];

		if($flag > 0) {
			$this->db->query("UPDATE `users_online` SET `ip` = '" . $this->db->escape($ip) . "', `url` = '" . $this->db->escape($url) . "', `referer` = '" . $this->db->escape($referer) . "', `date_added` = '" . $this->db->escape(date('Y-m-d H:i:s')) . "' WHERE `userid` = " . (int)$user_id );
		} else {
			$this->db->query("INSERT INTO `users_online` VALUES ('" . $this->db->escape($ip) . "'," . (int)$user_id . ",'" . $this->db->escape($url) . "','" . $this->db->escape($referer) . "','" . $this->db->escape(date('Y-m-d H:i:s')) ."')");
		}

		// $this->db->query("UPDATE `users` SET `userstate` = 'Online' WHERE `userid` = '" . (int)$user_id . "'");
	}

	public function isOnline($user_id = 0) {
		return $this->db->query("SELECT COUNT(userid) AS c FROM `users_online` WHERE `userid` = ".(int)$user_id)->row['c'];
	}

	public function getOnlineContacts($user_id = 0) {
		$results = $this->db->query("SELECT `users_online`.`userid` AS online FROM `users_online` LEFT JOIN `u".(int)$user_id."` ON `users_online`.`userid` = `u".(int)$user_id."`.`contactId`")->rows;
		
		foreach ($results as $result) {
			$online[] = $result['online'];
		}

		return $online;
	}
}
	