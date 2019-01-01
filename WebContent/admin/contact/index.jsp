<%@page import="util.DefineUtil"%>
<%@page import="util.MessageUtil"%>
<%@page import="model.bean.Contact"%>
<%@page import="model.bean.Song"%>
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
						<h2 class="pageheader-title">Quản lý liên hệ</h2>

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
									<div class="col-sm-6"></div>
									<!-- <div class="col-sm-6" style="text-align: right;">
										<form method="post" action="">
											<input type="submit" name="search" value="Tìm kiếm"
												class="btn btn-warning btn-sm" style="float: right" /> <input
												type="search" required="required"
												class="form-control input-sm" placeholder="Search..."
												style="float: right; width: 300px;" />
											<div style="clear: both"></div>
										</form>
										<br />
									</div> -->
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
											<th>Tên</th>
											<th>Email</th>
											<th>Website</th>
											<th>Message</th>
											<th width="85px">Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<Contact> listContact = null;
											if (request.getAttribute("listContact") != null) {
												listContact = (ArrayList<Contact>) request.getAttribute("listContact");
												if (listContact.size() > 0) {
													for (Contact item : listContact) {
										%>
										<tr>
											<td><%=item.getId()%></td>
											<td class="center"><%=item.getName()%></td>
											<td class="center"><%=item.getEmail()%></td>
											<td class="center"><%=item.getWebsite()%></td>
											<td class="center"><%=item.getMessage()%></td>
											<td class="center"><a
												onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"
												href="<%=request.getContextPath()%>/admin/contact/del?id=<%=item.getId()%>"
												title="" class="btn btn-danger"><i class="fas fa-trash-alt"></i>
													Xóa</a></td>
										</tr>
										<%
											}
												}
											} else {
										%>
										<tr>
											<td colspan="5" align="center">Chưa có liên hệ nào</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<%
									int numberOfItems = (Integer) request.getAttribute("numberOfItems");
									int numberOfPages = (Integer) request.getAttribute("numberOfPages");
									int currentPage = (Integer) request.getAttribute("currentPage");
									int begin = (Integer) request.getAttribute("offset") + 1;
									int end = begin + DefineUtil.NUMBER_CONTACT_PER_PAGE - 1;
									if (currentPage == numberOfPages) {
										end = numberOfItems;
									}
									if (listContact != null && listContact.size() > 0) {
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
											liên hệ
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
															urlPre = request.getContextPath() + "/admin/contacts/page-" + (currentPage - 1);
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
													href="<%=request.getContextPath()%>/admin/contacts/page-<%=i%>"><%=i%></a></li>
												<%
													}
												%>
												<%
													String urlNext = "";
														if (currentPage == numberOfPages) {
															urlNext = "javascript:void(0)";
														} else {
															urlNext = request.getContextPath() + "/admin/contacts/page-" + (currentPage + 1);
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
	document.getElementById("contact").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>