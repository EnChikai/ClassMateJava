package teacher.dto;

public class TeacherLicence {
	private int licenceNo;
	private int teacherNo;
	private String licenceImg;
	
	public TeacherLicence() {}

	@Override
	public String toString() {
		return "TeacherLicence [licenceNo=" + licenceNo + ", teacherNo=" + teacherNo + ", licenceImg=" + licenceImg
				+ "]";
	}

	public TeacherLicence(int licenceNo, int teacherNo, String licenceImg) {
		super();
		this.licenceNo = licenceNo;
		this.teacherNo = teacherNo;
		this.licenceImg = licenceImg;
	}

	public int getLicenceNo() {
		return licenceNo;
	}

	public void setLicenceNo(int licenceNo) {
		this.licenceNo = licenceNo;
	}

	public int getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}

	public String getLicenceImg() {
		return licenceImg;
	}

	public void setLicenceImg(String licenceImg) {
		this.licenceImg = licenceImg;
	}

	
	
	
	
}
