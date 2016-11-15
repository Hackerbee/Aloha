<?php echo $header; ?>
		<!-- Loader -->
		<div id="loader-wrapper">
			<div id="loader"></div>
			<!-- <div class="loader-section section-left"></div>
			<div class="loader-section section-right"></div> -->
		</div>
	<!-- Content -->
	<div id="content">
		<div id="chatlist" class="sidenav col-lg-3 col-md-3 col-sm-3">
			<a href="<?php echo $logout; ?>" class="sidenav-closebtn"><i class="glyphicon glyphicon-log-out"></i></a>
			<?php echo $chatlist; ?>
		</div>

		<div id="main" class="col-lg-6 col-md-6 col-sm-6">
			<div id="nav-wrapper">
				<div class="container-fluid" style="text-align:center;color:white;padding-top:5px;">
					<i class="nav-name"></i><br/>
					<i class="nav-status"></i>
				</div>
				<!-- <a href="javascript:void(0)" onclick="toggleNav('L')" class="sidenav-closebtn-left">&times;</a> -->
				<a href="javascript:void(0)" onclick="toggleNav('R')" class="sidenav-closebtn"><i class="glyphicon glyphicon-user"></i></a>
			</div>
			
			<div id="messagebody" class="container-fluid">
				<?php echo $messagelist; ?>
				<ul id="new"></ul>
			</div>
			<?php echo $inputpanel; ?>
			<div id="inputpanel" class="container-fluid">
				<div class="row">
					<i class="input-btn glyphicon glyphicon-send"></i>
					<input type="text" name="message" class="form-control form-control-lg">
					<div id="controls">
						<i id="upload-image" class="glyphicon glyphicon-picture"></i>
						<i id="upload-audio" class="glyphicon glyphicon-music"></i>
						<i id="upload-doc" class="glyphicon glyphicon-file"></i>
					</div>
				</div>
			</div>

		</div>
		<?php echo $rightsidebar; ?>
		<div id="searchpanel" class="sidenav col-lg-3 col-md-3 col-sm-3">
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