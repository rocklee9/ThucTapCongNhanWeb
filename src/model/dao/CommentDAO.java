package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Category;
import model.bean.Comment;
import model.bean.Slide;
import model.bean.Song;
import util.DBConnectionUtil;

public class CommentDAO {
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public int addCmt(Comment objCmt) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO comments (username, content, songid) VALUES (?, ?, ?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objCmt.getUsername());
			pst.setString(2, objCmt.getContent());
			pst.setInt(3, objCmt.getSongid());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, conn);
		}
		return result;
	}

	public Comment getLastItem(int songid) {
		Comment cmt = null;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM comments WHERE songid = ? ORDER BY id DESC LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, songid);
			rs = pst.executeQuery();
			if (rs.next()) {
				cmt = new Comment(rs.getInt("id"), rs.getInt("songid"), rs.getString("username"), rs.getString("content"), rs.getTimestamp("timecmt"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, conn);
		}
		return cmt;
	}

	public ArrayList<Comment> getItems(int sId) {
		ArrayList<Comment> listCmt = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM comments WHERE songid = ? ORDER BY id DESC";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, sId);
			rs = pst.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment(rs.getInt("id"), rs.getInt("songid"), rs.getString("username"), rs.getString("content"), rs.getTimestamp("timecmt"));
				listCmt.add(cmt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, conn);
		}
		return listCmt;
	}
	
	public int countCmt(int sid) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS count FROM comments WHERE songid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, sid);
			rs = pst.executeQuery();
			if (rs.next()) {
				result = rs.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, conn);
		}
		return result;
	}
}
