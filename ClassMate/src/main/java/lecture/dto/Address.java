package lecture.dto;

public class Address {
	private int addressNo;
	private int classNo;
	private int latutude;
	private int longitude;
	private String adressName;
	
	public Address() {}

	@Override
	public String toString() {
		return "Address [addressNo=" + addressNo + ", classNo=" + classNo + ", latutude=" + latutude + ", longitude="
				+ longitude + ", adressName=" + adressName + "]";
	}

	public Address(int addressNo, int classNo, int latutude, int longitude, String adressName) {
		super();
		this.addressNo = addressNo;
		this.classNo = classNo;
		this.latutude = latutude;
		this.longitude = longitude;
		this.adressName = adressName;
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

	public int getLatutude() {
		return latutude;
	}

	public void setLatutude(int latutude) {
		this.latutude = latutude;
	}

	public int getLongitude() {
		return longitude;
	}

	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}

	public String getAdressName() {
		return adressName;
	}

	public void setAdressName(String adressName) {
		this.adressName = adressName;
	}
	
	
}
