<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>D2R Admin Portal</title>
<link rel="stylesheet" href="css/screen.css" type="text/css"
	media="screen" title="default" />
<!--  jquery core -->
<script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

<!-- Custom jquery scripts -->
<script src="js/jquery/custom_jquery.js" type="text/javascript"></script>

<!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
<script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).pngFix();
	});
</script>
</head>
<body id="login-bg">

	<!-- Start: login-holder -->
	<div id="login-holder">

		<!-- start logo -->
		<div id="logo-login">
			<a href="#"></a>
		</div>
		<!-- end logo -->
		<div><img src="images/d2r_logo.jpg" width="200px" height="100px" style="margin-top:100px;margin-left:130px" alt=""></div>
		<div class="clear"></div>

		<!--  start loginbox ................................................................................. -->
		<div id="loginbox">

			<!--  start login-inner -->
			<div id="login-inner">
				<table border="0" cellpadding="0" cellspacing="0">
				<form name='f' action="<c:url value='j_spring_security_check' />" method='POST'>
						<tr>
							<th>Username</th>
							<td><input type='text' name='j_username' value=''
								class="login-inp"></td>
						</tr>
						<tr>
							<th>Password</th>
							<td><input type='password' name='j_password' class="login-inp" /></td>
						</tr>
						<tr>
							<th></th>
							<td><input name="submit" type="submit" value="submit"
								class="submit-login" /></td>
						</tr>
					</table>
				</form>
			</div>
			<!--  end login-inner -->
			<div class="clear"></div>
		</div>
		<!--  end loginbox -->

		<!--  start forgotbox ................................................................................... -->
	</div>
	<!-- End: login-holder -->
</body>
</html>