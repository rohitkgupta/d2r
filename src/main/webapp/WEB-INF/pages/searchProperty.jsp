<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Dreams to Realty | Search</title>
<meta charset="utf-8">

<!-- CSS Files -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="resources/css/menu_styles.css" rel="stylesheet"
	type="text/css">
<link href="resources/css/searchForm.css" rel="stylesheet"
	type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type='text/javascript' src='resources/js/menu_jquery.js'></script>
<%@include file="include.jsp"%>

<script>
$(document).ready(function(){
	$("#aminities").hide();
	$('#requestCall').hide();
	$("#show").click(function(){
		$("#aminities").toggle();
  	});
	var residentialOptions = {"flats":"Flats & Apartments",
			"row_house":"Row House",
			"bungalows":"Bungalows / Villas",
			"plot":"Plot",
			"penthouse":"Penthouse",
			"studio_apartment":"Studio Apartment"
	};
	
	var agriculturalOptions = {"farm_house":"Farm House",
			"land":"Agricultural Land"

	};
	
	var commercialOptions = {"commercial_space":"Commercial Space",
			"office_space":"Office Space",
			"commercial_plots":"Commercial Lands & Plots"
	};
	//$( "#category" ).bind( "change", function() {
	//$('[name="category"]').change((function () {
	$('input[type=radio]').live('change', function() {
		  var value=$('input:radio[name=category]:checked').val();
		  var $el = $('[name="type"]');
			$el.empty(); // remove old options
			var option;
			if(value=="Residential"){
				option=residentialOptions;
			}else if(value=="Commercial"){
				option=commercialOptions;
			}else{
				option=agriculturalOptions;
			}
			
			$.each(option, function(key, value) {
			  $el.append($("<option></option>")
			     .attr("value", key).text(value));
			});
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
			<div id="searchForm">
				<table>
					<form:form method="post" action="searchProduct"
						modelAttribute="productForm">
						<tr>
							<td>Search for :</td>
							<td><input type="radio" name="category" value="Residential"
								checked> Residential <input type="radio" name="category"
								value="Commercial"> Commercial <input type="radio"
								name="category" value="Agricultural"> Agricultural</td>
						</tr>
						<tr>
							<td>I wish to :</td>
							<td><input type="radio" name="isFor" value="Sell" checked>
								Buy <input type="radio" name="isFor" value="Rent"> Rent
							</td>
						</tr>



						<tr>
							<td>Looking for :</td>
							<td><select id="searchInput" name="type"
								class="styledselect_form_1">
									<option value="flats">Flats & Apartments</option>
									<option value="row_house">Row House</option>
									<option value="bungalows">Bungalows / Villas</option>
									<option value="plot">Plot</option>
									<option value="penthouse">Penthouse</option>
									<option value="studio_apartment">Studio Apartment</option>
							</select></td>
						</tr>


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


						<tr>
							<td>City :</td>
							<td><select id="searchInput" name="city"
								class="styledselect_form_1">
									<option value="Bhopal">Bhopal</option>
									<option value="Dewas">Dewas</option>
									<option value="Indore" selected>Indore</option>
									<option value="Mahu">Mahu</option>
									<option value="Pithampur">Pithampur</option>
									<option value="Rau">Rau</option>
									<option value="Ujjain">Ujjain</option>
							</select></td>
						</tr>
						<tr>
							<td>Amenities :</td>
							<td><img id="show" src="resources/images/icons/show_list.png"  alt="Filter result by Amenities" height="16" width="18"></td>
						</tr>
						<tr id="aminities">
							<td></td>
							<td><input name="have_swimming_pool" type="checkbox" />Swimming
								Pool</br>
							<input name="have_club_house" type="checkbox" />Club
								House</br> <input name="have_community_hall" type="checkbox"
								 />Community Hall</br> <input
								name="have_security_camera" type="checkbox" />Security Camera</br> <input
								name="have_garden" type="checkbox"  />Garden</br> <input
								name="have_gym" type="checkbox" />Gymnasium</br> <input
								name="have_lift" type="checkbox" />Power backup lift</br></td>
						</tr>

						<div height="100px"></div>

						<tr>
							<td colSpan="2">
								<fieldset>
									<input type="submit"  value="Search"
										class="form-submit" /> <input type="reset" value="Reset"
										class="form-reset" />
								</fieldset>
							</td>
						</tr>




					</form:form>
				</table>
			</div>
		</div>
	</div>
	<!--==============================footer=================================-->
	<%@include file="d2r_footer.jsp"%>
</body>
</html>