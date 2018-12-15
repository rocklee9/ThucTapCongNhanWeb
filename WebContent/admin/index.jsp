<%@page import="model.dao.CatDAO"%>
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
						<h2 class="pageheader-title">TRANG QUẢN TRỊ VIÊN</h2>

						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">

								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<%
				int countCat = (Integer) request.getAttribute("countCat");
				int countSong = (Integer) request.getAttribute("countSong");
				int countUser = (Integer) request.getAttribute("countUser");
				int countContact = (Integer) request.getAttribute("countContact");
				int countSlide = (Integer) request.getAttribute("countSlide");
			%>
			<!-- ============================================================== -->
			<!-- end pageheader  -->
			<!-- ============================================================== -->
			<div class="ecommerce-widget">
				<div class="row">
					<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<div class="d-inline-block">
									<h3 class="text-muted">
										<a href="<%=request.getContextPath()%>/admin/cat/index"
											title=""><b>Quản lý danh mục</b></a>
									</h3>
									<h5 class="mb-0 text-success ">
										Có
										<%=countCat%>
										danh mục
									</h5>
								</div>
								<div
									class="float-right icon-circle-medium  icon-box-lg  bg-success-light mt-1">
									<i class="fa fa-folder-open fa-fw fa-sm text-success "></i>
								</div>
							</div>



						</div>
					</div>

					<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<div class="d-inline-block">
									<h3 class="text-muted">
										<a href="<%=request.getContextPath()%>/admin/song/index"
											title=""><b>Quản lý bài hát</b></a>
									</h3>
									<h5 class="mb-0 text-primary ">
										Có
										<%=countSong%>
										bài hát
									</h5>
								</div>
								<div
									class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
									<i class="fa fa-music fa-fw fa-sm text-primary"></i>
								</div>
							</div>

						</div>
					</div>

					<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<div class="d-inline-block">
									<h3 class="text-muted">
										<a href="<%=request.getContextPath()%>/admin/user/index"
											title=""><b>Quản lý người dùng</b></a>
									</h3>
									<h5 class="mb-0 text-info">
										Có
										<%=countUser%>
										người dùng
									</h5>
								</div>
								<div
									class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
									<i class="fa fas fa-user fa-fw fa-sm text-info"></i>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="row">


					<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
						<div class="card-body">
	                                    <div class="d-inline-block">
	                                        <h3 class="text-muted"><a href="<%=request.getContextPath()%>/admin/contacts" title=""><b>Quản
											lý liên hệ</b></a></h3>
	                                        <h5 class="mb-0 text-secondary "> Có
										<%=countContact%> liên hệ</h5>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-secondary-light mt-1">
	                                        <i class="fa fa-envelope fa-fw fa-sm text-secondary"></i>
	                                    </div>
	                                </div>
							

						</div>
					</div>

					<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
						<div class="card-body">
	                                    <div class="d-inline-block">
	                                        <h3 class="text-muted"><a href="<%=request.getContextPath()%>/admin/slide/index"
										title=""><b>Quản lý slide</b></a></h3>
	                                        <h5 class="mb-0 text-brand">Có
										<%=countSlide%> slide</h5>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-brand-light mt-1">
	                                        <i class="fa fa-file-image fa-fw fa-sm text-brand"></i>
	                                    </div>
	                                </div>
							

						</div>
					</div>
				</div>
			</div>



		</div>
	</div>




	<script>
		document.getElementById("index").classList.add('active-menu');
	</script>

	<!-- /. PAGE WRAPPER  -->

</div>

<%@ include file="/templates/admin/inc/footer.jsp"%>