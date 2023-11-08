package lecture.dto;

import java.sql.Date;

public class Class {
	private int classNo;
	private int teacherNo;
	private int mainCategoryNo;
	private int subCategoryNo;
	private String teacher;
	private String className;
	private Date classStart;
	private Date classEnd;
	private int maxCount;
	private int expense;
	private String classInfo;
	private String curriculum;
	private int onOff;
	private String headImg;
	private String content;
	private int deleteBoolean;
	
	public Class() {}

	public Class(int classNo, int teacherNo, int mainCategoryNo, int subCategoryNo, String teacher, String className,
			Date classStart, Date classEnd, int maxCount, int expense, String classInfo, String curriculum, int onOff,
			String headImg, String content, int deleteBoolean) {
		super();
		this.classNo = classNo;
		this.teacherNo = teacherNo;
		this.mainCategoryNo = mainCategoryNo;
		this.subCategoryNo = subCategoryNo;
		this.teacher = teacher;
		this.className = className;
		this.classStart = classStart;
		this.classEnd = classEnd;
		this.maxCount = maxCount;
		this.expense = expense;
		this.classInfo = classInfo;
		this.curriculum = curriculum;
		this.onOff = onOff;
		this.headImg = headImg;
		this.content = content;
		this.deleteBoolean = deleteBoolean;
	}

	@Override
	public String toString() {
		return "Class [classNo=" + classNo + ", teacherNo=" + teacherNo + ", mainCategoryNo=" + mainCategoryNo
				+ ", subCategoryNo=" + subCategoryNo + ", teacher=" + teacher + ", className=" + className
				+ ", classStart=" + classStart + ", classEnd=" + classEnd + ", maxCount=" + maxCount + ", expense="
				+ expense + ", classInfo=" + classInfo + ", curriculum=" + curriculum + ", onOff=" + onOff
				+ ", headImg=" + headImg + ", content=" + content + ", deleteBoolean=" + deleteBoolean + "]";
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public int getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}

	public int getMainCategoryNo() {
		return mainCategoryNo;
	}

	public void setMainCategoryNo(int mainCategoryNo) {
		this.mainCategoryNo = mainCategoryNo;
	}

	public int getSubCategoryNo() {
		return subCategoryNo;
	}

	public void setSubCategoryNo(int subCategoryNo) {
		this.subCategoryNo = subCategoryNo;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Date getClassStart() {
		return classStart;
	}

	public void setClassStart(Date classStart) {
		this.classStart = classStart;
	}

	public Date getClassEnd() {
		return classEnd;
	}

	public void setClassEnd(Date classEnd) {
		this.classEnd = classEnd;
	}

	public int getMaxCount() {
		return maxCount;
	}

	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}

	public int getExpense() {
		return expense;
	}

	public void setExpense(int expense) {
		this.expense = expense;
	}

	public String getClassInfo() {
		return classInfo;
	}

	public void setClassInfo(String classInfo) {
		this.classInfo = classInfo;
	}

	public String getCurriculum() {
		return curriculum;
	}

	public void setCurriculum(String curriculum) {
		this.curriculum = curriculum;
	}

	public int getOnOff() {
		return onOff;
	}

	public void setOnOff(int onOff) {
		this.onOff = onOff;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDeleteBoolean() {
		return deleteBoolean;
	}

	public void setDeleteBoolean(int deleteBoolean) {
		this.deleteBoolean = deleteBoolean;
	}

}
