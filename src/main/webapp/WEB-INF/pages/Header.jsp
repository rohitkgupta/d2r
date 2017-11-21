<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Start: page-top-outer -->
<div id="page-top-outer">

	<!-- Start: page-top -->
	<div id="page-top">

		<!-- start logo -->
		<div id="logo">
			<a href="admin"><img src="images/shared/admin.gif" width="186"
				height="40" alt="" /></a>
		</div>
		<!-- end logo -->

		<!--  start top-search -->
		<div id="top-search">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
				</tr>
			</table>
		</div>
		<!--  end top-search -->
		<div class="clear"></div>

	</div>
	<!-- End: page-top -->

</div>
<!-- End: page-top-outer -->

<div class="clear">&nbsp;</div>

<!--  start nav-outer-repeat................................................................................................. START -->
<div class="nav-outer-repeat">
	<!--  start nav-outer -->
	<div class="nav-outer">

		<!-- start nav-right -->
		<div id="nav-right">

			<div class="nav-divider">&nbsp;</div>
			<div class="nav-divider">&nbsp;</div>
			<a id="logout" href="<c:url value="/j_spring_security_logout" />"><img
				src="images/shared/nav/nav_logout.gif" width="64" height="14" alt="" /></a>
			<div class="clear">&nbsp;</div>



		</div>
		<!-- end nav-right -->


		<!--  start nav -->
		<div class="nav">
			<div class="table">
				<ul class="select">
					<li><a href="admin"><b>Home</b> <!--[if IE 7]><!--></a> <!--<![endif]-->
						<!--[if lte IE 6]><table><tr><td><![endif]-->
				</ul>
				<div class="nav-divider">&nbsp;</div>

				<ul class="select">
					<li><a href="download"><b>Download</b> <!--[if IE 7]><!--></a> <!--<![endif]-->
						<!--[if lte IE 6]><table><tr><td><![endif]-->
						<div class="select_sub">
							<ul class="sub">
								<li><a href="download">Customer Excel</a></li>
							</ul>
						</div> <!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
				</ul>
				
				<div class="nav-divider">&nbsp;</div>
				
				
				<ul class="current">
					<li><a href="product"><b>Project</b> <!--[if IE 7]><!--></a> <!--<![endif]-->
						<!--[if lte IE 6]><table><tr><td><![endif]-->
						<div class="select_sub show">
							<ul class="sub">
								<li><a href="product">Add New Project</a></li>
								<li><a href="delete">Delete Project</a></li>
							</ul>
						</div> <!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
				</ul>

				
				<div class="nav-divider">&nbsp;</div>
					</div>
			<!--[if lte IE 6]></td></tr></table></a><![endif]-->
			</li>
			</ul>

			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>
	<!--  start nav -->

</div>
<div class="clear"></div>
<!--  start nav-outer -->
</div>
<!--  start nav-outer-repeat................................................... END -->

<div class="clear"></div>

<!-- start content-outer ........................................................................................................................START -->
