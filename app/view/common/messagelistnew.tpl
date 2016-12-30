<?php foreach($rows as $row) { ?>
<?php krsort($row['messages']); ?>
	<?php   foreach($row['messages'] as $message) { ?>
	<?php		switch($message['type']) {
					case "date-separator":
						$wrapper = 'message-wrapper';
						$type = "date-separator";
						$date=date_create($message['date']);
						$data = date_format($date,"d-m-y");
						$flag = 0;
						break;

					case "text":
						$wrapper = 'message-wrapper';
						$type = "message";
						if($message['sender'] == $sender){
							$who = 'my-message';
							$sf = 1;
						} else {
							$who = 'other-message';
							$sf = 0;
						}
						$data = '<p>'.$message['text'].'</p>';
						$flag = 1;
						break;

					case "img":
						$wrapper = 'img-wrapper';
						$type = "img-box";
						if($message['sender'] == $sender){
							$who = 'my-img';
							$sf = 1;
						} else {
							$who = 'other-img';
							$sf = 0;
						}
						$data =	'<a href="'.$message['text'].'" download><img class="img-responsive"  src="'.$message['text'].'" /></a>';
						$flag = 1;
						break;

					case "doc":
						$wrapper = 'message-wrapper';
						$type = "doc-box";
						if($message['sender'] == $sender){
							$who = 'message my-message';
							$sf = 1;
						} else {
							$who = 'message other-message';
							$sf = 0;
						}
						$data = $data =	'<a href="'.$message['text'].'" download><i class="glyphicon glyphicon-file"  src="'.$message['text'].'" /></i>'.strtolower(substr(strrchr($message['text'], '/'), 1)).'</a>';
						$flag = 1;
						break;

					case "audio":
						$wrapper = 'message-wrapper';
						$type = "doc-box";
						if($message['sender'] == $sender){
							$who = 'message my-message';
							$sf = 1;
						} else {
							$who = 'message other-message';
							$sf = 0;
						}
						$data = $data =	'<a href="'.$message['text'].'" download><i class="glyphicon glyphicon-music"  src="'.$message['text'].'" /></i>'.strtolower(substr(strrchr($message['text'], '/'), 1)).'</a>';
						$flag = 1;
						break;

					default:
						echo "error<br/>";

				} ?>
					<li id="m<?php echo $message['id']; ?>" parent-id="<?php echo $row['contactid']; ?>" class="<?php echo $wrapper; ?> clearfix">
						<div class="<?php echo $type.' '.$who; ?>">
	<?php					echo $data; ?>
						</div>
	<?php			if($flag) { 
						if($sf) { ?>
							<div class="message-data">
								<span class="message-data-name"><?php echo $row['username']; ?><i class="message-data-time"><?php $date=date_create($message['date']); echo date_format($date,"H:i"); ?></i></span>
							</div>
	<?php				} else { ?>
							<div class="message-data">
								<span class="message-data-name"><i class="message-data-time"><?php $date=date_create($message['date']); echo date_format($date,"H:i"); ?></i><?php echo $row['username']; ?></span>
							</div>
	<?php   		}	
				} ?>
					</li>
	<?php	} ?>
<?php } ?>