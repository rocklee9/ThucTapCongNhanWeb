package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Category;
import model.dao.CatDAO;
import util.AuthUtil;

public class AdminEditCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditCatController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		
		int cid = 0;
		try {
			cid = Integer.valueOf(request.getParameter("cid"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/cat/edit?msg=0");
			return;
		}
		
		CatDAO catDAO = new CatDAO();
		Category objCat = catDAO.getItemById(cid);
		request.setAttribute("objCat", objCat);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/cat/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CatDAO catDAO = new CatDAO();
		int cid = Integer.valueOf(request.getParameter("cid"));
		String name = request.getParameter("name");
		Category objCat = new Category(cid, name);
		if(catDAO.editItem(objCat) > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?msg=2");
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/cat/edit?msg=0&cid=" + cid);
		}

	}
}
