package model.bean;

import java.sql.Timestamp;

public class Song {
	private int id;
	private int counter;
	private int active;
	private String songName;
	private String previewText;
	private String detailText;
	private Timestamp dateCreate;
	private String picture;
	private Category objCat;

	public Song() {
		super();
	}

	public Song(int id, int counter, int active, String songName, String previewText, String detailText,
			Timestamp dateCreate, String picture, Category objCat) {
		super();
		this.id = id;
		this.counter = counter;
		this.active = active;
		this.songName = songName;
		this.previewText = previewText;
		this.detailText = detailText;
		this.dateCreate = dateCreate;
		this.picture = picture;
		this.objCat = objCat;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCounter() {
		return counter;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getSongName() {
		return songName;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}

	public String getPreviewText() {
		return previewText;
	}

	public void setPreviewText(String previewText) {
		this.previewText = previewText;
	}

	public String getDetailText() {
		return detailText;
	}

	public void setDetailText(String detailText) {
		this.detailText = detailText;
	}

	public Timestamp getDateCreate() {
		return dateCreate;
	}

	public void setDateCreate(Timestamp dateCreate) {
		this.dateCreate = dateCreate;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Category getObjCat() {
		return objCat;
	}

	public void setObjCat(Category objCat) {
		this.objCat = objCat;
	}

}