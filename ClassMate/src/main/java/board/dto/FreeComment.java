package board.dto;

import java.sql.Date;

public class FreeComment {

	private int freeCommentNo;
	private int freeNo;
	private String freeCommentContent;
	private Date freeCommentDate;
	
	private String userName;
	private int userNo;
	
	public FreeComment() {}

	public FreeComment(int freeCommentNo, int freeNo, String freeCommentContent, Date freeCommentDate, String userName,
			int userNo) {
		super();
		this.freeCommentNo = freeCommentNo;
		this.freeNo = freeNo;
		this.freeCommentContent = freeCommentContent;
		this.freeCommentDate = freeCommentDate;
		this.userName = userName;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "FreeComment [freeCommentNo=" + freeCommentNo + ", freeNo=" + freeNo + ", freeCommentContent="
				+ freeCommentContent + ", freeCommentDate=" + freeCommentDate + ", userName=" + userName + ", userNo="
				+ userNo + "]";
	}

	public int getFreeCommentNo() {
		return freeCommentNo;
	}

	public void setFreeCommentNo(int freeCommentNo) {
		this.freeCommentNo = freeCommentNo;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	public String getFreeCommentContent() {
		return freeCommentContent;
	}

	public void setFreeCommentContent(String freeCommentContent) {
		this.freeCommentContent = freeCommentContent;
	}

	public Date getFreeCommentDate() {
		return freeCommentDate;
	}

	public void setFreeCommentDate(Date freeCommentDate) {
		this.freeCommentDate = freeCommentDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	
	
}
