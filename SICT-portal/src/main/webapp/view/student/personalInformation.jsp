<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ thống quản lý trường SICT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <style>
        .user-profile {
            display: flex;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
            object-fit: cover;
        }

        .user-info {
            color: white;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 sidebar p-0">
                <div class="user-profile">
                    <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Flogowik.com%2Funiversity-student-icon-66184.html&psig=AOvVaw0UT0XrHQgGnrdMrOjotf9l&ust=1747529882775000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLC6r6amqY0DFQAAAAAdAAAAABAU"
                        alt="User Avatar" class="user-avatar">
                    <div class="user-info">
                        <h6 class="user-name" id="sidebarUserName">${studentName}</h6>
                        <span class="user-role" id="sidebarUserRole">Sinh viên</span>
                    </div>
                </div>
                <ul class="nav flex-column">
                    <li class="nav-item active">
                        <form method="get" action="student">
                            <input type="hidden" name="action" value="personalInformation">
                            <button type="submit" class="sidebar-btn">
                                <div class="sidebar__icon-container">
                                    <i class="fas fa-id-card me-2"></i>
                                </div>
                                Thông tin cá nhân
                            </button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form method="get" action="student">
                            <input type="hidden" name="action" value="personalInformation">
                            <button type="submit" class="sidebar-btn">
                                <div class="sidebar__icon-container">
                                    <i class="fas fa-user-cog me-2"></i> 
                                </div>
                                Thông tin tài khoản
                            </button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form method="get" action="admin">
                            <input type="hidden" name="action" value="accountList">
                            <button type="submit" class="sidebar-btn">
                                <div class="sidebar__icon-container">
                                    <i class="fas fa-school me-2"></i> 
                                </div>
                                Danh sách lớp học
                            </button>
                        </form>
                    </li>
                    <li class="nav-item mt-3">
                        <form method="get" action="student">
                            <input type="hidden" name="action" value="logout">
                            <button type="submit" class="sidebar-btn">
                                <div class="sidebar__icon-container">
                                    <i class="fas fa-sign-out-alt me-2"></i>
                                </div>
                                Đăng xuất
                            </button>
                        </form>
                    </li>
                </ul>
            </div>
            <!-- Main content -->
            <div class="col-md-10 main-content">
                <div class="tab-content">
                    <!-- Personal Information Tab -->
                    <h2 class="mb-4">Thông tin cá nhân</h2>
                    <div class="card">
                        <div class="card-header">
                            <span>Thông tin cá nhân</span>
                        </div>
                        <div class="card-body">
                            <form method="post" action="student">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="name" class="form-label">Họ và tên</label>
                                                <input type="text" class="form-control" id="name" name="name"
                                                    value="${student.name}" disabled>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="studentID" class="form-label">Mã sinh viên</label>
                                                <input type="text" class="form-control" id="studentID" name="studentID"
                                                    value="${student.studentID}" disabled>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="dob" class="form-label">Ngày sinh</label>
                                                <input type="text" class="form-control" id="dob" name="dob"
                                                    value="${student.dob}" disabled>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="gender" class="form-label">Giới tính</label>
                                                <input type="text" class="form-control" id="gender" name="gender"
                                                    value="${student.gender}" disabled>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="email" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="email" name="email"
                                                    value="${student.email}" disabled>
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" class="btn btn-primary">Cập nhật email</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>