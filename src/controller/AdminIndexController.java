package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CatDAO;
import model.dao.ContactDAO;
import model.dao.SlideDAO;
import model.dao.SongDAO;
import model.dao.UserDAO;
import util.AuthUtil;

public class AdminIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		
		CatDAO catDAO = new CatDAO();
		int countCat = catDAO.countItem();
		
		SongDAO songDAO = new SongDAO();
		int countSong = songDAO.countItem();
		
		UserDAO userDAO = new UserDAO();
		int countUser = userDAO.countItem();
		
		ContactDAO contactDAO = new ContactDAO();
		int countContact = contactDAO.countItem();
		
		SlideDAO slideDAO = new SlideDAO();
		int countSlide = slideDAO.countItem();
		
		request.setAttribute("countCat", countCat);
		request.setAttribute("countSong", countSong);
		request.setAttribute("countUser", countUser);
		request.setAttribute("countContact", countContact);
		request.setAttribute("countSlide", countSlide);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
