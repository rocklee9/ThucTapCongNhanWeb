package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Comment;
import model.dao.CommentDAO;

public class PublicXuLyCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicXuLyCommentController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("ausername");
		String content = request.getParameter("acmt");
		int songid = Integer.valueOf(request.getParameter("asongid"));
		Comment objCmt = new Comment(0, songid, username, content, null);
		
		CommentDAO commentDAO = new CommentDAO();
		if (commentDAO.addCmt(objCmt) > 0) {
			//if (!"".equals(fullname) && !"".equals(cmt)) 
			Comment cmt = commentDAO.getLastItem(songid);
			out.print("<li class='item-cmt'>"
						+ "<p class='name-cmt'>" + cmt.getUsername() + "</p>"
						+ "<p class='time-cmt'>" + cmt.getTimecmt() + "</p>"
						+ "<br />"
						+ "<p class='content-cmt'> " + cmt.getContent() + "</p>" 
					+ "</li>");
		}
	}

}
