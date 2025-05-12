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

			th, td {
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
		<h2>Danh sách sinh viên</h2>
		<!-- Hiển thị thông báo nếu có -->
		<c:if test="${not empty message}">
			<div style="color: red;">${message}</div>
		</c:if>
		<!-- Form tìm kiếm -->
		<form method="get" action="admin">
			<input type="hidden" name="action" value="searchStudent" /> 
			<input type="text" name="studentID" placeholder="Nhập mã sinh viên..." />
			<button type="submit">Tìm kiếm</button>
		</form>
		<!-- Nút thêm mới -->
		<form method="get" action="admin">
			<input type="hidden" name="action" value="addStudentForm" /> 
			<button type="submit">Thêm sinh viên</button>
		</form>
		<!-- Bảng hiển thị sinh viên -->
		<table>
			<thead>
				<tr>
					<th>Mã SV</th>
					<th>Họ tên</th>
					<th>Giới tính</th>
					<th>Ngày sinh</th>
					<th>Email</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${studentList}">
					<tr>
						<td>${s.studentID}</td>
						<td>${s.name}</td>
						<td>${s.gender}</td>
						<td>${s.dob}</td>
						<td>${s.email}</td>
						<td>
							<div style="display: flex; gap: 5px;">
								<form method="get" action="admin">
									<input type="hidden" name="action" value="updateStudentForm"/>
									<input type="hidden" name="studentID" value="${s.studentID}"/>
									<button type="submit">Sửa</button>
								</form>
								<form method="post" action="admin">
									<input type="hidden" name="action" value="deleteStudent"/>
									<input type="hidden" name="studentID" value="${s.studentID}"/>
									<button type="submit" onclick="return confirm('Bạn có chắc muốn xóa sinh viên này?');">Xóa</button>
								</form>
							</div>
                        </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>
