<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>Gallery</title>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/products.css">
<link href="resources/css/menu_styles.css" rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type='text/javascript' src='resources/js/menu_jquery.js'></script>
<link rel="stylesheet" href="resources/css/touchTouch.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-migrate-1.1.1.js"></script>
<script src="resources/js/superfish.js"></script>
<script src="resources/js/jquery.equalheights.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.ui.totop.js"></script>
<script src="resources/js/touchTouch.jquery.js"></script>
<script>
$(window).load(function () {
    $().UItoTop({
        easingType: 'easeOutQuart'
    });
});
$(function () {
    $('.gallery a.gal').touchTouch();
});
</script>
<!-- Fancy Box -->
<script type="text/javascript" src="resources/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="resources/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="resources/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<script>
$( document ).ready(function() {
	$('#requestCall').hide();
	$('a#requestACall').fancybox({
		'height'			:'5',
		'width'				:'5',
		'autoScale'			: false,
		'transitionIn'		: 'none',
		'transitionOut'		: 'none',
		'titlePosition'		: 'outside',
		'type'				: 'iframe',
		'overlayColor'		: '#000',
		'overlayOpacity'	: 0.7
	});
});

</script>
</head>
<body class="body_products">
<!--==============================header=================================-->
   <%@include file="d2r_header.jsp"%>
<!--==============================End of header=================================-->
<div class="main_products">
<!--==============================Start of menu=================================-->
<div class="wrapper"> 
</div>
<div class="menuWrapper_AboutUS">
<%@include file="menu.jsp"%>    
</div>
<!--==============================End of menu=================================-->
<!--   <div class="main"> -->
  <div class="content_products">
    <div class="container_12_products">
      <div class="clear_products"></div>
      <div class="gallery">
      	<h3 style="color:#000">${param.title}</h3>
        <c:forEach var="url" items="${imageUrls}">
        	<div class="grid_4_products"> <a href="${url}" class="gal img_inner"><img src="${url}" alt=""  height="200px" width="300px"></a> </div>
        </c:forEach>
      </div>
      <div class="clear_products"></div>
    </div>
  </div>
 </div>
<!--==============================footer=================================-->
<%@include file="d2r_footer.jsp"%></body>
</html>