<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="com.admin.pojo.CaptchasDotNet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" media="screen"
	href="resources/css/customer_form_style.css">
<script src="resources/js/jquery.min.js"></script>
<script>
	$('#message').hide();
	if("${msg}"!=""){
		if("${msg}"=="success"){
			try{
		        parent.jQuery.fancybox.close();
		    }catch(err){
		        parent.$('#fancybox-overlay').hide();
		        parent.$('#fancybox-wrap').hide();
		    }
		}else{
			$('#error').text("${msg}");
		}
	}
</script>
</head>
<body>
	<!-- <div id="message"></div> -->
	<div id="customerFormDiv">
	<div id="form-main">
		<h3>Please fill the form for better assistance.</h3>
		<div id="form-div" style="width:370px;">
			<form class="form" id="form1" method="post"
				modelAttribute="customerForm" enctype="multipart/form-data"
				action="<%=response.encodeUrl("check")%>">
				<input name="interestedIn" type="hidden" value="${param.type}"/>
				<p class="name">
					<input name="name" type="text" style="width:350px; height:45px;" 
						class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
						placeholder="Name" id="name" value="${customer.name}" required/>
				</p>
				<p class="email">
					<input name="email" type="email" style="width:350px; height:45px;"
						class="validate[required,custom[email]] feedback-input" id="email"
						placeholder="Email" value="${customer.email}"/>
				</p>
				<p class="city">
					<input name="city"  type="text" style="width:350px; height:45px;"
						class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
						placeholder="City" id="city" value="${customer.city}"/>
				</p>
				<p class="phone">
					<input name="phone" type="text" pattern="[789][0-9]{9}" style="width:350px; height:45px;"
						class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
						placeholder="Phone" id="phone" value="${customer.phone}" required/>
				</p>
				<p><select name="budget" style="padding: 5px 10px;width: 350px;height:35px;font-family: 'Montserrat', Arial, Helvetica, sans-serif;color:#3c3c3c;"
								class="styledselect_form_1" required>
									<option value="">Please select budget</option>
									<option value="10-20 Lacs">10-20 Lacs</option>
									<option value="20-30 Lacs">20-30 Lacs</option>
									<option value="30-50 Lacs">30-50 Lacs</option>
									<option value="50-75 Lacs">50-75 Lacs</option>
									<option value="75-90 Lacs">75-90 Lacs</option>
									<option value="1-1.5 Crore">1-1.5 Crore</option>
									<option value="1.5-3 Crore">1.5-3 Crore</option>
									<option value="3-5 Crore">3-5 Crore</option>
									<option value="5-8 Crore">5-8 Crore</option>
									<option value="8-10 Crore">8-10 Crore</option>
							</select>
				</p>
				

				<%-- <%
					// Construct the captchas object (Default Values)
					CaptchasDotNet captchas = new CaptchasDotNet(
							request.getSession(true), // Ensure session
							"rohitbhopal06", // client
							"yvjGsgNRGBJko7gFPpFdCKPZEFpiM5qYTOQ0lRn2" // secret
					);
				
					//onclick="parent.jQuery.fancybox.close()"
				%> --%>
<%-- 
				<table style="width:350px;">
					<tr>
						<td>Please enter below code:</td>
						<td><input name="password" size="16" style="height:20px; " /></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<%=captchas.image()%><br>
						</td>
					</tr>
					<tr><span id="error" style="color:rgb(255, 52, 52);"></span></tr>
				</table> --%>
				<br>
				<div class="submit">
					<input type="submit" value="SUBMIT" style="width:350px; " id="button-blue" />
					<div class="ease"></div>
				</div>
			</form>
		</div>
		</div>
</body>
</html>