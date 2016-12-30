<?php
class ModelSearchSearch extends Model {
	public function getUsers($filter = '',$id = 1) {
		$query = $this->db->query('SELECT userid,username FROM users WHERE username LIKE "%'.$this->db->escape($filter).'%" AND userid <> "'. $id . '" LIMIT 10');

		return $query->rows;
	}
}