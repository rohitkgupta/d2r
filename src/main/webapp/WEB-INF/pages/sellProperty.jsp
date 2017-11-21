<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Dreams to Realty | Sell Property</title>
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
$( document ).ready(function() {
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
		  var $el = $('[name="interestedIn"]');
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
					<form:form method="post" action="saveSeller"
						modelAttribute="productForm">
						<tr>
							<td>Name :</td>
							<td>
							<input  id="searchInput" name="name" type="text"
								class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
								placeholder="Name" id="name" value="${customer.name}" required />
							</td>
						</tr>
						
						<tr>
							<td>Email :</td>
							<td>
							<input  id="searchInput" name="email" type="email"
								class="validate[required,custom[email]] feedback-input"
								id="email" placeholder="Email" value="${customer.email}" />
							</td>
						</tr>						
						
						<tr>
							<td>City :</td>
							<td>
							<input  id="searchInput" name="city" type="text"
								class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
								placeholder="City" id="city" value="${customer.city}" />
						</td>
						</tr>
						<tr>
							<td>Phone :</td>
							<td>
							<input  id="searchInput" name="phone" type="text" pattern="[789][0-9]{9}"
								class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
								placeholder="Phone" id="phone" value="${customer.phone}"
								required />
							</td>
						</tr>
						
						<tr>
							<td>Category :</td>
							<td><input type="radio" name="category" value="Residential"
								checked> Residential <input type="radio" name="category"
								value="Commercial"> Commercial <input type="radio"
								name="category" value="Agricultural"> Agricultural</td>
						</tr>
						<tr>
							<td>I wish to :</td>
							<td>
								<input type="radio" name="wantTo" value="Sell" checked>Sell 
								<input type="radio" name="wantTo" value="Rent out"> Rent Out
							</td>
						</tr>



						<tr>
							<td>I want to Sell/Rent Out :</td>
							<td><select id="searchInput" name="interestedIn"
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
							<td colSpan="2">
								<fieldset>
									<input type="submit" value="Submit" class="form-submit" /> <input
										type="reset" value="Reset" class="form-reset" />
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