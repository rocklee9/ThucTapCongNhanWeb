<%@page import="model.bean.Song"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
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
						<h2 class="pageheader-title">Sửa bài hát</h2>

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
										String name = "";
										String preview = "";
										String detail = "";
										String picture = "";
										int cat_id = 0;
										Song objSong = null;
										if (request.getAttribute("objSong") != null) {
											objSong = (Song) request.getAttribute("objSong");
											name = objSong.getSongName();
											preview = objSong.getPreviewText();
											detail = objSong.getDetailText();
											cat_id = objSong.getObjCat().getCatId();
											picture = objSong.getPicture();
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
										action="<%=request.getContextPath()%>/admin/song/edit?sid=<%=objSong.getId()%>"
										method="post" enctype="multipart/form-data" id="form">
										<div class="form-group">
											<label for="name">Tên bài hát</label> <input type="text"
												id="name" value="<%if (name != null)
				out.print(name);%>"
												name="name" class="form-control" />
										</div>
										<div class="form-group">
											<label for="category">Danh mục bài hát</label> <select
												id="category" name="cat_id" class="form-control">
												<%
													if (request.getAttribute("listCat") != null) {
														ArrayList<Category> listCat = (ArrayList<Category>) request.getAttribute("listCat");
														if (listCat.size() > 0) {
															for (Category objCat : listCat) {
												%>
												<option
													<%if (cat_id == objCat.getCatId())
							out.print(" selected ");%>
													value="<%=objCat.getCatId()%>"><%=objCat.getCatName()%></option>
												<%
													}
														}
													}
												%>
											</select>
										</div>
										<div class="form-group">
											<label for="picture">Hình ảnh</label> <input type="file"
												name="picture" onchange="readURL(this);" />
											<%
												if (!picture.isEmpty()) {
											%>
											<br /> <img width="200px" height="130px" id="img"
												alt="hinhanh"
												src="<%=request.getContextPath()%>/files/<%=picture%>">
											<br />
											<%
												} else {
											%>
											<br /> <img width="200px" height="130px" id="img"
												alt="hinhanh"
												src="<%=request.getContextPath()%>/templates/admin/assets/img/no.gif">
											<br />
											<%
												}
											%>
										</div>
										<div class="form-group">
											<label for="preview">Mô tả</label>
											<textarea id="preview" class="form-control" rows="3"
												name="preview">
												<%
													if (preview != null)
														out.print(preview);
												%>
											</textarea>
										</div>
										<div class="form-group">
											<label for="detail">Chi tiết</label>
											<textarea id="detail" class="form-control" id="detail"
												rows="5" name="detail">
												<%
													if (detail != null)
														out.print(detail);
												%>
											</textarea>
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
	$().ready(
			function() {
				// validate form when it submited
				$('#form').validate(
						{
							errorPlacement : function(error, element) {
								$(element).closest("form").find(
										"label[for='" + element.attr("id")
												+ "']").append(error);
							},
							errorElement : "span",
							rules : {
								name : {
									required : true,
								},
								preview : {
									required : true,
								},
							},
							messages : {
								name : {
									required : " (Vui lòng nhập trường này)",
								},
								preview : {
									required : " (Vui lòng nhập trường này)",
								},
							},
						});
			});
</script>
<script>
	var editor = CKEDITOR.replace("detail");
</script>
<script>
	document.getElementById("song").classList.add('active-menu');
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#img').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>