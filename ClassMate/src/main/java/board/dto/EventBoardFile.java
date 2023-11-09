package board.dto;

public class EventBoardFile {
	private int fileNo;
	private int eventNo;
	private String originName;
	private String storedName;
	
	public EventBoardFile() {}

	@Override
	public String toString() {
		return "EventBoardFile [fileNo=" + fileNo + ", eventNo=" + eventNo + ", originName=" + originName
				+ ", storedName=" + storedName + "]";
	}

	public EventBoardFile(int fileNo, int eventNo, String originName, String storedName) {
		super();
		this.fileNo = fileNo;
		this.eventNo = eventNo;
		this.originName = originName;
		this.storedName = storedName;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
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
