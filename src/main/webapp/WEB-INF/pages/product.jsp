<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
<title>Dreams to Realty | Product</title>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/products.css">
<link href="resources/css/menu_styles.css" rel="stylesheet"
	type="text/css">
<link href="resources/css/searchForm.css" rel="stylesheet"
	type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type='text/javascript' src='resources/js/menu_jquery.js'></script>

<script src="resources/js/jquery.js"></script>
<link rel="stylesheet" href="resources/css/touchTouch.css">

<script src="resources/js/jquery-migrate-1.1.1.js"></script>
<script src="resources/js/superfish.js"></script>
<script src="resources/js/jquery.equalheights.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.ui.totop.js"></script>
<script src="resources/js/touchTouch.jquery.js"></script>

<script>
	$(window).load(function() {
		$().UItoTop({
			easingType : 'easeOutQuart'
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
		'overlayOpacity'	: 0.7,
		'modal'   			:true,
		'centerOnScroll'	:true
	});
	$.ajax({url:"isFormAlreadyFilled",success:function(result){
	    if(result==false || result=='false'){
	    	$('a#requestACall').click();
	    }
	}});
	
	/* var timer=setInterval(function(){showCustForm()},0);
	function showCustForm()
	{
		$('a#requestACall').click();
		clearInterval(timer);	
	} */
});
</script>


</head>
<body class="body_products">
	<div class="main_products">
		<!--==============================Start of header & menu=================================-->
		<div class="wrapper"></div>
		<div class="menuWrapper_AboutUS">
		<%@include file="d2r_header.jsp"%>
			<%@include file="menu.jsp"%>
		</div>
		<!--==============================End of menu=================================-->
		<div id="containerPage">
			<c:if test="${param.type!='luxury'}">
			<div id="filterForm">
				<table>
					<form:form method="post" action="searchProduct"
						modelAttribute="productForm">
						<input name="type" type="hidden" value="${param.type}"/>
						<tr>
							<td>Budget :</td>
							<td><select id="searchInput" name="budget"
								class="styledselect_form_1">
									<option value="all">All</option>
									<option value="10 Lacs">10 Lacs</option>
									<option value="15 Lacs">15 Lacs</option>
									<option value="20 Lacs">20 Lacs</option>
									<option value="30 Lacs">30 Lacs</option>
									<option value="40 Lacs">40 Lacs</option>
									<option value="50 Lacs">50 Lacs</option>
									<option value="60 Lacs">60 Lacs</option>
									<option value="75 Lacs">75 Lacs</option>
									<option value="1 Crore">1 Crore</option>
									<option value="2 Crore">2 Crore</option>
									<option value="3 Crore">3 Crore</option>
									<option value="5 Crore">5 Crore</option>
									<option value="8 Crore">8 Crore</option>
							</select></td>
						</tr>	
							<tr><td></td>
							<td>
								<input type="submit"  value="Filter Result"
										 />
							</td>
						</tr>
						
					</form:form>
				</table>
			</div>
			</c:if>
			<div class="container_12_products">
				<div class="grid_9_products">
					<c:choose>
						<c:when test="${param.type == 'all'}">
							<h3>Search Result</h3>
						</c:when>
						<c:otherwise>
							<h3>${param.type}</h3>	
						</c:otherwise>
					</c:choose>
					<c:if test="${list.size()<1}">No matching result found<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></c:if>
					<c:forEach var="product" items="${list}">
						<div class="blog">
							<time datetime="2045-01-01">#${product.PID}</time>
							<div class="extra_wrapper_products">
								<div class="text1_products">
									<c:out value="${product.title}" />
								</div>
							</div>
							<div class="clear_products"></div>
							<div class="gallery">
								<div class="grid_4_products"> <a href="${product.primaryImageUrl}" class="gal img_inner"><img src="${product.primaryImageUrl}" alt=""  height="200px" width="300px"></a> </div>
							</div>
							<%-- <img src="<c:out value='${product.primaryImageUrl}' />" alt=""
								class="img_inner fleft_products" height="200px" width="300px" /> --%>
							<div class="extra_wrapper_products">
								<c:out value="${product.description}" />
								<br>
								<br> Location:
								<c:out value="${product.location} ,${product.city}" />
								<br> Amenities:<br>
								<c:if test="${product.have_gym}"> 
								<img alt="" src="resources/images/icons/gym.png"
									title="Gymnasium" height="30px" width="30px">
								</c:if>
								<c:if test="${product.have_security_camera}"> 
								<img alt="" src="resources/images/icons/camera.png"
									title="Security Camera" height="30px" width="30px">
								</c:if>
								<c:if test="${product.have_security_camera}">
								<img alt="" src="resources/images/icons/building.png"
									title="Club House" height="30px" width="30px">
								</c:if>
								<c:if test="${product.have_lift}">
								<img alt="" src="resources/images/icons/lift_icon.png"
									title="Power backup lift" height="30px" width="30px">
								</c:if>
								<c:if test="${product.have_garden}">
								<img alt="" src="resources/images/icons/garden.png"
									title="Garden" height="30px" width="30px">
								</c:if>
								<c:if test="${product.have_community_hall}">
								<img alt="" src="resources/images/icons/home.png"
									title="Community Hall" height="30px" width="30px">
								</c:if>
								<c:if test="${product.have_swimming_pool}">
								<img alt="" src="resources/images/icons/swimming_pool.png"
									title="Swimming Pool" height="30px" width="30px">
								</c:if>	
								<br> Budget:
								<c:out value="${product.budget}" />
								<br>
								<br> <a href="gallery?pid=${product.PID}&title=${product.title}">Veiw
									More Photos</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="clear_products"></div>
			</div>
		 <c:if test="${param.type!='luxury'}">
		<c:if test="${list.size()>9}">
			<a href="${pageContext.request.contextPath}/showProduct?type=${param.type}&next=true"><div id="filterForm">More result</div></a>
		</c:if>
		</c:if>
		</div>
	</div>
	<!--==============================footer=================================-->
	<%@include file="d2r_footer.jsp"%>
</body>
</html>