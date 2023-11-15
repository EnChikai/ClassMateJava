package lecture.service.face;

import java.util.List;
import java.util.Map;

import user.dto.UserInfo;
import lecture.dto.Class;

public interface ClassService {

	public UserInfo whoAmI(UserInfo userInfo);

	public List<Class> classList(UserInfo userInfo);

	public Map<String, Object> lectureOff(Class lecture);
	
	
	
}
