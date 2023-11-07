package board.dto;

public class QuestionFile {
	private int fileNo;
	private int questionNo;
	private String originName;
	private String storedName;
	
	public QuestionFile() {}

	@Override
	public String toString() {
		return "QuestionFile [fileNo=" + fileNo + ", questionNo=" + questionNo + ", originName=" + originName
				+ ", storedName=" + storedName + "]";
	}

	public QuestionFile(int fileNo, int questionNo, String originName, String storedName) {
		super();
		this.fileNo = fileNo;
		this.questionNo = questionNo;
		this.originName = originName;
		this.storedName = storedName;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
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
