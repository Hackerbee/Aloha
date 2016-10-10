$(document).ready(function() {
	// $('#chatlist, #main, #messagebody, #messagelist').hide();
	// setTimeout(function(){
	// 	$('body').addClass('loaded');
	// 	$('#chatlist').fadeIn(1000);
	// 	$('#main').fadeIn(1300);
	// 	$('#messagebody').fadeIn(1600);
	// 	$('#messagelist').fadeIn(1900);
	// }, 3000);
});
function addchat() {
	$('#chatlist').append('<div class="container"> \
								<div class="chip"> \
									<img src="dist/img/img_avatar.png" alt="Person" height="96" weight="96" class="img-responsive"> \
									John Doe \
									<span class="closebtn" onclick="$(this).parent().hide();">&times;</span> \
								</div> \
							</div>');
}
function addonline() {
	$('#onlinepanel').append('<div class="container"> \
								<div class="chip"> \
									<img src="dist/img/img_avatar.png" alt="Person" height="96" weight="96" class="img-responsive"> \
									John Doe \
									<span class="closebtn" onclick="$(this).parent().hide();">&times;</span> \
								</div> \
							</div>');
}

function addmessage() {
	$('#messagelist').prepend('<li class="message-wrapper clearfix"> \
									<div class="message my-message"> \
										<p>...sadasdadsadasdasdsadasdasfaedsdasfqeqdsafweafsdaesDcasFdqas</p> \
									</div> \
									<div class="message-data"> \
										<i class="message-data-time">10:14 AM</i> \
										<span class="message-data-name">Me</span> \
									</div> \
								</li>');
}
// var img = $('<img class="img-responsive" />').attr('src', json['path']).on('load',function(){ $('#loadimg').html(img); });

function toggleNav() {
	$('#onlinepanel').toggleClass('push-lg-3 push-md-3 push-sm-3 sidenav-closed sidenav-open');
	$('#main').toggleClass('col-lg-6 col-md-6 col-sm-6 col-lg-9 col-md-9 col-sm-9');
}

