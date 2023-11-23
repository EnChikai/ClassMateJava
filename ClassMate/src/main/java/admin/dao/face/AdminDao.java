package admin.dao.face;

import java.util.List;
import java.util.Map;

import board.dto.AnnounceBoard;
import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import board.dto.EventBoardFile;
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

	public int announceBoardCntAll(int delCheckbox);

	public int eventBoardCntAll(int delCheckbox);

	public List<EventBoard> selectEventBoardAll(Map<String, Object> pagingMap);

	public List<AnnounceBoard> selectAnnounceBoardAll(Map<String, Object> pagingMap);
	
	public List<EventBoard> selectEventBoardDel(Map<String, Object> pagingMap);

	public List<AnnounceBoard> selectAnnounceBoardDel(Map<String, Object> pagingMap);

	public AnnounceBoard selectAnnounceNo(AnnounceBoard announceBoard);

	public int insertAnnounceInfo(AnnounceBoard announceBoard);

	public int insertEventInfo(EventBoard eventBoard);

	public int headImg(EventBoard eventBoard);

	public EventBoard selectEventNo(EventBoard eventBoard);

	public int insertAnnoFile(AnnounceBoardFile announceBoardFile);

	public List<AnnounceBoardFile> selectAnnounceFile(AnnounceBoard announceBoard);

	public int insertEventFile(EventBoardFile eventBoardFile);

	public List<EventBoardFile> selectEventFile(EventBoard eventBoard);

	public AnnounceBoardFile selectAnnoFileByFileNo(AnnounceBoardFile announceBoardFile);

	public int updateEventInfo(EventBoard eventBoard);

	public int deleteEventFiles(int[] delFileno);

	public int updateAnnoInfo(AnnounceBoard announceBoard);

	public int deleteAnnoFiles(int[] delFileno);

	public int updateAnnoExist(AnnounceBoard announceBoard);

}
