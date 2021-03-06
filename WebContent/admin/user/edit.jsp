﻿<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>
<div class="dashboard-wrapper">
	<div class="dashboard-ecommerce">
		<div class="container-fluid dashboard-content ">
			<!-- ============================================================== -->
			<!-- pageheader  -->
			<!-- ============================================================== -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="page-header">
						<h2 class="pageheader-title">Sửa người dùng</h2>

						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">

								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- Form Elements -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<%
										String msgText = "";
										String username = "";
										String fullname = "";
										User item = (User) request.getAttribute("user");
										if (item != null) {
											username = item.getUsername();
											fullname = item.getFullname();
										}
										if (request.getParameter("msg") != null) {
											int msg = Integer.valueOf(request.getParameter("msg"));
											if (msg == 0) {
												msgText = "Có lỗi trong quá trình sửa, Vui lòng thử lại";
											}
										}
									%>
									<%
										if (!"".equals(msgText)) {
									%>
									<div class="alert alert-warning" role="alert">
										<%=msgText%>
									</div>
									<%
										}
									%>
									<form role="form"
										action="<%=request.getContextPath()%>/admin/user/edit?id=<%=item.getId()%>"
										method="post" id="form">
										<div class="form-group">
											<label for="username">Tên đăng nhập</label> <input
												type="text" id="username"
												value="<%if (username != null)
				out.print(username);%>"
												name="username" required="required" style="width: 50%"
												class="form-control" disabled="disabled" />
										</div>
										<div class="form-group">
											<label for="password">Mật khẩu</label> <input type="password"
												id="password" value="" name="password" style="width: 50%"
												class="form-control" />
										</div>
										<div class="form-group">
											<label for="fullname">Họ tên</label> <input type="text"
												id="fullname"
												value="<%if (fullname != null)
				out.print(fullname);%>"
												name="fullname" required="required" style="width: 50%"
												class="form-control" />
										</div>
										<button type="submit" name="submit"
											class="btn btn-success btn-md">Sửa</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- End Form Elements -->
				</div>
			</div>
			<!-- /. ROW  -->
		</div>
		<!-- /. PAGE INNER  -->
	</div>
</div>
<script>
	document.getElementById("user").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>