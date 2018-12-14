package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.bean.Category;
import model.bean.Song;
import model.dao.CatDAO;
import model.dao.SongDAO;
import model.dao.UserDAO;
import util.AuthUtil;
import util.DefineUtil;
import util.FileUtil;

@MultipartConfig
public class AdminAddSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminAddSongController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		CatDAO catDAO = new CatDAO();
		ArrayList<Category> listCat = catDAO.getItems();
		request.setAttribute("listCat", listCat);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/song/add.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		SongDAO songDAO = new SongDAO();
		
		String name = request.getParameter("name");
		int cat_id = Integer.valueOf(request.getParameter("cat_id"));
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");
		
		Part filePart = request.getPart("picture");
		String fileName = filePart.getSubmittedFileName();
		if (!"".equals(fileName)) {
			// /webcontent/
			String dirPath = request.getServletContext().getRealPath("") + DefineUtil.DIR_UPLOAD;
			File dirFile = new File(dirPath);
			if (!dirFile.exists()) {
				dirFile.mkdir();
			}
			fileName = FileUtil.rename(fileName);
			String filePath = dirPath + File.separator + fileName;
			filePart.write(filePath);
			//System.out.println(filePath);
		} 
		
		Song item = new Song(0, 0, 1, name, preview, detail, null, fileName, new Category(cat_id, ""));
		
		if(songDAO.addItem(item) > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=1");
			return;
		} else {
			request.setAttribute("objSong", item);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/song/add.jsp?msg=0");
			rd.forward(request, response);
			return;
		}
	}

}
