<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<f:form action="postFeedback" modelAttribute="addFeedback"
		method="POST">
		<textarea rows="5" cols="15" name="feedbackDesc"></textarea>
		<br>
		<input type="radio" name="ratings" value="1">
		<input type="radio" name="ratings" value="2">
		<input type="radio" name="ratings" value="3">
		<input type="radio" name="ratings" value="4">
		<input type="radio" name="ratings" value="5">
		<br>
		<input type="submit">
	</f:form>
</body>
</html>