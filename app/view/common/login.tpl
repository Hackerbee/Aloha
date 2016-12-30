<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=commonice-width, initial-scale=1.0, maximum-scale=1.0, target-densitydpi=commonice-dpi, shrink-to-fit=no, user-scalable=no">
	<meta name="HandheldFriendly" content="true">
	<title>Aloha - Login</title>

	<!--iOS -->
	<meta name="viewport" content="width=commonice-width, initial-scale=1.0">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

	<!-- Bootstrap -->
	<!-- <link rel="stylesheet" href="dist/css/bootstrap/bootstrap.css"> -->

	<!-- Custom -->
	<!-- <link rel="stylesheet" href="dist/css/custom.css"> -->
	<link rel="stylesheet" href="dist/css/login.css">
		
	</head>

	<body>
	<div class="container"><?php echo $error_warning; ?></div>
		<div class="form">
			
			<ul class="tab-group">
				<li class="tab"><a href="<?php echo $signup; ?>">Sign Up</a></li>
				<li class="tab active"><a href="#login">Log In</a></li>
			</ul>
			
			<div class="tab-content">

				<div id="login">   
					<h1>Welcome Back!</h1>
					
					<form action="<?php echo $action; ?>" method="post">
					
						<div class="field-wrap">
						<label>
							Username<span class="req">*</span>
						</label>
						<input type="text" name="username" required autocomplete="off"/>
					</div>
					
					<div class="field-wrap">
						<label>
							Password<span class="req">*</span>
						</label>
						<input name="password" type="password" required autocomplete="off"/>
					</div>
					
					<!-- <p class="forgot"><a href="#">Forgot Password?</a></p> -->
					
					<button type="submit" name="submit" class="button button-block">Log in</button>
					
					</form>

				</div>

			</div><!-- tab-content -->
			
</div> <!-- /form -->
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

	<!-- Custom	-->
	<!-- <script type="text/javascript" src="dist/js/custom.js"></script> -->
	<script type="text/javascript" src="dist/js/login.js"></script>

</body>

</html>
