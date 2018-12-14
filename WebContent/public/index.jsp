<%@page import="model.bean.Song"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
  	<%
  		ArrayList<Song> listSong = null;
  	  		if(request.getAttribute("listSong") != null){
  	  			listSong = (ArrayList<Song>)request.getAttribute("listSong");
  	  			if(listSong.size() > 0) {
  	  				for(Song objSong:listSong) {
  	  					//String urlDetail = request.getContextPath() + "/chi-tiet?sid=" + objSong.getId();
  	  					String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objSong.getSongName()) + "-" 
  	  			  				+ objSong.getId() + ".html";
  	%>
	    <div class="article">
	      <h2><a href="<%=urlDetail%>" title="<%=objSong.getSongName()%>"><%=objSong.getSongName()%></a></h2>
	      <p class="infopost">Ngày đăng: <%=objSong.getDateCreate()%> Lượt xem: <%=objSong.getCounter()%> <a href="<%=urlDetail%>" class="com"><span><%=objSong.getId()%></span></a></p>
	      <div class="clr"></div>
	      <%
	      	if(!"".equals(objSong.getPicture())) {
	      %>
		  <div class="img"><img width="177px" height="120px" src="<%=request.getContextPath()%>/files/<%=objSong.getPicture()%>" alt="<%=objSong.getSongName()%>" class="fl" /></div>
       	  <%
       	  	} else {
       	  %>
       	  <div class="img"><img width="177px" height="120px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no.gif" /></div>
       	  <%
       	  	}
       	  %>
	      
	      <div class="post_content">
	        <p><%=objSong.getPreviewText()%></p>
	        <p class="spec"><a href="<%=urlDetail%>" class="rm">Chi tiết &raquo;</a></p>
	      </div>
	      <div class="clr"></div>
	    </div>
	<%
		}}}
	%>
    <%
    	int numberOfPages = (Integer) request.getAttribute("numberOfPages");
       		int currentPage = (Integer) request.getAttribute("currentPage");
       		
       		if (listSong != null && listSong.size() > 0) {
    %>
    <p class="pages"><small>Trang <%=currentPage%> của <%=numberOfPages%></small>
    <%
    	if (currentPage != 1) {
    %>
    <a href="<%=request.getContextPath()%>/page-<%=currentPage - 1%>">&laquo;</a>
    <%
    	}
    %>
    <%
    	for (int i = 1; i <= numberOfPages; i++) {
    %>
    <%
    	if (currentPage == i) {
    %>
    <span><%=i%></span>
    <%
    	} else {
    %>
    <a href="<%=request.getContextPath()%>/page-<%=i%>"><%=i%></a>
    <%
    	}}
    %>
    <%
    	if (currentPage != numberOfPages) {
    %>
    <a href="<%=request.getContextPath()%>/page-<%=currentPage + 1%>">&raquo;</a></p>
    <%
    	}}
    %>
  </div>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<script>
    document.getElementById("index").classList.add('active');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
