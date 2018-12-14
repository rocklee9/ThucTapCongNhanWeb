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

public class AdminSearchSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminSearchSongController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String textSearch = request.getParameter("textSearch");
		textSearch = StringUtil.standardizedString(textSearch);
		System.out.println(textSearch);
		SongDAO songDAO = new SongDAO();
		ArrayList<Song> listSong = songDAO.search(textSearch);
		if (listSong.size() > 0) {
			request.setAttribute("resultSearch", listSong);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/song/index.jsp");
			rd.forward(request, response);
			return;
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/song/index?searchResult=0");
			return;
		}
	}

}
