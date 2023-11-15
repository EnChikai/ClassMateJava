package lecture.dto;

public class Address {
	private int addressNo;
	private int classNo;
	private String mainAddress;
	private String subAddress;
	
	public Address() {}

	@Override
	public String toString() {
		return "Address [addressNo=" + addressNo + ", classNo=" + classNo + ", mainAddress=" + mainAddress
				+ ", subAddress=" + subAddress + "]";
	}

	public Address(int addressNo, int classNo, String mainAddress, String subAddress) {
		super();
		this.addressNo = addressNo;
		this.classNo = classNo;
		this.mainAddress = mainAddress;
		this.subAddress = subAddress;
	}

	public int getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
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

	
}
