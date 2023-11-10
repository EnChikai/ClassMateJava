package board.dto;

import java.sql.Date;

public class AnnounceBoard {
	private int announceNo;
	private int userNo;
	private String announceHead;
	private Date announceDate;
	private int announceHit;
	private String announceName;
	private String announceContent;
	private String announceExist;
	private String userName;
	
	public AnnounceBoard() {}

	public AnnounceBoard(int announceNo, int userNo, String announceHead, Date announceDate, int announceHit,
			String announceName, String announceContent, String announceExist, String userName) {
		super();
		this.announceNo = announceNo;
		this.userNo = userNo;
		this.announceHead = announceHead;
		this.announceDate = announceDate;
		this.announceHit = announceHit;
		this.announceName = announceName;
		this.announceContent = announceContent;
		this.announceExist = announceExist;
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "AnnounceBoard [announceNo=" + announceNo + ", userNo=" + userNo + ", announceHead=" + announceHead
				+ ", announceDate=" + announceDate + ", announceHit=" + announceHit + ", announceName=" + announceName
				+ ", announceContent=" + announceContent + ", announceExist=" + announceExist + ", userName=" + userName
				+ "]";
	}

	public int getAnnounceNo() {
		return announceNo;
	}

	public void setAnnounceNo(int announceNo) {
		this.announceNo = announceNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getAnnounceHead() {
		return announceHead;
	}

	public void setAnnounceHead(String announceHead) {
		this.announceHead = announceHead;
	}

	public Date getAnnounceDate() {
		return announceDate;
	}

	public void setAnnounceDate(Date announceDate) {
		this.announceDate = announceDate;
	}

	public int getAnnounceHit() {
		return announceHit;
	}

	public void setAnnounceHit(int announceHit) {
		this.announceHit = announceHit;
	}

	public String getAnnounceName() {
		return announceName;
	}

	public void setAnnounceName(String announceName) {
		this.announceName = announceName;
	}

	public String getAnnounceContent() {
		return announceContent;
	}

	public void setAnnounceContent(String announceContent) {
		this.announceContent = announceContent;
	}

	public String getAnnounceExist() {
		return announceExist;
	}

	public void setAnnounceExist(String announceExist) {
		this.announceExist = announceExist;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	


	
}
