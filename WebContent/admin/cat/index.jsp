<%@page import="util.DefineUtil"%>
<%@page import="util.MessageUtil"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
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
						<h2 class="pageheader-title">Quản lý danh mục</h2>

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
					<!-- Advanced Tables -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="table-responsive">
								<div class="row">
									<div class="col-sm-6">
										<a href="<%=request.getContextPath()%>/admin/cat/add"
											class="btn btn-success btn-md">Thêm</a>
									</div>
									<div class="col-sm-6" style="text-align: right;">
										<form method="post" action="">
											<input type="submit" name="search" value="Tìm kiếm"
												class="btn btn-warning btn-sm" style="float: right" /> <input
												type="search" required="required"
												class="form-control input-sm"
												placeholder="Nhập tên danh mục"
												style="float: right; width: 300px;" />
											<div style="clear: both"></div>
										</form>
										<br />
									</div>
								</div>
								<%
									String msgText = MessageUtil.getMessage(request);
								%>
								<%
									if (!"".equals(msgText)) {
								%>
								<div class="alert alert-success" role="alert">
									<strong><%=msgText%></strong>
								</div>
								<%
									}
								%>
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên danh mục</th>
											<th width="160px">Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<Category> listCat = null;
											if (request.getAttribute("listCat") != null) {
												listCat = (ArrayList<Category>) request.getAttribute("listCat");
												if (listCat.size() > 0) {
													for (Category objCat : listCat) {
														String urlEdit = request.getContextPath() + "/admin/cat/edit/" + objCat.getCatId();
														String urlDel = request.getContextPath() + "/admin/cat/del?cid=" + objCat.getCatId();
										%>
										<tr>
											<td><%=objCat.getCatId()%></td>
											<td class="center"><%=objCat.getCatName()%></td>
											<td class="center"><a href="<%=urlEdit%>" title=""
												class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a>
												<a href="<%=urlDel%>" onclick="return myConfirm()" title=""
												class="btn btn-danger"><i class="fa fa-pencil"></i> Xóa</a>
											</td>

										</tr>
										<%
											}
												}
											}
										%>
									</tbody>
								</table>
								<%
									int numberOfItems = (Integer) request.getAttribute("numberOfItems");
									int numberOfPages = (Integer) request.getAttribute("numberOfPages");
									int currentPage = (Integer) request.getAttribute("currentPage");
									int begin = (Integer) request.getAttribute("offset") + 1;
									int end = begin + DefineUtil.NUMBER_CAT_PER_PAGE - 1;
									if (currentPage == numberOfPages) {
										end = numberOfItems;
									}
									if (listCat != null && listCat.size() > 0) {
								%>
								<div class="row">
									<div class="col-sm-6">
										<div class="dataTables_info" id="dataTables-example_info"
											style="margin-top: 27px">
											Hiển thị từ
											<%=begin%>
											đến
											<%=end%>
											của
											<%=numberOfItems%>
											danh mục
										</div>
									</div>
									<div class="col-sm-6" style="text-align: right;">
										<div class="dataTables_paginate paging_simple_numbers"
											id="dataTables-example_paginate">
											<ul class="pagination">
												<%
													String urlPre = "";
														if (currentPage == 1) {
															urlPre = "javascript:void(0)";
														} else {
															urlPre = request.getContextPath() + "/admin/cat/index/page-" + (currentPage - 1);
														}
												%>
												<li class="paginate_button previous"
													aria-controls="dataTables-example" tabindex="0"
													id="dataTables-example_previous"><a href="<%=urlPre%>">Trang
														trước</a></li>
												<%
													String active = "";
														for (int i = 1; i <= numberOfPages; i++) {
															if (currentPage == i) {
																active = " active";
															} else {
																active = "";
															}
												%>
												<li class="paginate_button<%=active%>"
													aria-controls="dataTables-example" tabindex="0"><a
													href="<%=request.getContextPath()%>/admin/cat/index/page-<%=i%>"><%=i%></a></li>
												<%
													}
												%>
												<%
													String urlNext = "";
														if (currentPage == numberOfPages) {
															urlNext = "javascript:void(0)";
														} else {
															urlNext = request.getContextPath() + "/admin/cat/index/page-" + (currentPage + 1);
														}
												%>
												<li class="paginate_button next"
													aria-controls="dataTables-example" tabindex="0"
													id="dataTables-example_next"><a href="<%=urlNext%>">Trang
														tiếp</a></li>
											</ul>
										</div>
									</div>
								</div>
								<%
									}
								%>
							</div>

						</div>
					</div>
					<!--End Advanced Tables -->
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	document.getElementById("category").classList.add('active-menu');
	function myConfirm() {
		var rs = confirm("Bạn có chắc chắn muốn xóa?");
		if (rs) {
			return true;
		} else
			return false;
	}
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>