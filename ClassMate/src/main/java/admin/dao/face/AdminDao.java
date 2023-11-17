package admin.dao.face;

import java.util.List;
import java.util.Map;

import user.dto.UserInfo;

public interface AdminDao {

	/**
	 * 전체 유저 수를 조회한다
	 * 
	 * 
	 * @return 총 유저 수
	 */
	public int userInfoCntAll();

	public List<UserInfo> selectUserAll(Map<String, Object> map);

	public List<UserInfo> selectDelUserAll(Map<String, Object> map);

	public UserInfo selectUser(UserInfo userdata);
	
}
