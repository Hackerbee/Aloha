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
			<!-- <a href="javascript:void(0)" onclick="toggleNav('L')" class="sidenav-closebtn-left">&times;</a> -->
			<?php echo $chatlist; ?>
		</div>

		<div id="main" class="col-lg-9 col-md-9 col-sm-9">
			<div id="nav-wrapper">
				<div class="container-fluid" style="text-align:center;color:white;padding-top:5px;">
					<i class="nav-name"></i><br/>
					<i class="nav-status"></i>
				</div>
				<!-- <a href="javascript:void(0)" onclick="toggleNav('L')" class="sidenav-closebtn-left">&times;</a> -->
				<a href="javascript:void(0)" onclick="toggleNav('R')" class="sidenav-closebtn">&times;</a>
			</div>
			
			<div id="messagebody" class="container-fluid">
				<?php echo $messagelist; ?>
				<?php echo $inputpanel; ?>
				<div id="inputpanel" class="container-fluid">
					<div class="container">
						<i class="input-btn glyphicon glyphicon-send"></i>
						<input type="text" name="message" class="form-control form-control-lg">
					</div>
				</div>
			</div>

			<?php echo $rightsidebar; ?>
			<div id="onlinepanel" class="sidenav col-lg-3 col-md-3 col-sm-3 sidenav-closed">
				<a href="javascript:void(0)" onclick="toggleNav('R')" class="sidenav-closebtn">&times;</a>
			</div>
		</div>
	</div>
<?php echo $footer; ?>