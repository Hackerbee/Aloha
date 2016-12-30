<?php echo $header; ?>
	<!-- Loader -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<!-- <div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div> -->
		<div id="loaderbg"></div>
	</div>
	<script type="text/javascript">
		document.writeln('<!-- Bootstrap -->\
		<link rel="stylesheet" href="dist/css/bootstrap/bootstrap.css">\
		<!-- Custom	-->\
		<link rel="stylesheet" href="dist/css/custom.css">');
	</script>
	<!-- Content -->
	<div id="content">
		<div id="chatlist" class="sidenav col-lg-3 col-md-3 col-sm-3">
			<?php echo $chatlist; ?>
		</div>

		<div id="main" class="col-lg-9 col-md-9 col-sm-9">
			<div id="nav-wrapper">
				<div class="container-fluid" style="text-align:center;color:white;padding-top:5px;">
					<i class="nav-name"></i>&nbsp;&nbsp;<i class="nav-status"></i>
				</div>
				<!-- <a href="javascript:void(0)" onclick="toggleNav('L')" class="sidenav-closebtn-left">&times;</a> -->
				<a href="javascript:void(0)" onclick="toggleNav('R')" class="sidenav-closebtn"><i class="glyphicon glyphicon-user"></i></a>
			</div>
			
			<div id="messagebody" class="container-fluid">
				<!-- <span id="center-text">Please select a contact<wbr> from left panel</span> -->
				<?php echo $messagelist; ?>
				<ul id="new"></ul>
			</div>
			<?php echo $inputpanel; ?>
			<div id="inputpanel" class="container-fluid">
				<div class="row">
					<div class="container">
						<div id="progress" class="col-sm-9 col-md-9 col-lg-9">
							<span id="filename" class="col-sm-4 col-md-4 col-lg-4"></span>
							<div id="progress-container" class="col-sm-7 col-md-7 col-lg-7">
								<progress class="progress progress-striped" value="76" max="100"></progress>
							</div>
							<span class="col-sm-1 col-md-1 col-lg-1">
								<i id="percentage" class="glyphicon"></i>
							</span>
						</div>
						<div id="controls" class="col-sm-3 col-md-3 col-lg-3">
							<i id="upload-image" class="glyphicon glyphicon-picture"></i>
							<i id="upload-audio" class="glyphicon glyphicon-music"></i>
							<i id="upload-doc" class="glyphicon glyphicon-file"></i>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="container">
						<div class="col-sm-1 col-md-1 col-lg-1">
							<i id="send-btn" class="glyphicon glyphicon-send"></i>
						</div>
						<div class="col-sm-10 col-md-10 col-lg-10">
							<input type="text" name="message" class="form-control">
						</div>
						<div class="col-sm-1 col-md-1 col-lg-1">
							<i id="options-btn" class="glyphicon glyphicon-send"></i>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- <?php echo $rightsidebar; ?> -->
		<div id="searchpanel" class="sidenav col-lg-3 col-md-3 col-sm-3 sidenav-closed">
			<a href="javascript:void(0)" onclick="toggleNav('R')" class="sidenav-closebtn"><i class="glyphicon glyphicon-remove"></i></a>
			<div class="container-fluid">
				<input id="usersearch" type="search" name="search" class="form-control">
				<!-- <i class="glyphicon glyphicon-search"></i> -->
				<ul class="search-results">
				</ul>
			</div>
		</div>
	</div>
<?php echo $footer; ?>