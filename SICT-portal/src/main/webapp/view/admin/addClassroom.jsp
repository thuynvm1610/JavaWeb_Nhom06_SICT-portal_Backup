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
                    <li class="nav-item">
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
                    <li class="nav-item active">
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
                    <li class="nav-item">
                        <form method="get" action="admin">
                            <input type="hidden" name="action" value="student_classroom">
                            <button type="submit" class="sidebar-btn">
                                <div class="sidebar__icon-container">
                                    <i class="fas fa-user-plus me-2"></i>
                                </div>
                                Sinh viên - Lớp học
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
                    <!-- Classrooms Tab -->
                    <div>
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h2>Quản lý thông tin lớp học</h2>
                            <form method="get" action="admin">
                                <input type="hidden" name="action" value="addClassroomForm" />
                                <button class="btn btn-primary" type="submit">
                                    <i class="fas fa-plus me-1"></i>
                                    Thêm lớp học
                                </button>
                            </form>
                        </div>
                        <div class="card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <span>Danh sách lơp học</span>
                                <form method="get" action="admin">
                                    <div style="display: flex;">
                                        <input type="hidden" name="action" value="searchClassroom" />
                                        <input
                                            style="outline: none; border: none; border-bottom-left-radius: 6px; border-top-left-radius: 6px; padding-left: 10px;"
                                            type="text" name="classroomID" placeholder="Nhập mã lớp học..." />
                                        <button class="btn btn-outline-secondary" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div style="max-height: 520.5px; overflow: auto;">
                                        <table class="table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Mã lớp</th>
                                                    <th>Tên lớp</th>
                                                    <th>Mã GV</th>
                                                    <th>Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="c" items="${classroomList}">
                                                    <tr>
                                                        <td>${c.classroomID}</td>
                                                        <td>${c.name}</td>
                                                        <td>${c.teacherID}</td>
                                                        <td>
                                                            <div style="display: flex; gap: 5px;">
                                                                <form method="get" action="admin">
                                                                    <input type="hidden" name="action"
                                                                        value="updateClassroomForm" />
                                                                    <input type="hidden" name="classroomID"
                                                                        value="${c.classroomID}" />
                                                                    <button class="btn btn-sm btn-warning"
                                                                        type="submit">
                                                                        <i class="fas fa-edit"></i>
                                                                    </button>
                                                                </form>
                                                                <form method="get" action="admin">
                                                                    <input type="hidden" name="action"
                                                                        value="deleteClassroomForm" />
                                                                    <input type="hidden" name="classroomID"
                                                                        value="${c.classroomID}" />
                                                                    <button class="btn btn-sm btn-danger" type="submit">
                                                                        <i class="fas fa-trash"></i>
                                                                    </button>
                                                                </form>
                                                                <form method="get" action="admin">
                                                                    <input type="hidden" name="action"
                                                                        value="searchStudentListByClassroomID" />
                                                                    <input type="hidden" name="classroomID"
                                                                        value="${c.classroomID}" />
                                                                    <button class="btn btn-sm btn-info" type="submit">
                                                                        <i class="fas fa-eye"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Add Classroom Modal -->
    <div class="modal fade" id="addClassroomModal" tabindex="-1" aria-labelledby="addClassroomModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm lớp học mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <c:if test="${not empty message}">
                        <div class="alert-error">
                            &#9888; ${message}
                        </div>
                    </c:if>
                    <form method="post" action="admin">
                        <input type="hidden" name="action" value="addClassroom" />
                        <div class="mb-3">
                            <label for="classroomID" class="form-label">Mã lớp học</label>
                            <input id="classroomID" class="form-control" type="text" name="classroomID"
                                value="${classroom.classroomID}" required>
                        </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">Tên lớp học</label>
                            <input id="name" class="form-control" type="text" name="name" value="${classroom.name}"
                                required>
                        </div>
                        <div class="mb-3">
                            <label for="teacherID" class="form-label">Mã GV</label>
                            <input id="teacherID" class="form-control" type="text" name="teacherID"
                                value="${classroom.teacherID}" required>
                        </div>
                        <div style="display: flex; flex-direction: row-reverse;">
                            <button style="margin-left: 10px;" type="submit" class="btn btn-primary">Lưu</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        window.addEventListener('DOMContentLoaded', (event) => {
            var myModal = new bootstrap.Modal(document.getElementById('addClassroomModal'));
            myModal.show();
        });
    </script>
</body>

</html>