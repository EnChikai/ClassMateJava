package calendar.dto;

import java.sql.Date;

public class Calendar {

	private int userNo;
	private String scheduleName;
	private Date startDate;
	private Date endDate;
	private String content;
	
	public Calendar() {}

	@Override
	public String toString() {
		return "Calendar [userNo=" + userNo + ", scheduleName=" + scheduleName + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", content=" + content + "]";
	}

	public Calendar(int userNo, String scheduleName, Date startDate, Date endDate, String content) {
		super();
		this.userNo = userNo;
		this.scheduleName = scheduleName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.content = content;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getScheduleName() {
		return scheduleName;
	}

	public void setScheduleName(String scheduleName) {
		this.scheduleName = scheduleName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
