package lecture.service.face;

import java.util.List;
import java.util.Map;

import user.dto.UserInfo;
import lecture.dto.Class;
import lecture.dto.QuestionAnswer;

public interface ClassService {

	public UserInfo whoAmI(UserInfo userInfo);

	public List<Class> allLecture(UserInfo userInfo);

	public Map<String, Object> lectureOff(Class lecture);

	public Map<String, Object> lectureOn(Class lecture);

	public List<QuestionAnswer> allQABoardList(Class lecture);
	
	public List<Class> myLectureOn(UserInfo userInfo);

	public void insertQA(QuestionAnswer questionAnswer);
	
}
