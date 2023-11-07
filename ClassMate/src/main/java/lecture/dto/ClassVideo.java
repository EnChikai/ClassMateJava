package lecture.dto;

public class ClassVideo {
	private int videoNo;
	private int classNo;
	private int videoLesson;
	private String originName;
	private String storedName;
	
	public ClassVideo() {}

	@Override
	public String toString() {
		return "ClassVideo [videoNo=" + videoNo + ", classNo=" + classNo + ", videoLesson=" + videoLesson
				+ ", originName=" + originName + ", storedName=" + storedName + "]";
	}

	public ClassVideo(int videoNo, int classNo, int videoLesson, String originName, String storedName) {
		super();
		this.videoNo = videoNo;
		this.classNo = classNo;
		this.videoLesson = videoLesson;
		this.originName = originName;
		this.storedName = storedName;
	}

	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public int getVideoLesson() {
		return videoLesson;
	}

	public void setVideoLesson(int videoLesson) {
		this.videoLesson = videoLesson;
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
