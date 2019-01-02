<%@page import="model.bean.Slide"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.SlideDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>My song</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Mosaic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/templates/public/images/favicon.ico">
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- Bootstrap Core CSS -->
	<link href="<%=request.getContextPath()%>/templates/public/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<!-- Custom CSS -->
	<link href="<%=request.getContextPath()%>/templates/public/css/style.css" rel='stylesheet' type='text/css' />
	<link href="<%=request.getContextPath()%>/templates/public/css/style2.css" rel='stylesheet' type='text/css' />
	<!-- Graph CSS -->
	<link href="<%=request.getContextPath()%>/templates/public/css/font-awesome.css" rel="stylesheet"> 
	<!-- jQuery -->
	<!-- lined-icons -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/css/icon-font.css" type='text/css' />
	<!-- //lined-icons -->
	<!-- Meters graphs -->
	<link href="https://fonts.googleapis.com/css?family=Sarabun" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/templates/public/js/jquery-2.1.4.js"></script>
	
</head> 
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed">
	<section>
		<!-- left side start-->
		<div class="left-side sticky-left-side">
			
			<!--logo and iconic logo start-->
			<div class="logo">
				<h1><a href="<%=request.getContextPath()%>">My<span>song</span></a></h1>
			</div>
			<div class="logo-icon text-center">
				<a href="<%=request.getContextPath()%>">M </a>
			</div>
			<!-- /w3l-agile -->
			<!--logo and iconic logo end-->
			<div class="left-side-inner">
				
				<!--sidebar nav start-->
				<ul class="nav nav-pills nav-stacked custom-nav">
					<li class="active"><a href="<%=request.getContextPath()%>"><i class="lnr lnr-home"></i><span>Home</span></a></li>
					<li><a href="radio.html"><i class="camera"></i> <span>Radio</span></a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal1"><i class="fa fa-th"></i><span>Apps</span></a></li>
					<li><a href="radio.html"><i class="lnr lnr-users"></i> <span>Artists</span></a></li> 
					<li><a href="browse.html"><i class="lnr lnr-music-note"></i> <span>Albums</span></a></li>						
					<li class="menu-list"><a href="browse.html"><i class="lnr lnr-indent-increase"></i> <span>Browser</span></a>  
						<ul class="sub-menu-list">
							<li><a href="browse.html">Artists</a> </li>
							<li><a href="404.html">Services</a> </li>
						</ul>
					</li>
					<li><a href="blog.html"><i class="lnr lnr-book"></i><span>Blog</span></a></li>
					<li><a href="typography.html"><i class="lnr lnr-pencil"></i> <span>Typography</span></a></li>
					<li class="menu-list"><a href="#"><i class="lnr lnr-heart"></i>  <span>My Favourities</span></a> 
						<ul class="sub-menu-list">
							<li><a href="radio.html">All Songs</a></li>
						</ul>
					</li>
					<li class="menu-list"><a href="<%=request.getContextPath() %>/lien-he"><i class="fa fa-thumb-tack"></i><span>Contact</span></a>
						<ul class="sub-menu-list">
							<li><a href="<%=request.getContextPath() %>/lien-he">Location</a> </li>
						</ul>
					</li>     
				</ul>
				<!--sidebar nav end-->
			</div>
		</div>
        <!-- /w3layouts-agile -->
        
        <!-- left side end-->
        <!-- main content start-->
        <div class="main-content">
            <!-- header-starts -->
            <div class="header-section">
                <!--toggle button start-->
                <a class="toggle-btn  menu-collapsed"><i class="fa fa-bars"></i></a>
                <!--toggle button end-->
                <!--notification menu start -->
                <div class="menu-right">
                    <div class="profile_details">		
                       
                        <div class="col-md-4 player">
                            <div class="audio-player">									
                            </div>
                            <!--audio-->
                            <link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/templates/public/css/audio.css">
                            <script type="text/javascript" src="<%=request.getContextPath()%>/templates/public/js/mediaelement-and-player.min.js"></script>
                            <!---->
                            <ul class="next-top">
                                <li><a class="ar" href="#"></a></li>
                                <li><a class="ar2" href="#"></a></li>			
                            </ul>	
                        </div>
                    </div>
                    <!-------->
                </div>
                <div class="clearfix"></div>
            </div>
