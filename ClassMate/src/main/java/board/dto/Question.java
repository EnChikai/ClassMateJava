package board.dto;

import java.sql.Date;

public class Question {
	private int questionNo;
	private int userNo;
	private String questionCategory;
	private String questionName;
	private String questionContent;
	private Date questionDate;
	private int questionHit;
	private String questionExist;
	private String answer;
	private String answerContent;
	
	public Question() {}

	@Override
	public String toString() {
		return "Question [questionNo=" + questionNo + ", userNo=" + userNo + ", questionCategory=" + questionCategory
				+ ", questionName=" + questionName + ", questionContent=" + questionContent + ", questionDate="
				+ questionDate + ", questionHit=" + questionHit + ", questionExist=" + questionExist + ", answer="
				+ answer + ", answerContent=" + answerContent + "]";
	}

	public Question(int questionNo, int userNo, String questionCategory, String questionName, String questionContent,
			Date questionDate, int questionHit, String questionExist, String answer, String answerContent) {
		super();
		this.questionNo = questionNo;
		this.userNo = userNo;
		this.questionCategory = questionCategory;
		this.questionName = questionName;
		this.questionContent = questionContent;
		this.questionDate = questionDate;
		this.questionHit = questionHit;
		this.questionExist = questionExist;
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

	public String getQuestionCategory() {
		return questionCategory;
	}

	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
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

	public int getQuestionHit() {
		return questionHit;
	}

	public void setQuestionHit(int questionHit) {
		this.questionHit = questionHit;
	}

	public String getQuestionExist() {
		return questionExist;
	}

	public void setQuestionExist(String questionExist) {
		this.questionExist = questionExist;
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
