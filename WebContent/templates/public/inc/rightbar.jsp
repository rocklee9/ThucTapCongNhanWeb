<%@page import="util.StringUtil"%>
<%@page import="model.dao.SongDAO"%>
<%@page import="model.bean.Song"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!--/rightbar-->
<div class="music-right">
	<!--/video-main-->
	<h3>Top 10</h3>
	<div class="list-group">
		<%
			SongDAO songDAO = new SongDAO();
			ArrayList<Song> listItem = songDAO.getTopSongs();
			int count = 0;
	  		if(listItem.size() > 0) {
	  			for(Song objSong:listItem) {
	  				count++;
	  				String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objSong.getSongName()) + "-" 
		  				+ objSong.getId() + ".html";
		%>
			<a href="<%=urlDetail%>" class="list-group-item list-group-item-action active_xxx"><%=count%>. <%=objSong.getSongName()%></a>
		<%}} %>
	</div>
</div>

<div class="music-right">
	<!--/video-main-->
	<h3>Danh mục</h3>
	<div class="list-group">
		<%
	  		CatDAO catDAO = new CatDAO();
	  		ArrayList<Category> listCat = catDAO.getItems();
	  		if(listCat.size() > 0) {
	  			for(int i = listCat.size() - 1; i >= 0; i--) {
	  				Category objCat = listCat.get(i);
	  				/* ^/danh-muc/(.*)-([0-9]+) */
	  				String urlSlug = request.getContextPath() + "/danh-muc/" + StringUtil.makeSlug(objCat.getCatName()) + "-" 
	  				+ objCat.getCatId() + ".html";
  		%>
		<a href="<%=urlSlug%>" class="list-group-item list-group-item-action active_xxx"><%=objCat.getCatName()%></a>
		<%}} %>
	</div>
</div>
<!--//rightbar-->
<div class="clearfix"></div>