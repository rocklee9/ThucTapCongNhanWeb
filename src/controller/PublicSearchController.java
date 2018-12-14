package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Song;
import model.dao.SongDAO;
import util.DefineUtil;
import util.StringUtil;

public class PublicSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicSearchController() {
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
		
		String textSearch = request.getParameter("editbox_search");
		textSearch = StringUtil.standardizedString(textSearch);
		System.out.println(textSearch);
		SongDAO songDAO = new SongDAO();
		ArrayList<Song> listSong = songDAO.search(textSearch);
		if (listSong.size() > 0) {
			request.setAttribute("listSong", listSong);
			RequestDispatcher rd = request.getRequestDispatcher("/public/resultSearch.jsp");
			rd.forward(request, response);
			return;
		} else {
			response.sendRedirect(request.getContextPath() + "?search=0");
			return;
		}
	}

}
