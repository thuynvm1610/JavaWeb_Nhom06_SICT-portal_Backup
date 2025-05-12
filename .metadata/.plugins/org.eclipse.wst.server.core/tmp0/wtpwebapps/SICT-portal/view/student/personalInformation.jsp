<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Danh sách sinh viên</title>
	<style>
		table {
			border-collapse: collapse;
			width: 50%;
		}

		th,
		td {
			border: 1px solid black;
			padding: 5px;
			text-align: left;
		}

		th {
			background-color: #f2f2f2;
		}
	</style>
</head>

<body>
	<h2>Thông tin cá nhân</h2>
	<!-- Hiển thị thông báo nếu có -->
	<c:if test="${not empty message}">
		<div style="color: red;">${message}</div>
	</c:if>

	<!-- Bảng hiển thị thông tin sinh viên -->
	<table>
		<thead>
			<tr>
				<th>Mã SV</th>
				<th>Họ tên</th>
				<th>Giới tính</th>
				<th>Ngày sinh</th>
				<th>Email</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${student.studentID}</td>
				<td>${student.name}</td>
				<td>${student.gender}</td>
				<td>${student.dob}</td>
				<td>${student.email}</td>
			</tr>
		</tbody>
	</table>
</body>

</html>