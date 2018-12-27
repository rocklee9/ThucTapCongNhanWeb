<%@page import="util.StringUtil"%>
<%@page import="model.bean.Song"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>

<div id="page-wrapper">
	<div class="inner-content">
		<div class="music-left">
			<!--banner-section-->
			<div class="banner-section">
				<div class="banner">
					 <div class="callbacks_container">
						<ul class="rslides callbacks callbacks1" id="slider4">
							<%
        						SlideDAO slideDAO = new SlideDAO();
    							ArrayList<Slide> listSlide = slideDAO.getItems();
    							if (listSlide.size() > 0) {
    								for (Slide objSlide : listSlide) {
        					%>
						   	<li>
								<div class="banner-img">
									<img src="<%=request.getContextPath() %>/files/<%=objSlide.getPicture() %>" class="img-responsive" alt="">
								</div>
								<!-- <div class="banner-info">
									<a class="trend" href="single.html">TRENDING</a>
									<h3>Let Your Home</h3>
									<p>Album by <span>Rock star</span></p>
								</div> -->
							</li>
							<%}} %>					
						</ul>
					</div>
					<!--banner-->
					<script src="<%=request.getContextPath()%>/templates/public/js/responsiveslides.min.js"></script>
				 	<script>
						// You can also use "$(window).load(function() {"
						$(function () {
						  // Slideshow 4
						  $("#slider4").responsiveSlides({
							auto: true,
							pager:true,
							nav:true,
							speed: 500,
							namespace: "callbacks",
							before: function () {
							  $('.events').append("<li>before event fired.</li>");
							},
							after: function () {
							  $('.events').append("<li>after event fired.</li>");
							}
						  });
						});
				  	</script>
					<div class="clearfix"> </div>
				</div>
			</div>	
			<!--//End-banner-->
			<!--albums-->
			<!-- pop-up-box --> 
			<link href="<%=request.getContextPath()%>/templates/public/css/popuo-box.css" rel="stylesheet" type="text/css" media="all">
			<script src="<%=request.getContextPath()%>/templates/public/js/jquery.magnific-popup.js" type="text/javascript"></script>
			<script>
				$(document).ready(function() {
					$('.popup-with-zoom-anim').magnificPopup({
						type: 'inline',
						fixedContentPos: false,
						fixedBgPos: true,
						overflowY: 'auto',
						closeBtnInside: true,
						preloader: false,
						midClick: true,
						removalDelay: 300,
						mainClass: 'my-mfp-zoom-in'
					});
				});
			</script>		
			<!--  Start danh sách bài hát -->
			<div class="albums">
				<div>
					<div class="tittle-head">
						<h3 class="tittle">Songs <span class="new">All</span></h3>
						<div class="clearfix"> </div>
					</div>
					<!-- Single Blog Post -->								
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
					<div class="single-blog-post post-style-4 d-flex align-items-center wow fadeInUpBig " data-wow-delay="0.2s">
						<!-- Post Thumbnail -->
						<div class="row">
						  	<div class="post-thumbnail col-md-3">
						  		<%
	      							if(!"".equals(objSong.getPicture())) {
	     						%>
									<a href="<%=urlDetail%>"><img src="<%=request.getContextPath()%>/files/<%=objSong.getPicture()%>" alt="<%=objSong.getSongName()%>" width="200px" height="200px"></a>
								<%
       	  						} else {
       	  						%>
       	  							<a href="<%=urlDetail%>"><img src="<%=request.getContextPath()%>/templates/admin/assets/img/no.gif" alt="<%=objSong.getSongName()%>" width="177" height="120"></a>
       	  						<%}%>
							</div>
							<!-- Post Content -->
							<div class="post-content col-9">
								<a href="<%=urlDetail%>" class="headline">
									<h3><%=objSong.getSongName()%></h3>
								</a>
								<p><%=objSong.getPreviewText()%></p>
								<!-- Post Meta -->
								<div class="post-meta">
									<p><a href="#" class="post-author">Lượt xem: <%=objSong.getCounter()%></a> | &nbsp;Ngày đăng: <%=StringUtil.dateFormat(objSong.getDateCreate())%> </p>
								</div>
							</div>
						</div>
					</div>
					<%}}}%>
				</div>
				<div class="clearfix"> </div>
			</div>
			<!--//End danh sách bài hát-->
			
		</div>
		<!-- rightbar -->
		<%@ include file="/templates/public/inc/rightbar.jsp" %>
		
	</div>
	<!--body wrapper start-->
	<!--start-blog-pagenate-->
	<div class="blog-pagenat">
		<ul>
			<%
		    	int numberOfPages = (Integer) request.getAttribute("numberOfPages");
		       		int currentPage = (Integer) request.getAttribute("currentPage");
		       		if (listSong != null && listSong.size() > 0) {
		       			if (currentPage != 1) {
		    %>
				<li><a class="frist" href="<%=request.getContextPath()%>/page-<%=currentPage - 1%>">Prev</a></li>
			<% }
		       			for (int i = 1; i <= numberOfPages; i++) {
		       				if (currentPage == i) {
		    %>
		    	<li><a href="<%=request.getContextPath()%>/page-<%=i%>"><%=i%></a></li>
		    				<%} else {%>
				<li><a href="<%=request.getContextPath()%>/page-<%=i%>"><%=i%></a></li>
			<% }} %>
			<%
		    	if (currentPage != numberOfPages) {
		    %>
				<li><a class="last" href="<%=request.getContextPath()%>/page-<%=currentPage + 1%>">Next</a></li>
			<%
		    	}}
		    %>
			<div class="clearfix"></div>
		</ul>
	</div>
	<!--//end-blog-pagenate-->

	<div class="review-slider">
		<div class="tittle-head">
			<h3 class="tittle">New Songs <span class="new"> New</span></h3>
			<div class="clearfix"> </div>
		</div>
		<ul id="flexiselDemo1">
			<%
	  	  		ArrayList<Song> listNewSongs = songDAO.getNewSongs();
	  	  		if(listItem.size() > 0) {
	  	  			for(Song objSong:listNewSongs) {
	  	  				String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objSong.getSongName()) + "-" 
	  		  				+ objSong.getId() + ".html";
		  	%>
			<li>
				<a href="<%=urlDetail%>"><img src="<%=request.getContextPath()%>/files/<%=objSong.getPicture()%>" alt=""/></a>
				<div class="slide-title"><h4><%=objSong.getSongName()%> </div>
				<div class="date-city">
					<h5><%=StringUtil.dateFormat(objSong.getDateCreate())%></h5>
					<!-- <div class="buy-tickets">
						<a href="single.html">READ MORE</a>
					</div> -->
				</div>
			</li>
			<%}}%>
		</ul>
	<script type="text/javascript">
		$(window).load(function() {
			
		  $("#flexiselDemo1").flexisel({
				visibleItems: 5,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: false,
				enableResponsiveBreakpoints: true,
				responsiveBreakpoints: { 
					portrait: { 
						changePoint:480,
						visibleItems: 2
					}, 
					landscape: { 
						changePoint:640,
						visibleItems: 3
					},
					tablet: { 
						changePoint:800,
						visibleItems: 4
					}
				}
			});
			});
		</script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/templates/public/js/jquery.flexisel.js"></script>	
	</div>
</div>
<div class="clearfix"></div>
<%@ include file="/templates/public/inc/footer.jsp" %>
