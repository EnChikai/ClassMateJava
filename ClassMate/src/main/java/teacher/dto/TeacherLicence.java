package teacher.dto;

public class TeacherLicence {
	private int licenceNo;
	private int teacherNo;
	private String origin_name;
	private String stored_name;
	
	public TeacherLicence() {}

	@Override
	public String toString() {
		return "TeacherLicence [licenceNo=" + licenceNo + ", teacherNo=" + teacherNo + ", origin_name=" + origin_name
				+ ", stored_name=" + stored_name + "]";
	}

	public TeacherLicence(int licenceNo, int teacherNo, String origin_name, String stored_name) {
		super();
		this.licenceNo = licenceNo;
		this.teacherNo = teacherNo;
		this.origin_name = origin_name;
		this.stored_name = stored_name;
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

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public String getStored_name() {
		return stored_name;
	}

	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
	}

	
	
}
