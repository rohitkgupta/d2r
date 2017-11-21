<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	String type= "Image";;
	String sizeMsg="JPEG, PNG 2 MB max per image";
%>
<title>Upload <%=type%></title>
<script src="js/jquery/jquery.min.js"></script>
<script>
$(document).ready(function() {
    //add more file components if Add is clicked
    $('#addFile').click(function() {
        var fileIndex = $('#fileTable tr').children().length;
        $('#fileTable').append(
                '<tr><td>'+
                '   <input type="file" name="images['+ fileIndex +']" required=true />'+
                '</td></tr>');
    });
     
});

</script>
<%@include file="include_admin.jsp"%>
<%-- <%@include file="include.jsp"%> --%>
</head>
<body>
	<%@include file="Header.jsp"%>
	<h1>Project Saved successfully. Please add more images to project</h1>
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
							<tr><th></th>
								<td align="center"><h1>Select files to upload</h1></td><td></td>
							</tr>
							<tr><th></th>
								<td><input id="addFile" type="button" class="myButton"
									value="Add File" /></td>
								<td>
									<div class="bubble-left"></div>
									<div class="bubble-inner">Press Add button to add more
										file.</div>
									<div class="bubble-right"></div>
								</td>
							</tr>
							<tr><th></th>
							<td>
							<form:form method="post" action="saveImages" modelAttribute="productForm"
							enctype="multipart/form-data">
								<input name="PID" type="hidden" value="${pid}" /><br><br>
								<table id="fileTable">
									<tr>
										<td><input name="images[0]" type="file" required=true /></td>
									</tr>
								</table>
							</td><td></td>
							</tr><br><br>
							<tr><th></th>
								<td><input type="submit" value="Upload" class="myButton"/></td><td>
									<div class="bubble-left"></div>
									<div class="bubble-inner"><%=sizeMsg %></div>
									<div class="bubble-right">
								</td>
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
	<%@include file="footer.jsp"%>
</body>
</html>