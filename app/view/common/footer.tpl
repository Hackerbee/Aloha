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
<script type="text/javascript" src="dist/js/ajaxmanager.js"></script>
<script type="text/javascript" src="dist/js/clipboard/clipboard.min.js"></script>

<!-- Custom	-->
<script type="text/javascript">
/* ========================================================================================================
    	Initial / on Pageload
======================================================================================================== */
	var Q = [];
	var queue = new $.AjaxQueue();
	
	$(document).ready(function() {
		$('body').addClass('loaded');
		$('#inputpanel').find('.row:first-child').hide();
		$("#messagebody").animate({ scrollTop: $('#messagebody').prop("scrollHeight")}, 150);
		chatlistid = setInterval(chatlist,2000);
		messagelistid = setInterval(messagelist,2000);
	});

	var f = $('.chip').first();
	f.addClass('chip-open');
	var id = f.attr('id');
	var status = f.hasClass('online');
	$('ul').not('.search-results').addClass('hidden');
	$('ul#chat'+id).removeClass('hidden');
	$('.nav-name').text($('#' + id + ' > i').text());
	if (status) {
		$('.nav-status').text('Online');
	} else {
		$('.nav-status').text('Offline');
	}
/* ========================================================================================================
        Inputpanel
======================================================================================================== */

	$('i[id="upload-image"]').on('click', function() {
		var node = this;

		$('#form-upload').remove();

		$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" accept="image/*" /></form>');

		var fileinput = $('#form-upload input[name=\'file\']');
		fileinput.trigger('click');

		if (typeof timer != 'undefined') {
			clearInterval(timer);
		}

		timer = setInterval(function() {
			if (fileinput.val() != '') {
				clearInterval(timer);
				queue.add({
					url: 'index.php?route=tool/upload&token=<?php echo $token; ?>',
					type: 'post',
					dataType: 'json',
					data: new FormData($('#form-upload')[0]),
					cache: false,
					contentType: false,
					processData: false,
					xhr: function() {
						var xhr = $.ajaxSettings.xhr();
						if (xhr.upload) {
							xhr.upload.addEventListener('progress', function(e) {
								if (e.lengthComputable) {
									var percentComplete = Math.floor(e.loaded / e.total * 100);
									$('#percentage').html(percentComplete+'%');
									$('progress').attr('value',percentComplete);
								}
							}, false);
						} else {
							console.log('xhr.upload false');
						}
						return xhr;
					},
					beforeSend: function() {
						clearInterval(chatlistid);
						clearInterval(messagelistid);

						// $('progress').show();
						var str = fileinput.val().replace(/:|\\/gi,'_');
						$('#filename').html(str.substring(str.lastIndexOf('_')+1));
						$(node).toggleClass('glyphicon-picture glyphicon-refresh');
					},
					complete: function() {
						$(node).toggleClass('glyphicon-picture glyphicon-refresh');
						$('#filename').html('');
						$('#percentage').html('');
						// $('progress').hide();

						chatlistid = setInterval(chatlist,2000);
						messagelistid = setInterval(messagelist,2000);
					},
					success: function(json) {
						if (json['error']) {
							alert(json['error']);
						}
						if (json['success']) {
							alert(json['success']);
							Q.push(json['path']);
							Q.push(json['path']);
							addImage();
							sendImage();
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

		$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" accept="*/*" /></form>');
		var fileinput = $('#form-upload input[name=\'file\']');
		fileinput.trigger('click');

		if (typeof timer != 'undefined') {
			clearInterval(timer);
		}

		timer = setInterval(function() {
			if (fileinput.val() != '') {
				clearInterval(timer);

				queue.add({
					url: 'index.php?route=tool/upload/doc&token=<?php echo $token; ?>',
					type: 'post',
					dataType: 'json',
					data: new FormData($('#form-upload')[0]),
					cache: false,
					contentType: false,
					processData: false,
					xhr: function() {
						var xhr = $.ajaxSettings.xhr();
						if (xhr.upload) {
							xhr.upload.addEventListener('progress', function(e) {
								if (e.lengthComputable) {
									var percentComplete = Math.floor(e.loaded / e.total * 100);
									$('#percentage').html(percentComplete+'%');
									$('progress').attr('value',percentComplete);
								}
							}, false);
						} else {
							console.log('xhr.upload false');
						}
						return xhr;
					},
					beforeSend: function() {
						clearInterval(chatlistid);
						clearInterval(messagelistid);

						// $('progress').show();
						var str = fileinput.val().replace(/:|\\/gi,'_');
						$('#filename').html(str.substring(str.lastIndexOf('_')+1));
						$(node).toggleClass('glyphicon-file glyphicon-refresh');
					},
					complete: function() {
						$(node).toggleClass('glyphicon-file glyphicon-refresh');
						$('#filename').html('');
						$('#percentage').html('');
						// $('progress').hide();

						chatlistid = setInterval(chatlist,2000);
						messagelistid = setInterval(messagelist,2000);
					},
					success: function(json) {
						if (json['error']) {
							alert(json['error']);
						}
						if (json['success']) {
							alert(json['success']);
							Q.push(json['path']);
							Q.push(json['path']);
							addDoc();
							sendDoc();
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

		$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file"  accept="audio/*" /></form>');
		var fileinput = $('#form-upload input[name=\'file\']');
		fileinput.trigger('click');

		if (typeof timer != 'undefined') {
			clearInterval(timer);
		}

		timer = setInterval(function() {
			if (fileinput.val() != '') {
				clearInterval(timer);

				queue.add({
					url: 'index.php?route=tool/upload/audio&token=<?php echo $token; ?>',
					type: 'post',
					dataType: 'json',
					data: new FormData($('#form-upload')[0]),
					cache: false,
					contentType: false,
					processData: false,
					xhr: function() {
						var xhr = $.ajaxSettings.xhr();
						if (xhr.upload) {
							xhr.upload.addEventListener('progress', function(e) {
								if (e.lengthComputable) {
									var percentComplete = Math.floor(e.loaded / e.total * 100);
									$('#percentage').html(percentComplete+'%');
									$('progress').attr('value',percentComplete);
								}
							}, false);
						} else {
							console.log('xhr.upload false');
						}
						return xhr;
					},
					beforeSend: function() {
						clearInterval(chatlistid);
						clearInterval(messagelistid);

						// $('progress').show();
						var str = fileinput.val().replace(/:|\\/gi,'_');
						$('#filename').html(str.substring(str.lastIndexOf('_')+1));
						$(node).toggleClass('glyphicon-music glyphicon-refresh');
					},
					complete: function() {
						$(node).toggleClass('glyphicon-music glyphicon-refresh');
						$('#filename').html('');
						$('#percentage').html('');
						// $('progress').hide();

						chatlistid = setInterval(chatlist,2000);
						messagelistid = setInterval(messagelist,2000);
					},
					success: function(json) {
						if (json['error']) {
							alert(json['error']);
						}
						if (json['success']) {
							alert(json['success']);
							Q.push(json['path']);
							Q.push(json['path']);
							addAudio();
							sendAudio();
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert('image upload '+thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		}, 500);
	});

	function addmessage() {
		var val = Q.pop();
		var id = Q.pop();
		var chatid = $('.chip-open').attr('id');
		var d = new Date();
		var date = d.getHours() +':'+ d.getMinutes();
		$('ul#chat'+chatid).append('<li id="m'+id+'" class="message-wrapper clearfix"><div class="message my-message"><p>'+val+'</p></div><div class="message-data"><span class="message-data-name"><i class="message-data-time">'+date+'</i></span></div></li>');
	}

	function addImage() {
		var src = Q.pop();
		alert("add image "+src);
		var id = $('.chip-open').attr('id');
		var d = new Date();
		var date = d.getHours() +':'+ d.getMinutes();
		$('ul#chat'+id).append('<li id="sent" class="img-wrapper clearfix"><div class="img-box my-img"><a href="'+src+'" download><img class="img-responsive"  src="'+src+'" /></a></div><div class="message-data"><span class="message-data-name"><i class="message-data-time">'+date+'</i></span></div></li>');
	}

	function addDoc() {
		var src = Q.pop();
		var filename = src.substring(src.lastIndexOf('/')+1);
		alert("add doc "+src);
		var id = $('.chip-open').attr('id');
		var d = new Date();
		var date = d.getHours() +':'+ d.getMinutes();
		$('ul#chat'+id).append('<li id="sent" class="message-wrapper clearfix"><div class="doc-box message my-message"><a href="'+src+'" download><i class="glyphicon glyphicon-file"></i>'+ filename +'</a></div><div class="message-data"><span class="message-data-name"><i class="message-data-time">'+date+'</i></span></div></li>');
	}

	function addAudio() {
		var src = Q.pop();
		var filename = src.substring(src.lastIndexOf('/')+1);
		alert("add doc "+src);
		var id = $('.chip-open').attr('id');
		var d = new Date();
		var date = d.getHours() +':'+ d.getMinutes();
		$('ul#chat'+id).append('<li id="sent" class="message-wrapper clearfix"><div class="doc-box message my-message"><a href="'+src+'" download><i class="glyphicon glyphicon-music"></i>'+ filename +'</a></div><div class="message-data"><span class="message-data-name"><i class="message-data-time">'+date+'</i></span></div></li>');
	}

/* ========================================================================================================
        Chatpanel
======================================================================================================== */
	$('input[name="message"]').on('keypress',function(e) {
		if(e.which === 13) {
			var val = $(this).val();
			$('#send-btn').trigger('click');
		};
	});

	$('#options-btn').click(function(e) {
		e.preventDefault();
		$('#inputpanel').find('.row:first-child').toggle('fast');
	});

	$('#send-btn').on('click',function() {
		var message = $('input[name="message"]').val();
		
		var receiverid = $('.chip-open').attr('id');
		var senderid = <?php echo $userid; ?>;
		queue.add({
			url:'<?php echo $messagesent; ?>&type=text&send='+senderid+'&receive='+receiverid,
			type: 'GET',
			datatype: 'text',
			data: { 'messagesent': message },
			beforeSend: function() {
				$('ul.search-results').html('');
				$('input[name="message"]').val('');
			},
			success: function(data) {
				Q.push($.trim(data));
				Q.push(message);
				addmessage();
				$("#messagebody").animate({ scrollTop: $('#messagebody').prop("scrollHeight")}, 0);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert('Ajax error message send' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});

	function sendImage() {
		var message = Q.pop();
		
		var receiverid = $('.chip-open').attr('id');
		var senderid = <?php echo $userid; ?>;
		queue.add({
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
				alert('Ajax error image send' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	};

	function sendDoc() {
		var message = Q.pop();
		var receiverid = $('.chip-open').attr('id');
		var senderid = <?php echo $userid; ?>;
		queue.add({
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
				alert('Ajax error doc send' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	};
	function sendAudio() {
		var message = Q.pop();
		var receiverid = $('.chip-open').attr('id');
		var senderid = <?php echo $userid; ?>;
		queue.add({
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
				alert('Ajax error doc send' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	};

/* ========================================================================================================
        UserSearch
======================================================================================================== */

	$('input#usersearch').blur(function() {
		$('ul.search-results').html('');
	});

	$('input#usersearch').on('keyup',function() {
		var e = $('input#usersearch').val();
		var id = <?php echo $userid; ?>;
		queue.add({
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
		queue.add({
			url:'<?php echo $addchat; ?>&q='+q+'&id='+ id,
			type: 'GET',
			success: function(data) {
				alert('success');
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert('Ajax error contact add' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	};

	// image defer load
	// var img = $('<img class="img-responsive" />').attr('src', json['path']).on('load',function(){ $('#loadimg').html(img); });

	function toggleNav() {
		$('.sidenav').toggleClass('push-lg-3 push-md-3 push-sm-3 sidenav-closed sidenav-open');
		$('#main').toggleClass('col-lg-6 col-md-6 col-sm-6 col-lg-9 col-md-9 col-sm-9');
	}

	function deferLoad() {
		$('#chatlist img').each(function() {
			var i = $(this);
			i.attr('src',i.data('src'));
		});
	}
	function chatlist() {
		var id = $('.chip-open').attr('id');
		if (id === undefined) id = null;
		var onids = $('#chatlist input[name=onnline]').serialize().replace(/&online=/gi,',');
		var offids = $('#chatlist input[name=offline]').serialize().replace(/&offline=/gi,',');
		console.log('&q='+id+'&'+onids+'&'+offids);
		queue.add({
			// url: '<?php echo $chatlist; ?>&q='+id,
			url: '<?php echo $chatlistnew; ?>&q='+id+'&'+onids+'&'+offids,
			type: 'GET',
			datatype: 'json',
			success: function(json) {	
				if( json.chatlist !== null ) {
					var chips = json.chatlist;
					for(i in chips) { 
						var c = chips[i];
						switch(c.op) {
							case 'add' :
								$('<div id="'+c.id+'" class="chip '+c.class+'"><img src="'+ c.src +'" alt="'+c.name+'" class="img-responsive"><i id="'+c.id+'" class="text-clip">'+c.name+'</i><span class="closebtn" onclick="event.stopPropagation(); $(this).parent().remove(); var id = "u"+$(this).attr("id"); $("ul#"+id).remove(); clearChat('+c.id+')">&times;</span><input id="'+c.id+'" type="hidden" name="'+c.class.substring(0,7)+'" value="'+c.id+'"></div></div>').appendTo('#chip-container');
								//deferLoad();
								break;
							case 'status' :
								$('div#'+c.id).attr('class',c.class);
								$('input[id='+c.id+']').attr('name',c.class.substring(5,12));
								break;
						}
					}
				}

				$('.chip').bind('click',function() {
					$('.chip-open').removeClass('chip-open');
					$(this).addClass('chip-open').removeClass('new-message');
					$('ul').not('.search-results').addClass('hidden');
					$('ul#chat'+$(this).attr('id')).removeClass('hidden');
					$('.nav-name').text($('#' + $(this).attr('id') + ' > i').text());
					if ($(this).hasClass('online')) {
						$('.nav-status').text('Online');
					} else {
						$('.nav-status').text('Offline');
					}
					$('#closechat').removeClass('hidden');
				});

				// alert('Done!');
			},
			error: function(xhr, ajaxOptions, thrownError) {
				$('ul#chat'+id+' li#sent:last').remove();

				alert('Ajax error chat list' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	};

	function messagelist() {
		queue.add({
			url: '<?php echo $messagereceive; ?>&q=',
			type: 'GET',
			datatype: 'text',
			success: function(response) {
				// $("#messagebody").animate({ scrollTop: $('#messagebody').prop("scrollHeight")}, 100);
				$('ul#new').html(response);
				$('ul#new > li').each( function() {
					var parent = $(this).attr('parent-id');
					$(this).clone().appendTo('ul#chat'+parent);
					$(this).remove();
				});
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert('Ajax error messagelist' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	};
	
	$(window).on('beforeunload', function() {
		queue.close();
		clearInterval(chatlistid);
		clearInterval(messagelistid);
	});
</script>
	
</body>

</html>
