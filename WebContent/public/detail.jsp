<%@page import="util.StringUtil"%>
<%@page import="model.bean.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Song"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<!-- Start phần code project cũ -->
<div class="content_resize">
  <div class="mainbar">
  	<%
  		if(request.getAttribute("objSong") != null) {
  	  		Song objSong = (Song)request.getAttribute("objSong");
  	%>
    <div class="article">
	    <h1><%=objSong.getSongName()%></h1>
	    <div class="clr"></div>
	    <p>Ngày đăng: <%=StringUtil.dateFormat(objSong.getDateCreate())%> &nbsp;&nbsp;&nbsp;Lượt xem: <%=objSong.getCounter()%></p>
	    <p></p>
	    <div class="vnecontent">
	    	<%=objSong.getDetailText()%>
	    </div>
    </div>
    
    <div class="article">
      <h2>Bài viết liên quan</h2>
      <%
      	if(request.getAttribute("listRelatedSong") != null) {
      	  		ArrayList<Song> listSong = (ArrayList<Song>)request.getAttribute("listRelatedSong");
      	  			if(listSong.size() > 0) {
      	  				for(Song song:listSong) {
      	  					//String urlDetail = request.getContextPath() + "/chi-tiet?sid=" + objSong.getId();
      	  					String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(song.getSongName()) + "-" 
        			  				+ song.getId() + ".html";
      %>
	      <div class="clr"></div>
	      <div class="comment"><a href="<%=urlDetail%>"><img src="<%=request.getContextPath()%>/files/<%=song.getPicture()%>" width="40" height="40" alt="" class="userpic" /></a>
	        <h2><a href="<%=urlDetail%>"><%=song.getSongName()%></a></h2>
	        <p><%=song.getPreviewText()%></p>
	      </div>
	  <%
	  	}}}
	  %>
    </div>
    <div class="article">
    	<%
    		int countCmt = 0;
    		      	if(request.getAttribute("countCmt") != null) {
    		  			countCmt = (Integer)request.getAttribute("countCmt");
    		      	}
    	%>
      	<h2>BÌNH LUẬN (<label class="countCmt"><%=countCmt%></label>)</h2>
    	<form class="form-cmt">
			<div class="form-item">
				<input type="text" name="username" id="username" value="" placeholder="Nhập tên" required="required" />
			</div>
			<div class="form-item">
				<textarea type="text" name="cmt" id="cmt" placeholder="Nhập bình luận..." required="required"></textarea>
				<a href="javascript:void(0)" title="" class="btn" onclick="return xuLyCmt(<%=objSong.getId()%>)">Bình luận</a>
			</div>
			<div class="clr"></div>
		</form>
		
		<ul class="list-cmt">
			<%
				if(request.getAttribute("listCmt") != null) {
					  			ArrayList<Comment> listCmt = (ArrayList<Comment>)request.getAttribute("listCmt");
					  			if (listCmt.size() > 0) {
					  				for (Comment objCmt:listCmt) {
			%>
			<li class="item-cmt">
				<p class="name-cmt"><%=objCmt.getUsername()%></p>
				<p class="time-cmt"><%=objCmt.getTimecmt()%></p>
				<br />
				<p class="content-cmt"><%=objCmt.getContent()%></p>
			</li>
	  		<%
	  			}}}
	  		%>
	  	</ul>
	</div>
	<%
		}
	%>
</div>
<%-- <div class="sidebar">
  <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>--%>
</div> 
<script>
	function xuLyCmt(sid){
		var username = $('#username').val() + '';
		var cmt	= $('#cmt').val() + '';	
		var regex = /^[\s]+$/;
		var countCmt = parseInt($('.countCmt').text(),10);
		
		if (username != "" && cmt != "" && !regex.exec(username) && !regex.exec(cmt)){
			$.ajax({
				url: '<%=request.getContextPath()%>/xu-ly-comment',
				type: 'POST',
				cache: false,
				data: {
					ausername: username,
					acmt: cmt,
					asongid: sid
				},
				success: function(data){
					$('#username').val('');
					$('#cmt').val('');
					$('.list-cmt').prepend(data);
					countCmt += 1;
					$('.countCmt').html(countCmt);
					
				},
				error: function (){
					
					alert('Có lỗi xảy ra');
				}
			});	
		}
		return false;
	}
</script>
<!-- End phần code project cũ -->

<%@ include file="/templates/public/inc/footer.jsp" %>
