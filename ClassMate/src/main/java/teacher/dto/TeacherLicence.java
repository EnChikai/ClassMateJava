package teacher.dto;

public class TeacherLicence {
	private int licenceNo;
	private int teacherNo;
	
	public TeacherLicence() {}

	@Override
	public String toString() {
		return "TeacherLicence [licenceNo=" + licenceNo + ", teacherNo=" + teacherNo + "]";
	}

	public TeacherLicence(int licenceNo, int teacherNo) {
		super();
		this.licenceNo = licenceNo;
		this.teacherNo = teacherNo;
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
	
	
}
