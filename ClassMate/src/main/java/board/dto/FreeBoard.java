package board.dto;

import java.sql.Date;

public class FreeBoard {
	private int freeNo;
	private int userNo;
	private String freeHhead;
	private Date freeDate;
	private int freeHit;
	private String freeName;
	private String freeContent;
	
	public FreeBoard() {}

	@Override
	public String toString() {
		return "FreeBoard [freeNo=" + freeNo + ", userNo=" + userNo + ", freeHhead=" + freeHhead + ", freeDate="
				+ freeDate + ", freeHit=" + freeHit + ", freeName=" + freeName + ", freeContent=" + freeContent + "]";
	}

	public FreeBoard(int freeNo, int userNo, String freeHhead, Date freeDate, int freeHit, String freeName,
			String freeContent) {
		super();
		this.freeNo = freeNo;
		this.userNo = userNo;
		this.freeHhead = freeHhead;
		this.freeDate = freeDate;
		this.freeHit = freeHit;
		this.freeName = freeName;
		this.freeContent = freeContent;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getFreeHhead() {
		return freeHhead;
	}

	public void setFreeHhead(String freeHhead) {
		this.freeHhead = freeHhead;
	}

	public Date getFreeDate() {
		return freeDate;
	}

	public void setFreeDate(Date freeDate) {
		this.freeDate = freeDate;
	}

	public int getFreeHit() {
		return freeHit;
	}

	public void setFreeHit(int freeHit) {
		this.freeHit = freeHit;
	}

	public String getFreeName() {
		return freeName;
	}

	public void setFreeName(String freeName) {
		this.freeName = freeName;
	}

	public String getFreeContent() {
		return freeContent;
	}

	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}
	
	
}
