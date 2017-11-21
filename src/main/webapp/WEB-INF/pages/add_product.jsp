<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Event</title>
<script src="js/jquery/jquery.min.js"></script>
<%@include file="include_admin.jsp"%>
</head>
<body>
	<%@include file="Header.jsp"%>
	<h1>Add New Project</h1>
	<h2>${msg}</h2>
	<table border="0" width="100%" cellpadding="0" cellspacing="0"
		id="content-table">
		<tr>
			<th rowspan="3" class="sized"><img
				src="images/shared/side_shadowleft.jpg" width="20" height="300"
				alt="" /></th>
			<th class="topleft"></th>
			<td id="tbl-border-top">&nbsp;</td>
			<th class="topright"></th>
			<th rowspan="3" class="sized"><img
				src="images/shared/side_shadowright.jpg" width="20" height="300"
				alt="" /></th>
		</tr>
		<tr>
			<td id="tbl-border-left"></td>
			<td>
				<!--  start content-table-inner -->
				<div id="content-table-inner">
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<form:form method="post" action="saveProduct"
							modelAttribute="productForm" enctype="multipart/form-data">
							<tr>
								<th valign="top">Project Title:</th>
								<td><input type="text" class="inp-form" name="title" required=true/></td>
								<td>
									<div class="error-left"></div>
									<div class="error-inner">This field is required.</div>
								</td>
							</tr>
							<tr>
								<th valign="top">Project Description:</th>
								<td><input type="text" class="form-textarea" name="description"/></td>
								<td><div class="error-left"></div>
									<div class="error-inner">This field is required.</div>
								</td>
							</tr>
							<tr>
								<th valign="top">Project Category:</th>
								<td><select name="category" class="styledselect_form_1">
										<option value="Residential">Residential</option>
										<option value="Commercial">Commercial</option>
										<option value="Agricultural">Agricultural</option>
								</select></td>
								<td>
								</td>
							</tr>
							<tr>
								<th valign="top">For:</th>
								<td><select name="isFor" class="styledselect_form_1">
										<option value="Sell">Sell</option>
										<option value="Rent">Rent</option>
								</select></td>
								<td>
								</td>
							</tr>
							<tr>
								<th valign="top">Project Type:</th>
								<td><select name="type" class="styledselect_form_1">
										<option value="bungalows">Bungalows / Villas</option>
										<option value="flats">Flats & Apartments</option>
										<option value="row_house">Row House</option>
										<option value="penthouse">Penthouse</option>
										<option value="studio_apartment">Studio Apartment</option>
										<option value="plot">Plot</option>
										<option value="farm_house">Farm House</option>
										<option value="commercial_plots">Commercial Lands & Plots</option>
										<option value="office_space">Office Space</option>
										<option value="commercial_space">Commercial Space</option>
								</select></td>
								<td>
									
								</td>
							</tr>
							<tr>
								<th valign="top">City:</th>
								<td><select name="city" class="styledselect_form_1">
									<option value="Bhopal">Bhopal</option>
									<option value="Dewas">Dewas</option>
									<option value="Indore" selected>Indore</option>
									<option value="Mahu">Mahu</option>
									<option value="Pithampur">Pithampur</option>
									<option value="Rau">Rau</option>
									<option value="Ujjain">Ujjain</option>
								</select></td>
								<td>
								
								</td>
							</tr>
							<!-- <tr>
								<th valign="top">Location:</th>
								<td><select name="location" class="styledselect_form_1">
										<option value="Indore East">Indore East</option>
										<option value="Indore West">Indore West</option>
										<option value="Indore North">Indore North</option>
										<option value="Indore South">Indore South</option>
										<option value="Super Corridor">Super Corridor</option>
								</select></td>
								<td>
								</td>
							</tr> -->
							<tr>
								<th valign="top">Budget:</th>
								<td><select name="budget" class="styledselect_form_1">
										<option value=""></option>
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
								<td></td>
							</tr>
							<tr>
								<th>Cover Image:</th>
								<td><input name="primaryImage" type="file" required=true /></td>
								<td></td>
							</tr>
							
							</tr>
							<tr>
								<th>Amenities:</th>
								<td><input name="have_swimming_pool" type="checkbox" />Swimming Pool</br></td>
							</tr>
							<tr>
								<th>  </th>
								<td><input name="have_club_house" type="checkbox" />Club House</br></td>
							</tr>
							<tr>
								<th>  </th>
								<td><input name="have_community_hall" type="checkbox" checked=true/>Community Hall</br></td>
							</tr>
							<tr>
								<th>  </th>
								<td><input name="have_security_camera" type="checkbox" />Security Camera</br></td>
							</tr>
							<tr>
								<th>  </th>
								<td><input name="have_garden" type="checkbox" checked=true/>Garden</br></td>
							</tr>
							<tr>
								<th>  </th>
								<td><input name="have_gym" type="checkbox" />Gymnasium</br></td>
							</tr>
							<tr>
								<th>  </th>
								<td><input name="have_lift" type="checkbox" 	/>Power backup lift</br></td>
							</tr>
							
							<tr><th></th><div height="100px"></div></td><td></td></tr>
							<tr>
								<th>&nbsp;</th>
								<td valign="top"><input type="submit" value=""
									class="form-submit" /> <input type="reset" value=""
									class="form-reset" /></td>
								<td></td>
							</tr>

						</form:form>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<th class="sized bottomleft"></th>
			<td id="tbl-border-bottom">&nbsp;</td>
			<th class="sized bottomright"></th>
		</tr>
	</table>
<%@include file="footer.jsp" %>
</body>
</html>