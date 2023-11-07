package admin.dto;

public class Admin {
	private int adminNo;
	private int userNo;
	
	public Admin() {}

	@Override
	public String toString() {
		return "Admin [adminNo=" + adminNo + ", userNo=" + userNo + "]";
	}

	public Admin(int adminNo, int userNo) {
		super();
		this.adminNo = adminNo;
		this.userNo = userNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
}
