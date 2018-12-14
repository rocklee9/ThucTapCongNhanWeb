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
						<h2 class="pageheader-title">Thêm danh mục</h2>

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
										if (request.getParameter("msg") != null) {
											int msg = Integer.valueOf(request.getParameter("msg"));
											if (msg == 0) {
												msgText = "Có lỗi trong quá trình thêm, Vui lòng thử lại";
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
									<form role="form" method="post"
										action="<%=request.getContextPath()%>/admin/cat/add"
										id="form">
										<div class="form-group">
											<label for="name">Tên danh mục</label> <input
												required="required" type="text" id="name" value=""
												name="name" class="form-control" />
										</div>
										<button type="submit" name="submit"
											class="btn btn-success btn-md">Thêm</button>
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
	document.getElementById("category").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>