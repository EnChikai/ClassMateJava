package board.dto;

public class GeneralQuestion {
	private int qaNo;
	private String qaTitle;
	private String qaAnswer;
	
	public GeneralQuestion() {}

	@Override
	public String toString() {
		return "GeneralQuestion [qaNo=" + qaNo + ", qaTitle=" + qaTitle + ", qaAnswer=" + qaAnswer + "]";
	}

	public GeneralQuestion(int qaNo, String qaTitle, String qaAnswer) {
		super();
		this.qaNo = qaNo;
		this.qaTitle = qaTitle;
		this.qaAnswer = qaAnswer;
	}

	public int getQaNo() {
		return qaNo;
	}

	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}

	public String getQaTitle() {
		return qaTitle;
	}

	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}

	public String getQaAnswer() {
		return qaAnswer;
	}

	public void setQaAnswer(String qaAnswer) {
		this.qaAnswer = qaAnswer;
	}
	
	
}
