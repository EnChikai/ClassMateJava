package teacher.dto;

public class TeacherApply {
	private int applyNo;
	private int teacherNo;
	private String passOrNot;
	
	public TeacherApply() {}

	@Override
	public String toString() {
		return "TeacherApply [applyNo=" + applyNo + ", teacherNo=" + teacherNo + ", passOrNot=" + passOrNot + "]";
	}

	public TeacherApply(int applyNo, int teacherNo, String passOrNot) {
		super();
		this.applyNo = applyNo;
		this.teacherNo = teacherNo;
		this.passOrNot = passOrNot;
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
	
	
}
