package user.dto;

import java.sql.Date;

public class UserInfo {
	private int userNo;
	private String userId;
	private String userPw;
	private String userGender;
	private Date userBirthday;
	private String userPhone;
	private String userName;
	private String userEmail;
	private String mainAddress;
	private String subAddress;
	private int userPost;
	private int userSecession;
	private Date userDateCreated;
	
	public UserInfo() {}

	@Override
	public String toString() {
		return "UserInfo [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userGender=" + userGender
				+ ", userBirthday=" + userBirthday + ", userPhone=" + userPhone + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", mainAddress=" + mainAddress + ", subAddress=" + subAddress
				+ ", userPost=" + userPost + ", userSecession=" + userSecession + ", userDateCreated=" + userDateCreated
				+ "]";
	}

	public UserInfo(int userNo, String userId, String userPw, String userGender, Date userBirthday, String userPhone,
			String userName, String userEmail, String mainAddress, String subAddress, int userPost, int userSecession,
			Date userDateCreated) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userGender = userGender;
		this.userBirthday = userBirthday;
		this.userPhone = userPhone;
		this.userName = userName;
		this.userEmail = userEmail;
		this.mainAddress = mainAddress;
		this.subAddress = subAddress;
		this.userPost = userPost;
		this.userSecession = userSecession;
		this.userDateCreated = userDateCreated;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public Date getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getMainAddress() {
		return mainAddress;
	}

	public void setMainAddress(String mainAddress) {
		this.mainAddress = mainAddress;
	}

	public String getSubAddress() {
		return subAddress;
	}

	public void setSubAddress(String subAddress) {
		this.subAddress = subAddress;
	}

	public int getUserPost() {
		return userPost;
	}

	public void setUserPost(int userPost) {
		this.userPost = userPost;
	}

	public int getUserSecession() {
		return userSecession;
	}

	public void setUserSecession(int userSecession) {
		this.userSecession = userSecession;
	}

	public Date getUserDateCreated() {
		return userDateCreated;
	}

	public void setUserDateCreated(Date userDateCreated) {
		this.userDateCreated = userDateCreated;
	}
	
}
