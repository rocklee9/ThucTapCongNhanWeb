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
import util.AuthUtil;
import util.DefineUtil;
import util.FileUtil;

@MultipartConfig
public class AdminEditSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditSongController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		
		int sid = 0;
		try {
			sid = Integer.valueOf(request.getParameter("sid"));
		} catch (NumberFormatException e) {
			System.out.println(e.getMessage());
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=0");
			return;
		}
		
		SongDAO songDAO = new SongDAO();
		Song item = songDAO.getItem(sid);
		if (item == null) {
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=0");
			return;
		}
		request.setAttribute("objSong", item);
		
		CatDAO catDAO = new CatDAO();
		ArrayList<Category> listCat = catDAO.getItems();
		request.setAttribute("listCat", listCat);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/song/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int sid = 0;
		try {
			sid = Integer.valueOf(request.getParameter("sid"));
		} catch (NumberFormatException e) {
			System.out.println(e.getMessage());
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=0");
			return;
		}
		SongDAO songDAO = new SongDAO();
		
		String name = request.getParameter("name");
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");
		int cat_id = Integer.parseInt(request.getParameter("cat_id"));
		
		Song item = songDAO.getItem(sid);
		if (item == null) {
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=0");
			return;
		}
		
		Part filePart = request.getPart("picture");
		String fileName = filePart.getSubmittedFileName();
		// fileName không rỗng thì 
		if (!"".equals(fileName)) {
			// /webcontent/
			String dirPath = request.getServletContext().getRealPath("") + DefineUtil.DIR_UPLOAD;
			File dirFile = new File(dirPath);
			if (!dirFile.exists()) {
				dirFile.mkdir();
			}
			fileName = FileUtil.rename(fileName);
			String filePath = dirPath + File.separator + fileName;
			// xóa file cũ trước
			String oldFilePath = dirPath + File.separator + item.getPicture();
			File oldFile = new File(oldFilePath);
			if (oldFile.exists()) {
				oldFile.delete();
			}
			// ghi file mới vào
			filePart.write(filePath);
			//System.out.println(filePath);
			
		} else {
			fileName = item.getPicture();
		}
		
		item = new Song(sid, 0, 1, name, preview, detail, null, fileName, new Category(cat_id, ""));
		
		// edit
		if(songDAO.editItem(item) > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=2");
		} else {
			request.setAttribute("objSong", item);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/song/edit.jsp?msg=0");
			rd.forward(request, response);
		}
	}

}
