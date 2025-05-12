<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Thêm sinh viên</title>
	</head>
	<body>
		<h2>Thêm sinh viên mới</h2>
		<c:if test="${not empty message}">
			<div style="color: red;">${message}</div>
		</c:if>
		<form method="post" action="${pageContext.request.contextPath}/admin">
			<input type="hidden" name="action" value="addStudent"/>

			<input type="text" name="studentID" placeholder="Mã SV" value="${student.studentID}" required/><br><br>

			<input type="text" name="name" placeholder="Họ tên" value="${student.name}" required/><br><br>

			<label for="gender">Giới tính:</label><br> 
			<select name="gender">
			    <option value="Nam" ${student.gender == 'Nam' ? 'selected' : ''}>Nam</option>
			    <option value="Nữ" ${student.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
			</select><br><br>

			<label for="gender">Ngày sinh:</label><br> 
			<input type="date" name="dob" placeholder="Ngày sinh" value="${student.dob}" required/><br><br>

			<input type="email" name="email" placeholder="Email" value="${student.email}" required/><br><br>

			<button type="submit">Thêm</button>
			<a href="${pageContext.request.contextPath}/admin?action=studentList">Huỷ</a>
		</form>
	</body>
</html>
