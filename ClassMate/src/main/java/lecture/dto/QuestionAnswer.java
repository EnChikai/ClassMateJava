package lecture.dto;

import java.sql.Date;

public class QuestionAnswer {
	private int questionNo;
	private int userNo;
	private int classNo;
	private String questionName;
	private String questionContent;
	private Date questionDate;
	private String answer;
	private String answerContent;
	
	public QuestionAnswer() {}

	@Override
	public String toString() {
		return "QuestionAnswer [questionNo=" + questionNo + ", userNo=" + userNo + ", classNo=" + classNo
				+ ", questionName=" + questionName + ", questionContent=" + questionContent + ", questionDate="
				+ questionDate + ", answer=" + answer + ", answerContent=" + answerContent + "]";
	}

	public QuestionAnswer(int questionNo, int userNo, int classNo, String questionName, String questionContent,
			Date questionDate, String answer, String answerContent) {
		super();
		this.questionNo = questionNo;
		this.userNo = userNo;
		this.classNo = classNo;
		this.questionName = questionName;
		this.questionContent = questionContent;
		this.questionDate = questionDate;
		this.answer = answer;
		this.answerContent = answerContent;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public String getQuestionName() {
		return questionName;
	}

	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public Date getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	
}
