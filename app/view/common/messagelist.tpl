<ul id="<?php echo $id; ?>" class="container-fluid">
	<?php foreach($messages as $message) { ?>
		<li class="message-wrapper clearfix"> 
	<?php	switch($message['type']) {
				case "date-separator":
					echo '<div class="date-separator">'.$message['text'].'</div>';
					break;
				case "me":
					echo '<div class="message my-message">
								<p>'.$message['text'].'</p>
							</div>
							<div class="message-data">
								<i class="message-data-time">'.$message['time'].'</i>
								<span class="message-data-name">'.$message['name'].'</span>
							</div>';
					break;
				case "other":
					echo '<div class="message other-message push-right">
								<p>'.$message['text'].'</p>
							</div>
							<div class="message-data">
								<i class="message-data-time">'.$message['time'].'</i>
								<span class="message-data-name">'.$message['name'].'</span>
							</div>';
					break;
				default:
					echo "error<br/>";
		}
	} ?>
</ul>