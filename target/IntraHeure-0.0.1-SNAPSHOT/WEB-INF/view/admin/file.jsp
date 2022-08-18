<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<f:form action="fileup" method="post" enctype="multipart/form-data" modelAttribute="file">
<input type="file" name="file">
		<input type="submit">
	</f:form>
</body>
</html>