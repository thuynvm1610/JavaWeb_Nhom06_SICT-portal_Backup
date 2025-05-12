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
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 sidebar p-0">
                <div class="text-left p-3 bg-dark">
                    <h4 class="text-white">Hệ thống quản lý</h4>
                </div>
                <ul class="nav flex-column">
                    <li class="nav-item active">
                        <form method="get" action="admin">
                            <input type="hidden" name="action" value="dashboard">
                            <button type="submit" class="sidebar-btn">
                                <div class="sidebar__icon-container">
                                    <i class="fas fa-tachometer-alt me-2"></i>
                                </div>
                                Dashboard
                            </button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form method="get" action="admin">
                            <input type="hidden" name="action" value="accountList">
                            <button type="submit" class="sidebar-btn">
                                <div class="sidebar__icon-container">
                                    <i class="fas fa-users me-2"></i>
                                </div>
                                Tài khoản người dùng
                            </button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form method="get" action="admin">
                            <input type="hidden" name="action" value="studentList">
                            <button type="submit" class="sidebar-btn">
                                <div class="sidebar__icon-container">
                                    <i class="fas fa-user-graduate me-2"></i>
                                </div>
                                Thông tin sinh viên
                            </button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form method="get" action="admin">
                            <input type="hidden" name="action" value="teacherList">
                            <button type="submit" class="sidebar-btn">
                                <div class="sidebar__icon-container">
                                    <i class="fas fa-chalkboard-teacher me-2"></i>
                                </div>
                                Thông tin giáo viên
                            </button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form method="get" action="admin">
                            <input type="hidden" name="action" value="classroomList">
                            <button type="submit" class="sidebar-btn">
                                <div class="sidebar__icon-container">
                                    <i class="fas fa-school me-2"></i>
                                </div>
                                Thông tin lớp học
                            </button>
                        </form>
                    </li>
                    <li class="nav-item mt-3">
                        <form method="get" action="admin">
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
                    <!-- Dashboard Tab -->
                    <div class="dashboard">
                        <h2 class="mb-4">Dashboard</h2>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="card text-white bg-primary mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title">Tài khoản người dùng</h5>
                                        <p class="card-text display-6">${totalAccount}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card text-white bg-success mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title">Sinh viên</h5>
                                        <p class="card-text display-6">${totalStudent}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card text-white bg-info mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title">Giáo viên</h5>
                                        <p class="card-text display-6">${totalTeacher}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card text-white bg-warning mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title">Lớp học</h5>
                                        <p class="card-text display-6">${totalClassroom}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>