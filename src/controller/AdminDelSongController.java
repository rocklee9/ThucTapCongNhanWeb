package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Song;
import model.dao.SongDAO;
import util.AuthUtil;
import util.DefineUtil;

public class AdminDelSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDelSongController() {
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
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=0");
			return;
		}
		
		SongDAO songDAO = new SongDAO();
		Song objSong = songDAO.getItem(sid);
		String fileNameOld = objSong.getPicture();
		// nếu tồn tại file hình ảnh thì xóa file đó đi
		if (!"".equals(fileNameOld)) {
			String dirPath = request.getServletContext().getRealPath("") + DefineUtil.DIR_UPLOAD;
			String filePath = dirPath + File.separator + fileNameOld;
			File file = new File(filePath);
			file.delete(); // xóa file
			//System.out.println(dirPath);
		}
		if(songDAO.delItem(sid) > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=3");
			return;
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=0");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
