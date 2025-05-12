<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<title>Chỉnh sửa sinh viên</title>
</head>

<body>
	<h2>Chỉnh sửa thông tin sinh viên</h2>

	<c:if test="${not empty message}">
		<div style="color: red;">${message}</div>
	</c:if>
	<form action="student" method="post">
		<input type="hidden" name="action" value="updateStudent" required />
		<input type="hidden" name="studentID" value="${student.studentID}" />
		<input type="hidden" name="name" value="${student.name}" required /><br />
		<input type="hidden" name="gender" value="${student.gender}" required /><br />
		<input type="hidden" name="dob" value="${student.dob}" required /><br />

		<label>Email:</label>
		<input type="email" name="email" value="${student.email}" required /><br />

		<button type="submit">Cập nhật</button>
	</form>
</body>

</html>