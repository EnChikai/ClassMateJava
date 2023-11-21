package admin.dao.face;

import java.util.List;
import java.util.Map;

import board.dto.AnnounceBoard;
import board.dto.EventBoard;
import user.dto.UserInfo;

public interface AdminDao {

	/**
	 * 전체 유저 수를 조회한다
	 * @param delCheckbox 
	 * 
	 * 
	 * @return 총 유저 수
	 */
	public int userInfoCntAll(int delCheckbox);

	public List<UserInfo> selectUserAll(Map<String, Object> map);

	public List<UserInfo> selectDelUserAll(Map<String, Object> map);

	public UserInfo selectUser(UserInfo userdata);

	public int updateUser(UserInfo userdata);

	public int setSecessionUser(UserInfo userdata);

	public int announceBoardCntAll();

	public int eventBoardCntAll();

	public List<EventBoard> selectEventBoardAll(Object object);

	public List<AnnounceBoard> selectAnnounceBoardAll(Object object);

	public AnnounceBoard selectAnnounceNo(AnnounceBoard announceBoard);
	
}
