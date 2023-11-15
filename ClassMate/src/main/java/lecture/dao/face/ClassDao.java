package lecture.dao.face;

import java.util.List;

import user.dto.UserInfo;
import lecture.dto.Address;
import lecture.dto.Class;


public interface ClassDao {

	public int getUserNoByUserId(UserInfo userInfo);

	public List<Class> selectClassListByUser(UserInfo userInfo);

	public Class selectClassByClassNo(Class lecture);
	
	public Address selectAddressByClass(Class lecture);

}
