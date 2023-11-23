package board.dto;

import java.sql.Date;

public class FreeComment {

	private int freeCommentNo;
	private int freeNo;
	private String freeCommentContent;
	private Date freeCommentDate;
	
	private String userName;
	
	public FreeComment() {}

	public FreeComment(int freeCommentNo, int freeNo, String freeCommentContent, Date freeCommentDate, String userName) {
		super();
		this.freeCommentNo = freeCommentNo;
		this.freeNo = freeNo;
		this.freeCommentContent = freeCommentContent;
		this.freeCommentDate = freeCommentDate;
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "FreeComent [freeCommentNo=" + freeCommentNo + ", freeNo=" + freeNo + ", freeCommentContent="
				+ freeCommentContent + ", freeCommentDate=" + freeCommentDate + ", userName=" + userName + "]";
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

}
