$(document).ready(function() {
	$('#content').hide();
	setTimeout(function(){
		$('body').addClass('loaded');
       $('#content').fadeIn(1000);
	}, 3000);

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
	$('#messagebody').prepend('<div class="container"> \
					<div class="message"> \
						<p>...sadasdadsadasdasdsadasdasfaedsdasfqeqdsafweafsdaesDcasFdqas</p> \
					</div> \
				</div>');
}
// var img = $('<img class="img-responsive" />').attr('src', json['path']).on('load',function(){ $('#loadimg').html(img); });

// function toggleNav(dir) {

// 	if(dir == 'L') {
// 		$('#chatlist,#main').toggleClass('pull-lg-3 pull-md-3 pull-sm-3 closed');
// 		s1 = $('#chatlist').hasClass('closed');
// 		s2 = $('#onlinepanel').hasClass('closed');

// 		if ( s1 && s2 ) {
// 			$('#main').addClass('col-lg-12 col-md-12 col-sm-12 pull-lg-3 pull-md-3 pull-sm-3').removeClass('col-lg-9 col-md-9 col-sm-9 col-lg-6 col-md-6 col-sm-6');
// 		} else if ( s1 && !s2 ) {
// 			$('#main').addClass('col-lg-9 col-md-9 col-sm-9 pull-lg-3 pull-md-3 pull-sm-3').removeClass('col-lg-6 col-md-6 col-sm-6');
// 		} else if ( s2 ) {
// 			$('#main').addClass('col-lg-9 col-md-9 col-sm-9').removeClass('col-lg-6 col-md-6 col-sm-6');
// 		} else {
// 			$('#main').addClass('col-lg-6 col-md-6 col-sm-6').removeClass('col-lg-9 col-md-9 col-sm-9');
// 		}
// 	} else {
// 		$('#onlinepanel').toggleClass('push-lg-3 push-md-3 push-sm-3 closed');
// 		s1 = $('#chatlist').hasClass('closed');
// 		s2 = $('#onlinepanel').hasClass('closed');

// 		if ( s1 && s2 ) {
// 			$('#main').addClass('col-lg-12 col-md-12 col-sm-12 pull-lg-3 pull-md-3 pull-sm-3').removeClass('col-lg-9 col-md-9 col-sm-9 col-lg-6 col-md-6 col-sm-6');
// 		} else if ( s1 ) {
// 			$('#main').addClass('col-lg-9 col-md-9 col-sm-9').removeClass('col-lg-12 col-md-12 col-sm-12 col-lg-6 col-md-6 col-sm-6');
// 		} else if ( s2 ) {
// 			$('#main').addClass('col-lg-9 col-md-9 col-sm-9').removeClass('col-lg-12 col-md-12 col-sm-12 col-lg-6 col-md-6 col-sm-6');
// 		} else {
// 			$('#main').addClass('col-lg-6 col-md-6 col-sm-6').removeClass('col-lg-12 col-md-12 col-sm-12 col-lg-9 col-md-9 col-sm-9');
// 		}
// 	}
// }

