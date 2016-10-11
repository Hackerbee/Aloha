<?php
class ControllerStartupStartup extends Controller {
	public function index() {
		// // Store
		// if ($this->request->server['HTTPS']) {
		// 	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "store WHERE REPLACE(`ssl`, 'www.', '') = '" . $this->db->escape('https://' . str_replace('www.', '', $_SERVER['HTTP_HOST']) . rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . '/') . "'");
		// } else {
		// 	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "store WHERE REPLACE(`url`, 'www.', '') = '" . $this->db->escape('http://' . str_replace('www.', '', $_SERVER['HTTP_HOST']) . rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . '/') . "'");
		// }
		
		// if (!$query->num_rows) {
			$this->config->set('config_url', HTTP_SERVER);
			$this->config->set('config_ssl', HTTPS_SERVER);
		// }
		
		// // Settings
		// $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "setting` WHERE store_id = '0' OR store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY store_id ASC");
		
		// foreach ($query->rows as $result) {
		// 	if (!$result['serialized']) {
		// 		$this->config->set($result['key'], $result['value']);
		// 	} else {
		// 		$this->config->set($result['key'], json_decode($result['value'], true));
		// 	}
		// }

		// Url
		$this->registry->set('url', new Url($this->config->get('config_url'), $this->config->get('config_ssl')));

		// Customer
		$customer = new Cart\Customer($this->registry);
		$this->registry->set('customer', $customer);

		// Encryption
		$this->registry->set('encryption', new Encryption($this->config->get('config_encryption')));				
	}
}
