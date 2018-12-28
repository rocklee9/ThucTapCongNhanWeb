package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Category;
import model.bean.Song;
import util.DBConnectionUtil;
import util.DefineUtil;

public class SongDAO {
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ArrayList<Song> getItems() {
		ArrayList<Song> listItem = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT s.id, s.name AS songName, preview_text, detail_text, date_create, "
				+ "picture, counter, cat_id, c.name AS catName, active "
				+ "FROM songs AS s INNER JOIN categories AS c "
				+ "ON cat_id = c.id";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Song objSong = new Song(rs.getInt("id"), rs.getInt("counter"), rs.getInt("active"), rs.getString("songName"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"), new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listItem.add(objSong);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, conn);
		}
		return listItem;
	}
	
	public int addItem(Song objSong) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO songs (name, preview_text, detail_text, picture, cat_id) "
				+ "VALUES (?, ?, ?, ?, ?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objSong.getSongName());
			pst.setString(2, objSong.getPreviewText());
			pst.setString(3, objSong.getDetailText());
			pst.setString(4, objSong.getPicture());
			pst.setInt(5, objSong.getObjCat().getCatId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, conn);
		}
		return result;
	}
	
	public Song getItem(int sid) {
		Song objItem = null;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM songs WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, sid);
			rs = pst.executeQuery();
			if (rs.next()) {
				objItem = new Song(rs.getInt("id"), rs.getInt("counter"), rs.getInt("active"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"), new Category(rs.getInt("cat_id"), null));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, conn);
		}
		return objItem;
	}  
	
	public int delItem(int sid) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "DELETE FROM songs WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, sid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, conn);
		}
		return result;
	}

	public int editItem(Song item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "UPDATE songs SET name = ?, preview_text = ?, detail_text = ?, picture = ?, cat_id = ? "
				+ "WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getSongName());
			pst.setString(2, item.getPreviewText());
			pst.setString(3, item.getDetailText());
			pst.setString(4, item.getPicture());
			pst.setInt(5, item.getObjCat().getCatId());
			pst.setInt(6, item.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, conn);
		}
		return result;
	}
	
	public ArrayList<Song> getItemById(int catId) {
		ArrayList<Song> listItem = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM songs WHERE cat_id = ? ORDER BY id DESC";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, catId);
			rs = pst.executeQuery();
			while(rs.next()) {
				Song objSong = new Song(rs.getInt("id"), rs.getInt("counter"), rs.getInt("active"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"), null);
				listItem.add(objSong);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, conn);
		}
		return listItem;
	}
	
	public ArrayList<Song> getRelatedSong(Song objSong) {
		ArrayList<Song> listItem = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM songs WHERE cat_id = ? AND id <> ? AND active = 1 ORDER BY id DESC LIMIT 3";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, objSong.getObjCat().getCatId());
			pst.setInt(2, objSong.getId());
			rs = pst.executeQuery();
			while(rs.next()) {
				Song song = new Song(rs.getInt("id"), rs.getInt("counter"), rs.getInt("active"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"), new Category(rs.getInt("cat_id"), ""));
				listItem.add(song);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, conn);
		}
		return listItem;
	}
	
	public ArrayList<Song> getNewSongs() {
		ArrayList<Song> listItem = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM songs WHERE active = 1 ORDER BY id DESC LIMIT 6";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Song objSong = new Song(rs.getInt("id"), rs.getInt("counter"), rs.getInt("active"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"), new Category(rs.getInt("cat_id"), ""));
				listItem.add(objSong);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, conn);
		}
		return listItem;
	}
	
	public ArrayList<Song> getTopSongs() {
		ArrayList<Song> listItem = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM songs WHERE active = 1 ORDER BY counter DESC LIMIT 10";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Song objSong = new Song(rs.getInt("id"), rs.getInt("counter"), rs.getInt("active"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"), new Category(rs.getInt("cat_id"), ""));
				listItem.add(objSong);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, conn);
		}
		return listItem;
	}

	public void increaseView(int sId) {
		conn = DBConnectionUtil.getConnection();
		String sql = "UPDATE songs SET counter = counter + 1 WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, sId);
			
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, conn);
		}
	}

	public int countItem() {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS count FROM songs";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
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
	
	public int countItemPublic() {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS count FROM songs WHERE active = 1";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
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
	
	public int countItem(int catId) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS count FROM songs WHERE cat_id = ? AND active = 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, catId);
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

	public ArrayList<Song> getItemsPagination(int offset, int numberPage) {
		ArrayList<Song> listItem = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT s.id, s.name AS songName, preview_text, detail_text, date_create, "
				+ "picture, counter, cat_id, c.name AS catName, active "
				+ "FROM songs AS s INNER JOIN categories AS c "
				+ "ON cat_id = c.id "
				+ "LIMIT ?, ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, numberPage);
			rs = pst.executeQuery();
			while(rs.next()) {
				Song objSong = new Song(rs.getInt("id"), rs.getInt("counter"), rs.getInt("active"), rs.getString("songName"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"), new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listItem.add(objSong);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, conn);
		}
		return listItem;
	}
	
	public ArrayList<Song> getItemsPaginationPublic(int offset, int numberPage) {
		ArrayList<Song> listItem = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT s.id, s.name AS songName, preview_text, detail_text, date_create, "
				+ "picture, counter, cat_id, c.name AS catName, active "
				+ "FROM songs AS s INNER JOIN categories AS c "
				+ "ON cat_id = c.id "
				+ "WHERE active = 1 "
				+ "LIMIT ?, ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, numberPage);
			rs = pst.executeQuery();
			while(rs.next()) {
				Song objSong = new Song(rs.getInt("id"), rs.getInt("counter"), rs.getInt("active"), rs.getString("songName"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"), new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listItem.add(objSong);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, conn);
		}
		return listItem;
	}

	public ArrayList<Song> getItemByIdPagination(int offset, int catId) {
		ArrayList<Song> listItem = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT s.id, s.name AS songName, preview_text, detail_text, date_create, "
				+ "picture, counter, cat_id, c.name AS catName, active "
				+ "FROM songs AS s INNER JOIN categories AS c "
				+ "ON cat_id = c.id "
				+ "WHERE cat_id = ? AND active = 1 "
				+ "LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, catId);
			pst.setInt(2, offset);
			pst.setInt(3, DefineUtil.NUMBER_SONG_PER_PAGE_PUBLIC);
			rs = pst.executeQuery();
			while(rs.next()) {
				Song objSong = new Song(rs.getInt("id"), rs.getInt("counter"), rs.getInt("active"), rs.getString("songName"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"), new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listItem.add(objSong);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, conn);
		}
		return listItem;
	}

	public ArrayList<Song> search(String textSearch) {
		ArrayList<Song> listItem = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		//String text = textSearch.toUpperCase();
		//String sql = "SELECT * FROM songs WHERE name LIKE ?";
		String sql = "SELECT s.id, s.name AS songName, preview_text, detail_text, date_create, "
				+ "picture, counter, cat_id, c.name AS catName, active "
				+ "FROM songs AS s INNER JOIN categories AS c "
				+ "ON cat_id = c.id "
				+ "WHERE s.name LIKE ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + textSearch + "%");
			rs = pst.executeQuery();
			while (rs.next()) {
				Song objSong = new Song(rs.getInt("id"), rs.getInt("counter"), rs.getInt("active"), rs.getString("songName"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"), new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listItem.add(objSong);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, conn);
		}
		return listItem;
	}

	public void updateActive(int i, int id) {
		conn = DBConnectionUtil.getConnection();
		String sql = "UPDATE songs SET active = ? WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, i);
			pst.setInt(2, id);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, conn);
		}
	}

}
