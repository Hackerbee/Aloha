<!-- Modernizr -->
	<!-- <script src="dist/js/modernizr/modernizr-2.6.2.min.js"></script> -->

	<!-- jQuery CDN -->
	<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->

	<!-- jQuery	-->
	<script>
		window.jQuery || document.write('<script src="dist/js/jquery/jquery-3.1.1.min.js"><\/script>')
	</script>

	<!-- Bootstrap	-->
	<script type="text/javascript" src="dist/js/bootstrap/bootstrap.min.js"></script>

	<!-- Custom	-->
	<script type="text/javascript">
	var Q = [];

function addmessage(val) {
	var id = $('.chip-open').attr('id');
	var d = new Date();
	var date = d.getHours() +':'+ d.getMinutes();
	$('ul#u'+id).append('<li id="sent" class="message-wrapper clearfix"> \
									<div class="message my-message"> \
										<p>'+val+'</p> \
									</div> \
									<div class="message-data"> \
										<i class="message-data-time">'+date+'</i> \
										<span class="message-data-name"></span> \
									</div> \
								</li>');
}

$('input[name="message"]').on('keypress',function(e) {
	if(e.which === 13) {
		var val = $(this).val();
		addmessage(val);
		$('.input-btn').trigger('click');
		$("#messagebody").animate({ scrollTop: $('#messagebody').prop("scrollHeight")}, 0);
	};
});
// var img = $('<img class="img-responsive" />').attr('src', json['path']).on('load',function(){ $('#loadimg').html(img); });

function toggleNav() {
	$('.sidenav').toggleClass('push-lg-3 push-md-3 push-sm-3 sidenav-closed sidenav-open');
	$('#main').toggleClass('col-lg-6 col-md-6 col-sm-6 col-lg-9 col-md-9 col-sm-9');
}

// var id = $('.chip').first().addClass('chip-open').attr('id');
// $('ul').not('.search-results').addClass('hidden');
// $('ul#u'+id).removeClass('hidden');

		$('i[id="upload-image"]').on('click', function() {
			var node = this;

			$('#form-upload').remove();

			$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

			$('#form-upload input[name=\'file\']').trigger('click');

			if (typeof timer != 'undefined') {
				clearInterval(timer);
			}

			timer = setInterval(function() {
				if ($('#form-upload input[name=\'file\']').val() != '') {
					clearInterval(timer);

					$.ajax({
						url: 'index.php?route=tool/upload&token=<?php echo $token; ?>',
						type: 'post',
						dataType: 'json',
						data: new FormData($('#form-upload')[0]),
						cache: false,
						contentType: false,
						processData: false,
						beforeSend: function() {
							$(node).toggleClass('glyphicon-picture glyphicon-refresh');
						},
						complete: function() {
							$(node).toggleClass('glyphicon-picture glyphicon-refresh');
						},
						success: function(json) {
							if (json['error']) {
								alert(json['error']);
							}
							if (json['success']) {
								alert(json['success']);
								Q.push(json['path']);
								Q.push(json['path']);
								Q.push(json['path']);
								addImage();
								sendImage();
								// setTimeout('addImage()',100);
								// setTimeout('sendImage()',100);
							}
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert('image upload '+thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});
				}
			}, 500);
		});

		$('i[id="upload-doc"]').on('click', function() {
			var node = this;

			$('#form-upload').remove();

			$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

			$('#form-upload input[name=\'file\']').trigger('click');

			if (typeof timer != 'undefined') {
				clearInterval(timer);
			}

			timer = setInterval(function() {
				if ($('#form-upload input[name=\'file\']').val() != '') {
					clearInterval(timer);

					$.ajax({
						url: 'index.php?route=tool/upload/doc&token=<?php echo $token; ?>',
						type: 'post',
						dataType: 'json',
						data: new FormData($('#form-upload')[0]),
						cache: false,
						contentType: false,
						processData: false,
						beforeSend: function() {
							$(node).toggleClass('glyphicon-file glyphicon-refresh');
						},
						complete: function() {
							$(node).toggleClass('glyphicon-file glyphicon-refresh');
						},
						success: function(json) {
							if (json['error']) {
								alert(json['error']);
							}
							if (json['success']) {
								alert(json['success']);
								Q.push(json['path']);
								Q.push(json['path']);
								Q.push(json['path']);
								addDoc();
								sendDoc();
								// setTimeout('addImage()',100);
								// setTimeout('sendImage()',100);
							}
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert('image upload '+thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});
				}
			}, 500);
		});

		$('i[id="upload-audio"]').on('click', function() {
			var node = this;

			$('#form-upload').remove();

			$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

			$('#form-upload input[name=\'file\']').trigger('click');

			if (typeof timer != 'undefined') {
				clearInterval(timer);
			}

			timer = setInterval(function() {
				if ($('#form-upload input[name=\'file\']').val() != '') {
					clearInterval(timer);

					$.ajax({
						url: 'index.php?route=tool/upload/audio&token=<?php echo $token; ?>',
						type: 'post',
						dataType: 'json',
						data: new FormData($('#form-upload')[0]),
						cache: false,
						contentType: false,
						processData: false,
						beforeSend: function() {
							$(node).toggleClass('glyphicon-music glyphicon-refresh');
						},
						complete: function() {
							$(node).toggleClass('glyphicon-music glyphicon-refresh');
						},
						success: function(json) {
							if (json['error']) {
								alert(json['error']);
							}
							if (json['success']) {
								alert(json['success']);
								Q.push(json['path']);
								Q.push(json['path']);
								Q.push(json['path']);
								addAudio();
								sendAudio();
								// setTimeout('addImage()',100);
								// setTimeout('sendImage()',100);
							}
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert('image upload '+thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});
				}
			}, 500);
		});

function addImage() {
	var src = Q.pop();
	alert("add image "+src);
	var id = $('.chip-open').attr('id');
	var d = new Date();
	var date = d.getHours() +':'+ d.getMinutes();
	$('ul#u'+id).append('<li id="sent" class="img-wrapper clearfix"> \
									<div class="img-box my-img"> \
										<a href="'+src+'" download> \
											<img class="img-responsive"  src="'+src+'" /> \
										</a> \
									</div> \
									<div class="message-data"> \
										<i class="message-data-time">'+date+'</i> \
										<span class="message-data-name"></span> \
									</div> \
								</li>');

}
function addDoc() {
	var src = Q.pop();
	var filename = src.substring(src.lastIndexOf('/'));
	alert("add doc "+src);
	var id = $('.chip-open').attr('id');
	var d = new Date();
	var date = d.getHours() +':'+ d.getMinutes();
	$('ul#u'+id).append('<li id="sent" class="message-wrapper clearfix"> \
									<div class="doc-box message my-message"> \
										<a href="'+src+'" download> \
											<i class="glyphicon glyphicon-file"></i> \
											 '+ filename +' \
										</a> \
									</div> \
									<div class="message-data"> \
										<i class="message-data-time">'+date+'</i> \
										<span class="message-data-name"></span> \
									</div> \
								</li>');

}
function addAudio() {
	var src = Q.pop();
	var filename = src.substring(src.lastIndexOf('/'));
	alert("add doc "+src);
	var id = $('.chip-open').attr('id');
	var d = new Date();
	var date = d.getHours() +':'+ d.getMinutes();
	$('ul#u'+id).append('<li id="sent" class="message-wrapper clearfix"> \
									<div class="doc-box message my-message"> \
										<a href="'+src+'" download> \
											<i class="glyphicon glyphicon-music"></i> \
											 '+ filename +' \
										</a> \
									</div> \
									<div class="message-data"> \
										<i class="message-data-time">'+date+'</i> \
										<span class="message-data-name"></span> \
									</div> \
								</li>');

}
		$('input#usersearch').on('keyup',function() {
			var e = $('input#usersearch').val();
			var id = <?php echo $userid; ?>;
			$.ajax({
				url:'<?php echo $search; ?>&q='+e+'&id='+id,
				type: 'GET',
				datatype: 'json',
				beforeSend: function() {
					$('ul.search-results').html('');
				},
				success: function(data) {
					$('ul.search-results').html(data);
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert('Ajax error' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});

		function addContact(id) {
			var q = <?php echo $userid; ?>;
			// alert(id+' '+q);
			$.ajax({
				url:'<?php echo $addchat; ?>&q='+q+'&id='+ id,
				type: 'GET',
				success: function(data) {
					// alert('success');
				},
				error: function(xhr, ajaxOptions, thrownError) {
					// alert('Ajax error contact add' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		};

		$('.input-btn').on('click',function() {
			var message = $('input[name="message"]').val();
			
			var receiverid = $('.chip-open').attr('id');
			var senderid = <?php echo $userid; ?>;
			$.ajax({
				url:'<?php echo $messagesent; ?>&type=text&send='+senderid+'&receive='+receiverid,
				type: 'GET',
				datatype: 'json',
				data: { 'messagesent': message },
				beforeSend: function() {
					$('ul.search-results').html('');
					$('input[name="message"]').val('');
				},
				success: function(data) {
					// alert('message sent');
					// $('input[name="message"]').val('');
				},
				error: function(xhr, ajaxOptions, thrownError) {
					// alert('Ajax error message send' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});

		function sendImage() {
			var message = Q.pop();
			
			var receiverid = $('.chip-open').attr('id');
			var senderid = <?php echo $userid; ?>;
			$.ajax({
				url:'<?php echo $messagesent; ?>&type=img&send='+senderid+'&receive='+receiverid+'&messagesent='+message,
				type: 'GET',
				datatype: 'json',
				// data: { 'messagesent': message},
				beforeSend: function() {
					$('ul.search-results').html('');
					$('input[name="message"]').val('');
				},
				success: function(json) {
					alert(message);
					// $('input[name="message"]').val('');
				},
				error: function(xhr, ajaxOptions, thrownError) {
					// alert('Ajax error image send' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		};

		function sendDoc() {
			var message = Q.pop();
			var receiverid = $('.chip-open').attr('id');
			var senderid = <?php echo $userid; ?>;
			$.ajax({
				url:'<?php echo $messagesent; ?>&type=doc&send='+senderid+'&receive='+receiverid+'&messagesent='+message,
				type: 'GET',
				datatype: 'json',
				// data: { 'messagesent': message},
				beforeSend: function() {
					$('ul.search-results').html('');
					$('input[name="message"]').val('');
				},
				success: function(json) {
					alert(message);
					// $('input[name="message"]').val('');
				},
				error: function(xhr, ajaxOptions, thrownError) {
					// alert('Ajax error doc send' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		};
		function sendAudio() {
			var message = Q.pop();
			var receiverid = $('.chip-open').attr('id');
			var senderid = <?php echo $userid; ?>;
			$.ajax({
				url:'<?php echo $messagesent; ?>&type=audio&send='+senderid+'&receive='+receiverid+'&messagesent='+message,
				type: 'GET',
				datatype: 'json',
				// data: { 'messagesent': message},
				beforeSend: function() {
					$('ul.search-results').html('');
					$('input[name="message"]').val('');
				},
				success: function(json) {
					alert(message);
					// $('input[name="message"]').val('');
				},
				error: function(xhr, ajaxOptions, thrownError) {
					// alert('Ajax error doc send' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		};
		function chatlist() {
			var id = $('.chip-open').attr('id');
			$.ajax({
				url: '<?php echo $chatlist; ?>&q='+id,
				type: 'GET',
				datatype: 'html',
				success: function(response) {
					$('#chatlist').html(response);
					$('.chip').bind('click',function() {
						$('.chip-open').removeClass('chip-open');
						$(this).addClass('chip-open').removeClass('new-message');
						$('ul').not('.search-results').addClass('hidden');
						$('ul#u'+$(this).attr('id')).removeClass('hidden');
						$('.nav-name').text($('#' + $(this).attr('id') + ' > i').text());
					});

					// alert('Done!');
				},
				error: function(xhr, ajaxOptions, thrownError) {
					$('ul#u'+id+' li#sent:last').remove();

					// alert('Ajax error chat list' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		};

		function messagelist() {
			$.ajax({
				url: '<?php echo $messagereceive; ?>&q=',
				type: 'GET',
				datatype: 'html',
				success: function(response) {
					// $("#messagebody").animate({ scrollTop: $('#messagebody').prop("scrollHeight")}, 100);
					$('ul#new').html(response);
					$('ul#new > li').each( function() {
						var parent = $(this).attr('parent-id');
						$(this).clone().appendTo('ul#'+parent);
						$(this).remove();
					});
				},
				error: function(xhr, ajaxOptions, thrownError) {
					// alert('Ajax error messagelist' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		};

		$('.chip').first().addClass('chip-open');
		var id = $('.chip').first().attr('id');
		$('ul').not('.search-results').addClass('hidden');
		$('ul#u'+id).removeClass('hidden');
		$("#messagebody").animate({ scrollTop: $('#messagebody').prop("scrollHeight")}, 100);
		chatlist();
		messagelist();

	chatlistid = setInterval('chatlist()',1500);
	messagelistid = setInterval('messagelist()',1500);

		$(window).on('beforeunload', function() {
			clearInterval(chatlistid);
			clearInterval(messagelistid);
		});
	</script>
	
</body>

</html>
