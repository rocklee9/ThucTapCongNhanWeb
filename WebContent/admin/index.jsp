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
							<span class="icon-box bg-color-green set-icon"> <i
								class="fa fa-bars"></i>
							</span>
							<div class="text-box">
								<p class="main-text">
									<a href="<%=request.getContextPath()%>/admin/cat/index"
										title="">Quản lý danh mục</a>
								</p>
								<p class="text-muted">
									Có
									<%=countCat%>
									danh mục
								</p>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<span class="icon-box bg-color-blue set-icon"> <i
								class="fa fa-bell-o"></i>
							</span>
							<div class="text-box">
								<p class="main-text">
									<a href="<%=request.getContextPath()%>/admin/song/index"
										title="">Quản lý bài hát</a>
								</p>
								<p class="text-muted">
									Có
									<%=countSong%>
									bài hát
								</p>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<span class="icon-box bg-color-brown set-icon"> <i
								class="fa fa-rocket"></i>
							</span>
							<div class="text-box">
								<p class="main-text">
									<a href="<%=request.getContextPath()%>/admin/user/index"
										title="">Quản lý người dùng</a>
								</p>
								<p class="text-muted">
									Có
									<%=countUser%>
									người dùng
								</p>
							</div>
						</div>
					</div>

				</div>
				<div class="row">


					<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<span class="icon-box bg-color-brown set-icon"> <i
								class="fa fa-rocket"></i>
							</span>
							<div class="text-box">
								<p class="main-text">
									<a href="<%=request.getContextPath()%>/admin/contacts" title="">Quản
										lý liên hệ</a>
								</p>
								<p class="text-muted">
									Có
									<%=countContact%>
									liên hệ
								</p>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<span class="icon-box bg-color-green set-icon"> <i
								class="fa fa-bars"></i>
							</span>
							<div class="text-box">
								<p class="main-text">
									<a href="<%=request.getContextPath()%>/admin/slide/index"
										title="">Quản lý slide</a>
								</p>
								<p class="text-muted">
									Có
									<%=countSlide%>
									slide
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>



		</div>
	</div>



	<div class="footer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
					Copyright © 2018 Concept. All rights reserved. Dashboard by <a
						href="https://colorlib.com/wp/">Colorlib</a>.
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
					<div class="text-md-right footer-links d-none d-sm-block">
						<a href="javascript: void(0);">About</a> <a
							href="javascript: void(0);">Support</a> <a
							href="javascript: void(0);">Contact Us</a>
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