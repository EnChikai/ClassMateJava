package lecture.service.face;

import java.util.List;

import user.dto.UserInfo;
import lecture.dto.Class;

public interface ClassService {

	public List<Class> classList(UserInfo userInfo);
	
	
	
}
