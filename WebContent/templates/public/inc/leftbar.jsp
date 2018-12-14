<%@page import="util.StringUtil"%>
<%@page import="model.dao.SongDAO"%>
<%@page import="model.bean.Song"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="searchform">
  <form id="formsearch" name="formsearch" method="post" action="<%=request.getContextPath()%>/search">
    <span>
    <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" placeholder="Tìm kiếm bài hát" value="" type="text" required="required" />
    </span>
    <input name="button_search" src="<%=request.getContextPath()%>/templates/public/images/search.jpg" class="button_search" type="image" />
    <%
    	if (request.getParameter("search") != null) {
        		int search = Integer.valueOf(request.getParameter("search"));
        		if (search == 0) {
    %>
    <br />
    <span style="color: red">Không tìm thấy kết quả</span>
    <%
    	}}
    %>
  </form>
</div>
<div class="clr"></div>
<div class="gadget">
  <h2 class="star">Danh mục bài hát</h2>
  <div class="clr"></div>
  <ul class="sb_menu">
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
    	<li><a href="<%=urlSlug%>"><%=objCat.getCatName()%></a></li>
    <%
    	}}
    %>
  </ul>
</div>

<div class="gadget">
  <h2 class="star"><span>Bài hát mới</span></h2>
  <div class="clr"></div>
  <ul class="ex_menu">
  	<%
  		SongDAO songDAO = new SongDAO();
  	  		ArrayList<Song> listItem = songDAO.getNewSongs();
  	  		if(listItem.size() > 0) {
  	  			for(Song objSong:listItem) {
  	  				String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objSong.getSongName()) + "-" 
  		  				+ objSong.getId() + ".html";
  	%>
    <li><a href="<%=urlDetail%>"><%=objSong.getSongName() %></a><br />
      <% if (objSong.getPreviewText().length() > 30) out.print(objSong.getPreviewText().substring(0, 30) + "..."); else out.print(objSong.getPreviewText()); %></li>
    <%}} %>
  </ul>
</div>