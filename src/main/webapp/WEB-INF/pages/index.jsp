<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
<title>Dreams to Realty</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" media="screen" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" media="screen" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" media="screen" href="resources/css/grid_12.css">

<link href="resources/css/menu_styles.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type='text/javascript' src='resources/js/menu_jquery.js'></script>
<%@include file="include.jsp"%>


<!-- CSS Files -->
<link rel="stylesheet" type="text/css" media="screen" href="resources/css/style_slider.css">
<!-- JS Files -->
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery.eislideshow.js"></script>




<script src="resources/js/cufon-yui.js"></script>
<script src="resources/js/vegur_400.font.js"></script>
<script src="resources/js/Vegur_bold_700.font.js"></script>
<script src="resources/js/cufon-replace.js"></script>
<script src="resources/js/tms-0.4.x.js"></script>

<script src="resources/js/FF-cash.js"></script>

<script>
jQuery.noConflict()(function ($) {
    $('#ei-slider').eislideshow({
        animation: 'center',
        autoplay: true,
        slideshow_interval: 3000,
        titlesFactor: 0
    });
});
$( document ).ready(function() {
	$('#requestCall').hide();
});

</script>
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="css/ie.css">
<![endif]-->
</head>
<body>
<div class="main">

  <div class="wrapper">
 
<div class="menuWrapper">
  <!--==============================header=================================-->
  <%@include file="d2r_header.jsp"%> 
  <!--==============================content================================-->
<%@include file="menu.jsp"%>    
</div>
  <div id="ei-slider" class="ei-slider">
    <ul class="ei-slider-large">
      <li> <img src="resources/images/slider-4.jpg" alt="">
        <div class="ei-title">
          <h2>One Stop Shop</h2>
		  <h3>For all your estate needs</h3>
        </div>
      </li>
      <li> <img src="resources/images/slider-6.jpg" alt="">
        <div class="ei-title">
          <h2>LUXURY LIVING</h2>
          <h3>In the heart of city</h3>
        </div>
      </li>
      <li> <img src="resources/images/luxury-modern-home-white-architecture.jpg" alt="">
        <div class="ei-title">
          <h2>Live the</h2>
          <h3>Landmark</h3>
        </div>
      </li>
      <li> <img src="resources/images/slide4.jpg" alt="">
        <div class="ei-title">
          <h2> Luxury Township</h2>
          <h3>With 101 Amenities</h3>
        </div>
      </li>
	  <li> <img src="resources/images/TwoWayHomes-ebrochure_0061.jpg" alt="">
        <div class="ei-title">
          <h2>Delightful </h2>
          <h3>Two Way Homes</h3>
        </div>
      </li>
    </ul>
    <!-- ei-slider-large -->
    <ul class="ei-slider-thumbs">
      <li class="ei-slider-element">Current</li>
      <li><a href="#">Slide 1</a><img src="resources/images/thumbs/slider-4.jpg" alt=""></li>
      <li><a href="#">Slide 2</a><img src="resources/images/thumbs/slider-6.jpg" alt=""></li>
      <li><a href="#">Slide 3</a><img src="resources/images/thumbs/luxury-modern-home-white-architecture.jpg" alt=""></li>
      <li><a href="#">Slide 4</a><img src="resources/images/thumbs/slide4-small.jpg" alt=""></li>
	  <li><a href="#">Slide 6</a><img src="resources/images/thumbs/TwoWayHomes-ebrochure_0061.jpg" alt=""></li>
    </ul>
    <!-- ei-slider-thumbs -->
  </div>
  <!-- ei-slider -->
</div>

  <section id="content">
  <div id="requestCallVertical"><a id="requestACall" title="Our exicutive will call you." href="requestCall" ><img alt="" src="resources/images/enquiry-now.jpg"
									title="Our exicutive will call you" height="80px" width="200px"></a></div>
  
  	  <div class="contentHeader">
        <label>&nbsp;&nbsp;Our Projects</label>
      </div>
      <div class="boxes">
        <div class="grid_4">
          <figure>
            <div><img src="resources/images/52dce41388c27.gif" alt="" height="320px" width="300px"></div>
            <figcaption>
              <h3>KALYAN SAMPAT GARDENS </h3>(Pipliyahana)
              2,3 & 4bhk luxury apartments in ready possession..<a href="#" class="btn">Details</a> </figcaption>
          </figure>
        </div>
        <div class="grid_4">
          <figure>
            <div><img src="resources/images/a1.jpg" alt="" height="320px" width="300px"></div>
            <figcaption>
              <h3>SS infinitus </h3>(Nipania MR11 Ring Road)
              Plot,Two way homes, Row house , 1,2 & 3 bhk luxury apartments, 4 bhk super luxury apartments.. <a href="#" class="btn">Details</a> </figcaption>
          </figure>
        </div>
        <div class="grid_4">
          <figure>
            <div><img src="resources/images/Page3.jpg" alt="" height="320px" width="300px"></div>
            <figcaption>
              <h3>PEARL GALAXY </h3>(Bicholi Mardana)
              1,2 & 3bhk flats in ready possession.. <a href="#" class="btn">Details</a> </figcaption>
          </figure>
        </div>
        <div class="clear"></div>
      </div>
  </section>
</div>

<!--==============================footer=================================-->
<%@include file="d2r_footer.jsp"%>
</body>
</html>
