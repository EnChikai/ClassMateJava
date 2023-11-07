package main.dto;

public class ClassList {
	private int listNo;
	private int userNo;
	private int classNo;
	private int teacherNo;
	
	public ClassList() {}

	@Override
	public String toString() {
		return "ClassList [listNo=" + listNo + ", userNo=" + userNo + ", classNo=" + classNo + ", teacherNo="
				+ teacherNo + "]";
	}

	public ClassList(int listNo, int userNo, int classNo, int teacherNo) {
		super();
		this.listNo = listNo;
		this.userNo = userNo;
		this.classNo = classNo;
		this.teacherNo = teacherNo;
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public int getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}
	
	
}
