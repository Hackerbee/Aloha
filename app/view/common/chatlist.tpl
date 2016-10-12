<?php foreach($chatheads as $chathead) { ?>
<div class="container">
	<div id="<?php echo $chathead['id']; ?>" class="chip online"> 
		<img src="<?php echo $chathead['src']; ?>" alt="Person" class="img-responsive"> 
		<span class="closebtn" onclick="event.stopPropagation();$(this).parent().hide();">&times;</span>
		<i id="<?php echo $chathead['id']; ?>" class="text-clip"><?php echo $chathead['name']; ?></i>
	</div> 
</div>
<?php } ?>
