<a href="<?php echo $logout; ?>" class="sidenav-closebtn" onclick="alert('Successfully logged out!')"><i class="glyphicon glyphicon-log-out"></i></a>
<div class="container">
	<button id="closechat" class="btn btn-danger <?php //if($currid == 0) echo 'hidden'; ?>" onclick="$('.chip-open').removeClass('chip-open');$('ul').not('.search-results').addClass('hidden');$('.nav-name').text('You are ');$('.nav-status').text('Online');$(this).addClass('hidden');">Close open chats</button>
</div>
<script type="text/javascript">
function clearChat(contactid){
	if(confirm('Are you sure you want to Delete Chat ?')){
		$('ul#chat'+contactid+' > li').remove()
		$(this).parent().hide();
		queue.add({
				url:'<?php echo $messagedelete; ?>&receive='+contactid,
				type: 'GET',
				datatype: 'json',
				beforeSend: function() {
					
				},
				success: function(data) {
					alert('Deleted !');
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert('Ajax error' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
	}
}
</script>
<div id="chip-container">
<?php foreach($chatheads as $chathead) { ?>
	<div id="<?php echo $chathead['id']; ?>" class="chip <?php echo $chathead['status']; if($chathead['id'] == $currid) echo ' chip-open'; ?>"> 
		<img src="<?php echo $chathead['src']; ?>" alt="Person" class="img-responsive"> 
		<i id="<?php echo $chathead['id']; ?>" class="text-clip"><?php echo $chathead['name']; ?></i>
		<span class="closebtn" onclick="event.stopPropagation(); clearChat(<?php echo $chathead['id']; ?>)">&times;</span>
		<input id="<?php echo $chathead['id']; ?>" type="hidden" name="<?php echo $chathead['status']; ?>" value="<?php echo $chathead['id']; ?>">
	</div>
<?php } ?>
</div>
<!-- // $(this).parent().hide(); -->