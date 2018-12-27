<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
    <div class="article">
      <h2><span>Liên hệ</span></h2>
      <div class="clr"></div>
      <%
      	String msgText = "";
      	    String name = request.getParameter("name");
      		String email = request.getParameter("email");
      		String website = request.getParameter("website");
      		String message = request.getParameter("message");
      		if(request.getParameter("msg") != null){
      	int msg = Integer.valueOf(request.getParameter("msg"));
      	if(msg == 0){
      		msgText = "Có lỗi trong quá trình thêm, Vui lòng thử lại";
      		out.print("<div style='background:#FFBF26; color:red; font-weight:bold; padding:5px; width:486px;'>" + msgText + "</div>");
      	}
      	if(msg == 1){
      		msgText = "Gửi liên hệ thành công";
      		out.print("<div style='background:#66FF26; color:white; font-weight:bold; padding:5px>; width:486px;'>" + msgText + "</div>");
      	} 
      		}
      %>
      <p>Khi bạn có thắc mắc, vui lòng gửi liên hệ, chúng tôi sẽ phản hồi trong thời gian sớm nhất.</p>
    </div>
    <div class="article">
      <h2>Gửi liên hệ đến chúng tôi</h2>
      <div class="clr"></div>
      <form action="" method="post" id="sendemail" >
        <ol>
          <li>
            <label for="name">Họ tên</label>
            <input id="name" value="<%if (name != null) out.print(name);%>" name="name" class="text" />
          </li>
          <li>
            <label for="email">Email</label>
            <input id="email" value="<%if (email != null) out.print(email);%>" name="email" class="text" />
          </li>
          <li>
            <label for="website">Website</label>
            <input id="website" value="<%if (website != null) out.print(website);%>" name="website" class="text" />
          </li>
          <li>
            <label for="message">Nội dung</label>
            <textarea id="message" name="message" rows="8" cols="50"><%
            	if (message != null) out.print(message);
            %></textarea>
          </li>
          <li>
            <input type="image" name="imageField" id="imageField" src="<%=request.getContextPath()%>/templates/public/images/submit.gif" class="send" />
            <div class="clr"></div>
          </li>
        </ol>
      </form>
    </div>
  </div>
  <div class="sidebar">
  <%-- <%@ include file="/templates/public/inc/leftbar.jsp" %> --%>
  </div>
  <div class="clr"></div>
</div>
<script>
	$().ready(function () {
		// validate form when it submited
		$('#sendemail').validate({
			errorPlacement: function(error, element) {
				$(element).closest("form").find("label[for='"+ element.attr("id") + "']").append(error); 
			},
			errorElement: "span",
			rules:{
				name: {
					required: true,
				},
				email: {
					required: true,
					email: true,
				},
			},
			messages:{
				name: {
					required: " (Vui lòng nhập trường này)",
				},
				email: {
					required: " (Vui lòng nhập trường này)",
					email: " (Vui lòng nhập email đúng định dạng)",
				},
			},
		});
	});
</script>
<script>
    document.getElementById("contact").classList.add('active');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
