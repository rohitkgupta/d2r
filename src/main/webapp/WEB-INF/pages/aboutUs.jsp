<!DOCTYPE html>
<html lang="en">
<head>
<title>Dreams to Realty | About</title>
<meta charset="utf-8">

<!-- CSS Files -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="resources/css/menu_styles.css" rel="stylesheet"
	type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type='text/javascript' src='resources/js/menu_jquery.js'></script>
<%@include file="include.jsp"%>


<script>
	$(window).load(function() {
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
	});
</script>
</head>
<body class="body_AboutUS">
	<div class="main_AboutUS">
		<!--==============================Start of menu=================================-->
		<div class="wrapper"></div>
		<div class="menuWrapper_AboutUS">
			<!--==============================header=================================-->
			<%@include file="d2r_header.jsp"%>
			<!--==============================End of header=================================-->
			<%@include file="menu.jsp"%>
		</div>
		<!--==============================End of menu=================================-->
		<div id="containerPage">
			<div class="content_AboutUS">
				<div class="container_12_AboutUS">
					<div class="">
						<div class="">
							<h3>Agency Profile</h3>
							<img src="resources/images/d2r_logo.jpg" alt=""
								class="img_inner fleft_AboutUS" height="200px" width="300px" />
							<p class="text1_AboutUS">Dreams to Realty</p>
							<p class="normal_p_AboutUs">Dreams to Realty is the leading
								real estate consultancy in central India. It was incorporated
								the year 2011 as marketing consultancy for real estate projects.
								Our founder, Dharmendra Dhaka, is a persistent inventor and a
								strong visionary who could see the spark in the future. Today it
								is One of Central India's most trusted Consultant. Dreams to
								Realty enjoy the patronage and trust of over 1000 Indians
								Family. The firm has one stop solution for end users looking at
								the right opportunity for Buy Home/ investment.</p>

							<p class="normal_p_AboutUs">To achieve our goals and fulfill
								your demands, we have a skilled workforce under the direct
								supervision of a highly progressive & professional management.
								Whether you're looking to buy we can help you find the space
								you're looking for.</p>

							<p class="normal_p_AboutUs">We are happy only when we see a
								delighted customer smile. We interact with customer like a
								family. We work to make relation with customer to provide
								satisfaction.</p>

							<div class="clear_AboutUS"></div>
							<br>
							<!-- <p class="normal_p_AboutUs"><font size="4"><b>Vision</b></font></p> -->
							<!-- <p class="normal_p_AboutUs">To become a successful and diversified global group through a process of continuous improvement and development. To be trusted and admired by our customers and respected by the industry.</p> -->
						</div>
					</div>
					<br><br><br><br>
					<div class="clear_AboutUS"></div>
				</div>
			</div>
		</div>
	</div>
	<!--==============================footer=================================-->
	<%@include file="d2r_footer.jsp"%>
</body>
</html>