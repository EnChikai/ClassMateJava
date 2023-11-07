package board.dto;

public class FreeBoardFile {
	private int fileNo;
	private int freeNo;
	private String originName;
	private String storedName;
	
	public FreeBoardFile() {}

	@Override
	public String toString() {
		return "FreeBoardFile [fileNo=" + fileNo + ", freeNo=" + freeNo + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public FreeBoardFile(int fileNo, int freeNo, String originName, String storedName) {
		super();
		this.fileNo = fileNo;
		this.freeNo = freeNo;
		this.originName = originName;
		this.storedName = storedName;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
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
