package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Category;
import model.bean.Song;
import model.dao.CatDAO;
import model.dao.SongDAO;
import util.DefineUtil;

public class PublicCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicCatController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int catId = 0;
		try {
			catId = Integer.valueOf(request.getParameter("cid"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		
		CatDAO catDAO = new CatDAO();
		Category category = catDAO.getItemById(catId);
		
		SongDAO songDAO = new SongDAO();
		// lấy ra tổng số bài hát theo danh mục
		int numberOfItems = songDAO.countItem(catId);
		int numberOfPages = (int) Math.ceil((float) numberOfItems / DefineUtil.NUMBER_SONG_PER_PAGE_PUBLIC);
		
		int currentPage = 1;
		try {
			currentPage = Integer.valueOf(request.getParameter("page"));
		} catch (NumberFormatException e) {
		}
		
		if (currentPage > numberOfPages || currentPage < 1) {
			currentPage = 1;
		}
		
		int offset = (currentPage - 1) * DefineUtil.NUMBER_SONG_PER_PAGE_PUBLIC;
		
		ArrayList<Song> listSong = songDAO.getItemByIdPagination(offset, catId);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("category", category);
		request.setAttribute("listSong", listSong);
		
		RequestDispatcher rd = request.getRequestDispatcher("/public/cat.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
