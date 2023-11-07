package board.dto;

public class AnnounceBoardFile {

	private int fileNo;
	private int announceNo;
	private String originName;
	private String storedName;
	
	public AnnounceBoardFile() {}

	@Override
	public String toString() {
		return "AnnounceBoardFile [fileNo=" + fileNo + ", announceNo=" + announceNo + ", originName=" + originName
				+ ", storedName=" + storedName + "]";
	}

	public AnnounceBoardFile(int fileNo, int announceNo, String originName, String storedName) {
		super();
		this.fileNo = fileNo;
		this.announceNo = announceNo;
		this.originName = originName;
		this.storedName = storedName;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getAnnounceNo() {
		return announceNo;
	}

	public void setAnnounceNo(int announceNo) {
		this.announceNo = announceNo;
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
