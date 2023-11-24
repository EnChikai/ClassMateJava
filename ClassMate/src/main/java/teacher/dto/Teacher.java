package teacher.dto;

public class Teacher {
	private int teacherNo;
	private int userNo;
	private String teacherImg;
	private String teacherInfo;
	private String teacherCareer;
	private String teacherTitle;
	
	public Teacher() {}

	@Override
	public String toString() {
		return "Teacher [teacherNo=" + teacherNo + ", userNo=" + userNo + ", teacherImg=" + teacherImg
				+ ", teacherInfo=" + teacherInfo + ", teacherCareer=" + teacherCareer + ", teacherTitle=" + teacherTitle
				+ "]";
	}

	public Teacher(int teacherNo, int userNo, String teacherImg, String teacherInfo, String teacherCareer,
			String teacherTitle) {
		super();
		this.teacherNo = teacherNo;
		this.userNo = userNo;
		this.teacherImg = teacherImg;
		this.teacherInfo = teacherInfo;
		this.teacherCareer = teacherCareer;
		this.teacherTitle = teacherTitle;
	}

	public int getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTeacherImg() {
		return teacherImg;
	}

	public void setTeacherImg(String teacherImg) {
		this.teacherImg = teacherImg;
	}

	public String getTeacherInfo() {
		return teacherInfo;
	}

	public void setTeacherInfo(String teacherInfo) {
		this.teacherInfo = teacherInfo;
	}

	public String getTeacherCareer() {
		return teacherCareer;
	}

	public void setTeacherCareer(String teacherCareer) {
		this.teacherCareer = teacherCareer;
	}

	public String getTeacherTitle() {
		return teacherTitle;
	}

	public void setTeacherTitle(String teacherTitle) {
		this.teacherTitle = teacherTitle;
	}

	
	
	
}
