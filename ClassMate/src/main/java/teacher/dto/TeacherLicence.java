package teacher.dto;

public class TeacherLicence {
	private int licenceNo;
	private int teacherNo;
	private String originName;
	private String storedName;
	
	public TeacherLicence() {}

	@Override
	public String toString() {
		return "TeacherLicence [licenceNo=" + licenceNo + ", teacherNo=" + teacherNo + ", originName=" + originName
				+ ", storedName=" + storedName + "]";
	}

	public TeacherLicence(int licenceNo, int teacherNo, String originName, String storedName) {
		super();
		this.licenceNo = licenceNo;
		this.teacherNo = teacherNo;
		this.originName = originName;
		this.storedName = storedName;
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

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}



	
	
}
