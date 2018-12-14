<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<div class="nav-left-sidebar sidebar-dark">

	<div class="menu-list">
		<nav class="navbar navbar-expand-lg navbar-light">

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav flex-column">
					<li class="nav-divider"></li>
					<li class="nav-divider"></li>
					<li class="nav-divider"></li>
					<li class="nav-divider"></li>
					<li class="nav-item "><a class="nav-link active" id="index"
						href="<%=request.getContextPath()%>/admin"><i
							class="fa fa-fw fa-user-circle"></i>Trang chủ </a></li>
					<li class="nav-item"><a class="nav-link" id="category"
						href="<%=request.getContextPath()%>/admin/cat/index"><i
							class="fa fa-fw fa-rocket"></i>Quản lý danh mục</a></li>
					<li class="nav-item"><a class="nav-link" id="song"
						href="<%=request.getContextPath()%>/admin/song/index"><i
							class="fas fa-fw fa-chart-pie"></i>Quản lý bài hát</a></li>
					<li class="nav-item "><a class="nav-link" id="user"
						href="<%=request.getContextPath()%>/admin/user/index"><i
							class="fab fa-fw fa-wpforms"></i>Quản lý người dùng</a></li>
					<li class="nav-item"><a class="nav-link" id="contact"
						href="<%=request.getContextPath()%>/admin/contacts"><i
							class="fa fa-envelope fa-3x"></i>Quản lý liên hệ</a></li>
					<li class="nav-item"><a class="nav-link" id="slide"
						href="<%=request.getContextPath()%>/admin/slide/index"><i
							class="fas fa-fw fa-table"></i>Quản lý slide</a></li>

				</ul>
			</div>
		</nav>
	</div>
</div>