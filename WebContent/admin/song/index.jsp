<%@page import="model.dao.SongDAO"%>
<%@page import="util.DefineUtil"%>
<%@page import="util.MessageUtil"%>
<%@page import="model.bean.Song"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>
<div class="dashboard-wrapper">
	<div class="dashboard-ecommerce">
		<div class="container-fluid dashboard-content ">
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="page-header">
						<h2 class="pageheader-title">Quản lý bài hát</h2>

						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">

								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- /. ROW  -->
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="table-responsive">
								<div class="row">
									<div class="col-sm-6">
										<a href="<%=request.getContextPath()%>/admin/song/add"
											class="btn btn-success btn-md">Thêm</a>
									</div>
									<div class="col-sm-6" style="text-align: right;">
										<form method="post"
											action="<%=request.getContextPath()%>/searchSong">
											<input type="submit" name="search" value="Tìm kiếm"
												class="btn btn-warning btn-sm" style="float: right" /> <input
												type="search" name="textSearch"
												class="form-control input-sm" placeholder="Nhập tên bài hát"
												required="required" style="float: right; width: 300px;" />
											<div style="clear: both"></div>
										</form>
										<br />
									</div>
								</div>
								<%
									String msgText = MessageUtil.getMessage(request);
									if (request.getParameter("searchResult") != null) {
										int search = Integer.valueOf(request.getParameter("searchResult"));
										if (search == 0) {
											msgText = "Không tìm thấy!";
										}
									}
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
								<%
									if (request.getAttribute("resultSearch") != null) {
								%>
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên bài hát</th>
											<th>Danh mục</th>
											<th>Lượt đọc</th>
											<th>Hình ảnh</th>
											<th>Trạng thái</th>
											<th width="160px">Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<Song> listSong = (ArrayList<Song>) request.getAttribute("resultSearch");
												if (listSong.size() > 0) {
													for (Song objSong : listSong) {
														String urlEdit = request.getContextPath() + "/admin/song/edit/" + objSong.getId();
														String urlDel = request.getContextPath() + "/admin/song/del?sid=" + objSong.getId();
										%>
										<tr>
											<td><%=objSong.getId()%></td>
											<td class="center"><%=objSong.getSongName()%></td>
											<td class="center"><%=objSong.getObjCat().getCatName()%></td>
											<td class="center"><%=objSong.getCounter()%></td>
											<td class="text-center">
												<%
													if (!"".equals(objSong.getPicture())) {
												%> <img width="177px"
												height="120px"
												src="<%=request.getContextPath()%>/files/<%=objSong.getPicture()%>"
												alt="<%=objSong.getSongName()%>" /> <%
 	} else {
 %> <img width="177px"
												height="120px"
												src="<%=request.getContextPath()%>/templates/admin/assets/img/no.gif" />
												<%
													}
												%>
											</td>
											<td class="text-center"><a href="javascript:void(0)"><img
													id="<%=objSong.getId()%>"
													src="<%=request.getContextPath()%>/templates/admin/assets/img/active.gif"
													alt="" /></a></td>
											<td class="text-center"><a href="<%=urlEdit%>" title=""
												class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a>
												<a href="<%=urlDel%>"
												onclick="return confirm('Bạn có muốn xóa không?')" title=""
												class="btn  btn-danger"><i class=" fas fa-trash-alt"></i> Xóa</a>
											</td>
										</tr>
										<%
											}
												}
										%>
									</tbody>
								</table>
								<%
									} else {
								%>
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên bài hát</th>
											<th>Danh mục</th>
											<th>Lượt đọc</th>
											<th>Hình ảnh</th>
											<th>Trạng thái</th>
											<th width="180px">Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<Song> listSong = null;
												if (request.getAttribute("listSong") != null) {
													listSong = (ArrayList<Song>) request.getAttribute("listSong");
													if (listSong.size() > 0) {
														for (Song objSong : listSong) {

															String urlEdit = request.getContextPath() + "/admin/song/edit/" + objSong.getId();
															String urlDel = request.getContextPath() + "/admin/song/del?sid=" + objSong.getId();
										%>
										<tr>
											<td><%=objSong.getId()%></td>
											<td class="center"><%=objSong.getSongName()%></td>
											<td class="center"><%=objSong.getObjCat().getCatName()%></td>
											<td class="center"><%=objSong.getCounter()%></td>
											<td class="text-center">
												<%
													if (!"".equals(objSong.getPicture())) {
												%> <img width="177px"
												height="120px"
												src="<%=request.getContextPath()%>/files/<%=objSong.getPicture()%>"
												alt="<%=objSong.getSongName()%>" /> <%
 	} else {
 %> <img width="177px"
												height="120px"
												src="<%=request.getContextPath()%>/templates/admin/assets/img/no.gif" />
												<%
													}
												%>
											</td>
											<%
												if (objSong.getActive() == 1) {
											%>
											<td class="text-center"><a href="javascript:void(0)"><img
													id="<%=objSong.getId()%>"
													src="<%=request.getContextPath()%>/templates/admin/assets/img/active.gif"
													alt="" /></a></td>
											<%
												} else {
											%>
											<td class="text-center"><a href="javascript:void(0)"><img
													id="<%=objSong.getId()%>"
													src="<%=request.getContextPath()%>/templates/admin/assets/img/deactive.gif"
													alt="" /></a></td>
											<%
												}
											%>
											<td class="text-center"><span><a href="<%=urlEdit%>" title=""
												class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a></span>
												<span><a href="<%=urlDel%>"
												onclick="return confirm('Bạn có muốn xóa không?')" title=""
												class="btn btn-danger"><i class="fas fa-trash-alt"></i> Xóa</a></span>
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
										int end = begin + DefineUtil.NUMBER_SONG_PER_PAGE - 1;
										if (currentPage == numberOfPages) {
											end = numberOfItems;
										}
										if (listSong != null && listSong.size() > 0) {
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
											bài hát
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
																urlPre = request.getContextPath() + "/admin/song/index/page-" + (currentPage - 1);
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
													href="<%=request.getContextPath()%>/admin/song/index/page-<%=i%>"><%=i%></a></li>
												<%
													}
												%>
												<%
													String urlNext = "";
															if (currentPage == numberOfPages) {
																urlNext = "javascript:void(0)";
															} else {
																urlNext = request.getContextPath() + "/admin/song/index/page-" + (currentPage + 1);
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
		$(document).ready(function () {
	        $('.text-center img').click(function () {
	        	var src = $(this).attr('src');
	        	var id = $(this).attr('id');
	        	
	            $.ajax({
					url: '<%=request.getContextPath()%>/xu-ly-active-song',
				type : 'POST',
				cache : false,
				data : {
					asrc : src,
					aid : id
				},
				success : function(data) {
					$('#' + id).attr('src', data);
				},
				error : function() {
					alert('Có lỗi xảy ra');
				}
			});
		});
	});
</script>
<script>
	document.getElementById("song").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>