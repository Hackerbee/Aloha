<?php
class ControllerToolUpload extends Controller {
	public function index() {
		$json = array();

		if (!empty($this->request->files['file']['name']) && is_file($this->request->files['file']['tmp_name'])) {
			// Sanitize the filename
			$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));

			// Validate the filename length
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 255)) {
				$json['error'] = 'error_filename';
			}

			// Allowed file extension types
			$allowed = array();

			$extension_allowed = preg_replace('~\r?\n~', "\n", "jpg\nbmp\njpeg\ntiff\ngif\npng");

			$filetypes = explode("\n", $extension_allowed);

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}

			if (!in_array(strtolower(substr(strrchr($filename, '.'), 1)), $allowed)) {
				$json['error'] = 'error_filetype';
			}

			// Allowed file mime types
			$allowed = array();

			$mime_allowed = preg_replace('~\r?\n~', "\n", "image/bmp\nimage/gif\nimage/x-icon\nimage/jpeg\nimage/png\nimage/tiff\n");

			$filetypes = explode("\n", $mime_allowed);

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}

			if (!in_array($this->request->files['file']['type'], $allowed)) {
				$json['error'] = 'error_filetype';
			}

			// Check to see if any PHP files are trying to be uploaded
			$content = file_get_contents($this->request->files['file']['tmp_name']);

			if (preg_match('/\<\?php/i', $content)) {
				$json['error'] ='error_filetype';
			}

			// Return any upload error
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] ='error_upload_' . $this->request->files['file']['error'];
			}
		} else {
			$json['error'] = 'Error while uploading!';
		}

		if (!$json) {
			$file = token(20) . '.' . strtolower(substr(strrchr($filename, '.'), 1));

			if(isset($this->request->get['path'])) {
				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_IMAGE . $this->request->get['path'] . '/' . $file);
				$dir = 'image/'.$this->request->get['path'].'/';
			} else {
				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_UPLOAD . $file);
				$dir = 'system/storage/upload/';
			}

			// Hide the uploaded file name so people can not link to it directly.
			$this->load->model('tool/upload');

			$json['code'] = $this->model_tool_upload->addUpload($filename, $file);
			$json['path'] = $dir.$file;
			$json['success'] = 'Uploaded Successfully!';
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function doc() {
		$json = array();

		if (!empty($this->request->files['file']['name']) && is_file($this->request->files['file']['tmp_name'])) {
			// Sanitize the filename
			$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));

			// Validate the filename length
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 255)) {
				$json['error'] = 'error_filename';
			}

			// Allowed file extension types
			$allowed = array();

			$extension_allowed = preg_replace('~\r?\n~', "\n", "doc\ndocx\npdf\nppt\npptx\nxls\nxlsx");

			$filetypes = explode("\n", $extension_allowed);

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}

			if (!in_array(strtolower(substr(strrchr($filename, '.'), 1)), $allowed)) {
				$json['error'] = 'error_filetype';
			}

			// // Allowed file mime types
			// $allowed = array();

			// $mime_allowed = preg_replace('~\r?\n~', "\n", "image/bmp\nimage/gif\nimage/x-icon\nimage/jpeg\nimage/png\nimage/tiff\n");

			// $filetypes = explode("\n", $mime_allowed);

			// foreach ($filetypes as $filetype) {
			// 	$allowed[] = trim($filetype);
			// }

			// if (!in_array($this->request->files['file']['type'], $allowed)) {
			// 	$json['error'] = 'error_filetype';
			// }

			// Check to see if any PHP files are trying to be uploaded
			$content = file_get_contents($this->request->files['file']['tmp_name']);

			if (preg_match('/\<\?php/i', $content)) {
				$json['error'] ='error_filetype';
			}

			// Return any upload error
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] ='error_upload_' . $this->request->files['file']['error'];
			}
		} else {
			$json['error'] = 'Error while uploading!';
		}

		if (!$json) {
			$file = token(20) . '.' . strtolower(substr(strrchr($filename, '.'), 1));

			if(isset($this->request->get['path'])) {
				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_IMAGE . $this->request->get['path'] . '/' . $file);
				$dir = 'image/'.$this->request->get['path'].'/';
			} else {
				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_UPLOAD . $file);
				$dir = 'system/storage/upload/';
			}

			// Hide the uploaded file name so people can not link to it directly.
			$this->load->model('tool/upload');

			$json['code'] = $this->model_tool_upload->addUpload($filename, $file);
			$json['path'] = $dir.$file;
			$json['success'] = 'Uploaded Successfully!';
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function audio() {
		$json = array();

		if (!empty($this->request->files['file']['name']) && is_file($this->request->files['file']['tmp_name'])) {
			// Sanitize the filename
			$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));

			// Validate the filename length
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 255)) {
				$json['error'] = 'error_filename';
			}

			// Allowed file extension types
			$allowed = array();

			$extension_allowed = preg_replace('~\r?\n~', "\n", "mp3\nm4a\nogg\n");

			$filetypes = explode("\n", $extension_allowed);

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}

			if (!in_array(strtolower(substr(strrchr($filename, '.'), 1)), $allowed)) {
				$json['error'] = 'error_filetype';
			}

			// // Allowed file mime types
			// $allowed = array();

			// $mime_allowed = preg_replace('~\r?\n~', "\n", "image/bmp\nimage/gif\nimage/x-icon\nimage/jpeg\nimage/png\nimage/tiff\n");

			// $filetypes = explode("\n", $mime_allowed);

			// foreach ($filetypes as $filetype) {
			// 	$allowed[] = trim($filetype);
			// }

			// if (!in_array($this->request->files['file']['type'], $allowed)) {
			// 	$json['error'] = 'error_filetype';
			// }

			// Check to see if any PHP files are trying to be uploaded
			$content = file_get_contents($this->request->files['file']['tmp_name']);

			if (preg_match('/\<\?php/i', $content)) {
				$json['error'] ='error_filetype';
			}

			// Return any upload error
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] ='error_upload_' . $this->request->files['file']['error'];
			}
		} else {
			$json['error'] = 'Error while uploading!';
		}

		if (!$json) {
			$file = token(20) . '.' . strtolower(substr(strrchr($filename, '.'), 1));

			if(isset($this->request->get['path'])) {
				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_IMAGE . $this->request->get['path'] . '/' . $file);
				$dir = 'image/'.$this->request->get['path'].'/';
			} else {
				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_UPLOAD . $file);
				$dir = 'system/storage/upload/';
			}

			// Hide the uploaded file name so people can not link to it directly.
			$this->load->model('tool/upload');

			$json['code'] = $this->model_tool_upload->addUpload($filename, $file);
			$json['path'] = $dir.$file;
			$json['success'] = 'Uploaded Successfully!';
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}