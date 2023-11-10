package board.dto;

import java.sql.Date;

public class EventBoard {
	private int eventNo;
	private int userNo;
	private String eventHead;
	private Date eventDate;
	private int eventHit;
	private String eventName;
	private String eventContent;
	private String eventExist;
	private String headImg;
	private String userName;
	
	public EventBoard() {}

	public EventBoard(int eventNo, int userNo, String eventHead, Date eventDate, int eventHit, String eventName,
			String eventContent, String eventExist, String headImg, String userName) {
		super();
		this.eventNo = eventNo;
		this.userNo = userNo;
		this.eventHead = eventHead;
		this.eventDate = eventDate;
		this.eventHit = eventHit;
		this.eventName = eventName;
		this.eventContent = eventContent;
		this.eventExist = eventExist;
		this.headImg = headImg;
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "EventBoard [eventNo=" + eventNo + ", userNo=" + userNo + ", eventHead=" + eventHead + ", eventDate="
				+ eventDate + ", eventHit=" + eventHit + ", eventName=" + eventName + ", eventContent=" + eventContent
				+ ", eventExist=" + eventExist + ", headImg=" + headImg + ", userName=" + userName + "]";
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getEventHead() {
		return eventHead;
	}

	public void setEventHead(String eventHead) {
		this.eventHead = eventHead;
	}

	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public int getEventHit() {
		return eventHit;
	}

	public void setEventHit(int eventHit) {
		this.eventHit = eventHit;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getEventExist() {
		return eventExist;
	}

	public void setEventExist(String eventExist) {
		this.eventExist = eventExist;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	
	
}
