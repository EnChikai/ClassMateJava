package admin.dao.face;

import java.util.List;
import java.util.Map;

import board.dto.AnnounceBoard;
import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import board.dto.EventBoardFile;
import lecture.dto.Class;
import payment.dto.OrderTb;
import payment.dto.Payment;
import user.dto.UserInfo;

public interface AdminDao {

	/**
	 * 탈퇴저리되지 않은 유저의 정보를 리스트 형식으로 가져온다
	 * 
	 * @param secessionParam 탈퇴여부( 0:미탈퇴, 1:탈퇴)
	 * 
	 * @return 가져온 유저 정보 리스트
	 */
	public int getUserCountAll(int secessionParam);
	

	//========================================================================================================

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

	public int selectOrderCnt(OrderTb orderTb);
	
	public List<OrderTb> selectUserOrder(Map<String, Object> map);
	
	public List<Payment> selectUserPayment(Map<String, Object> map);

	public Class selectClassNameByClassNo(int i);
	
	//========================================================================================================
	
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

	public int updateEventExist(EventBoard eventBoard);

	public int deleteAnnoFile(AnnounceBoard announceBoard);

	public int deleteAnnoInfo(AnnounceBoard announceBoard);

}
