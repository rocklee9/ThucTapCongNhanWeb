<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Encode+Sans+Condensed|Merriweather|Playfair+Display" rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/templates/admin/assets/vendor/bootstrap/css/bootstrap.css">
	<%-- <link rel="stylesheet"
	href="<%=request.getContextPath() %>/templates/admin/assets/css/bootstrap.css"> --%>
<link
	href="<%=request.getContextPath() %>/templates/admin/assets/vendor/fonts/circular-std/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/templates/admin/assets/libs/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/templates/admin/assets/vendor/fonts/fontawesome/css/fontawesome-all.css"> 
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/templates/admin/assets/vendor/charts/chartist-bundle/chartist.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/templates/admin/assets/vendor/charts/morris-bundle/morris.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/templates/admin/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/templates/admin/assets/vendor/charts/c3charts/c3.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/templates/admin/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
	
	<%-- <link href="<%=request.getContextPath() %>/templates/admin/assets/css/bootstrap.css" rel="stylesheet" /> --%>
	 <%-- <link href="<%=request.getContextPath() %>/templates/admin/assets/css/custom.css" rel="stylesheet" /> --%>
	 <!-- CKEDITOR-->
    <script src="<%=request.getContextPath() %>/library/ckeditor/ckeditor.js"></script>
    <%-- <link href="<%=request.getContextPath() %>/templates/admin/assets/css/font-awesome.css" rel="stylesheet" /> --%>
	
<title>Nhạc hay việt</title>
</head>

<body>
    
    <div class="dashboard-main-wrapper">    
         <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="index.html">Nhạc hay việt</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " style="margin-right:20px;border-radius:5px;" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <% if (session.getAttribute("userInfo") != null) {
            		          User objUser = (User) session.getAttribute("userInfo");
                          %>
                        <li class="nav-item " style="border-radius:5px;">
                              Xin chào, <b><%=objUser.getFullname() %></b> &nbsp; <a href="<%=request.getContextPath() %>/auth/logout" class="btn btn-danger square-btn-adjust" style="border-radius:5px;">Đăng xuất</a> 
                        </li>
                        <% } %>
                        
                    </ul>
                </div>
            </nav>
        </div>