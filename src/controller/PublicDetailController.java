package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Comment;
import model.bean.Song;
import model.dao.CommentDAO;
import model.dao.SongDAO;

public class PublicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicDetailController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int sId = 0;
		try {
			sId = Integer.valueOf(request.getParameter("sid"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		// lấy ra bài hát dựa vào id
		SongDAO songDAO = new SongDAO();
		Song objSong = songDAO.getItem(sId);
		// phương thức tăng lượt xem
		songDAO.increaseView(sId);
		
		// lấy danh sách bài hát liên quan
		ArrayList<Song> listRelatedSong = songDAO.getRelatedSong(objSong);
		
		// lấy ra danh sách comment
		CommentDAO commentDAO = new CommentDAO();
		ArrayList<Comment> listCmt = commentDAO.getItems(sId);
		// lấy ra số cmt của bài hát
		int countCmt = commentDAO.countCmt(sId);
		
 		request.setAttribute("objSong", objSong);
 		request.setAttribute("listRelatedSong", listRelatedSong);
 		request.setAttribute("listCmt", listCmt);
 		request.setAttribute("countCmt", countCmt);
 		
		RequestDispatcher rd = request.getRequestDispatcher("/public/detail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
