<%@page import="model.bean.Slide"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.SlideDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>MySong</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath() %>/templates/public/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/coin-slider.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/coin-slider.min.js"></script>
<!-- JValidate-->
<script type="text/javascript" src="<%=request.getContextPath() %>/library/js/jquery.validate.min.js"></script>
<style type="text/css">
  	span.error{
  		color: red;
  	}
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="<%=request.getContextPath() %>">BSong <small>Một dự án khóa JAVA tại VinaEnter Edu</small></a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li id="index"><a href="<%=request.getContextPath() %>"><span>Trang chủ</span></a>
          <li id="contact"><a href="<%=request.getContextPath() %>/lien-he"><span>Liên hệ</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider">
        	<%
        		SlideDAO slideDAO = new SlideDAO();
    			ArrayList<Slide> listSlide = slideDAO.getItems();
    			if (listSlide.size() > 0) {
    				for (Slide objSlide : listSlide) {
        	%>
        	<a href="<%=objSlide.getLink() %>" target="_blank"><img src="<%=request.getContextPath() %>/files/<%=objSlide.getPicture() %>" width="935" height="307" alt="" /></a> 
        	<%}} %>
        </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">