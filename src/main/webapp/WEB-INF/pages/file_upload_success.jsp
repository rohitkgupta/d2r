<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>File Upload</title>
<%@include file="include.jsp" %>
</head>
<body>
<%@include file="Header.jsp" %>
    <h1>File Uploaded!!</h1>
    <div size:20px></div>
    <h2>Following files are uploaded successfully.</h2>
    <h3>
        <c:forEach items="${files}" var="file">
            <li>${file}</li>
        </c:forEach>
    </h3>
    
</body>
</html>