<a href="<?php echo $logout; ?>" class="sidenav-closebtn" onclick="alert('Successfully logged out!')"><i class="glyphicon glyphicon-log-out"></i></a>
<?php foreach($chatheads as $chathead) { ?>
<div class="container">
	<div id="<?php echo $chathead['id']; ?>" class="chip online <?php if($chathead['id'] == $currid) echo 'chip-open'; ?>"> 
		<img src="<?php echo $chathead['src']; ?>" alt="Person" class="img-responsive"> 
		<span class="closebtn" onclick="event.stopPropagation(); $(this).parent().hide(); var id = 'u'+$(this).attr('id'); $('ul#u'+id).remove(); clearChat(<?php echo $chathead['id']; ?>)">&times;</span>
		<i id="<?php echo $chathead['id']; ?>" class="text-clip"><?php echo $chathead['name']; ?></i>
	</div> 
</div>
<script type="text/javascript">
function clearChat(contactid){
	if(confirm('Are you sure you want to Delete Chat ?')){
		$.ajax({
				url:'<?php echo $messagedelete; ?>&receive='+contactid,
				type: 'GET',
				datatype: 'json',
				beforeSend: function() {
					
				},
				success: function(data) {
					alert('Deleted !');
				},
				error: function(xhr, ajaxOptions, thrownError) {
					// alert('Ajax error' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
	}
}
</script>
<?php } ?>
