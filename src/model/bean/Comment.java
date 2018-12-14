package model.bean;

import java.sql.Timestamp;

public class Comment {
	private int id;
	private int songid;
	private String username;
	private String content;
	private Timestamp timecmt;

	public Comment() {
		super();
	}

	public Comment(int id, int songid, String username, String content, Timestamp timecmt) {
		super();
		this.id = id;
		this.songid = songid;
		this.username = username;
		this.content = content;
		this.timecmt = timecmt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSongid() {
		return songid;
	}

	public void setSongid(int songid) {
		this.songid = songid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getTimecmt() {
		return timecmt;
	}

	public void setTimecmt(Timestamp timecmt) {
		this.timecmt = timecmt;
	}

}
