$(document).ready(function() {



	// $('#chatlist, #main, #messagebody, ul').hide();
	// setTimeout(function(){
	// 	$('body').addClass('loaded');
	// 	$('#chatlist').fadeIn(1000);
	// 	$('#main').fadeIn(1300);
	// 	$('#messagebody').fadeIn(1600);
	// 	// $('ul').fadeIn(1900);
	// }, 3000);
	
});

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
		// alert(val);
		addmessage(val);
		$('.input-btn').trigger('click');
		$("#messagebody").animate({ scrollTop: $('#messagebody').prop("scrollHeight")}, 0);
		// $(this).val('');
	};
});
// var img = $('<img class="img-responsive" />').attr('src', json['path']).on('load',function(){ $('#loadimg').html(img); });

function toggleNav() {
	$('.sidenav').toggleClass('push-lg-3 push-md-3 push-sm-3 sidenav-closed sidenav-open');
	$('#main').toggleClass('col-lg-6 col-md-6 col-sm-6 col-lg-9 col-md-9 col-sm-9');
}

var id = $('.chip').first().addClass('chip-open').attr('id');
$('ul').not('.search-results').addClass('hidden');
$('ul#u'+id).removeClass('hidden');