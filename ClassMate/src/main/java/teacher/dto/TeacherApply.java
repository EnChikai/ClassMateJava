package teacher.dto;

import java.util.Date;

public class TeacherApply {
	private int applyNo;
	private int teacherNo;
	private String passOrNot;
	private Date applyDate;
	
	public TeacherApply() {}

	@Override
	public String toString() {
		return "TeacherApply [applyNo=" + applyNo + ", teacherNo=" + teacherNo + ", passOrNot=" + passOrNot
				+ ", applyDate=" + applyDate + "]";
	}

	public TeacherApply(int applyNo, int teacherNo, String passOrNot, Date applyDate) {
		super();
		this.applyNo = applyNo;
		this.teacherNo = teacherNo;
		this.passOrNot = passOrNot;
		this.applyDate = applyDate;
	}

	public int getApplyNo() {
		return applyNo;
	}

	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}

	public int getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}

	public String getPassOrNot() {
		return passOrNot;
	}

	public void setPassOrNot(String passOrNot) {
		this.passOrNot = passOrNot;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	
	
	
}
