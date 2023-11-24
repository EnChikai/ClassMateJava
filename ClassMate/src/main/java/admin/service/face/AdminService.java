package admin.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import board.dto.AnnounceBoard;
import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import payment.dto.OrderTb;
import teacher.dto.TeacherApply;
import user.dto.UserInfo;
import web.util.Paging;

public interface AdminService {

	//--- 메인 ---
	/**
	 * 대쉬보드 정보를 가져온다
	 * 
	 * @return 가져온 대쉬보드 정보 Map
	 */
	public Map<String, Object> getDashBoardInfo();

	//========================================================================================================
	//--- 유저 관리 ---
	
	/**
	 * 유저 목록을 위한 페이징 객체를 생성
	 * 
	 * 전달파라미터 객체의 curPage - 현재 페이지
	 * DB에서 조회한 totalCount - 총 유저 수
	 * 
	 * 두가지 데이터를 활용하여 페이징 객체를 생성하고 반환한다
	 * 
	 * @param param - curPage정보를 담고 있는 객체
	 * @param delCheckbox 
	 * @return 페이징 계산이 완료된 객체
	 */
	public Paging getUserPaging(Paging param, int delCheckbox);
	
	public List<UserInfo> userInfoList(Paging param, int sort, int delCheckbox);

	public UserInfo userInfo(UserInfo userdata);

	public void userInfoUpdate(UserInfo userdata);

	public void secessionUser(UserInfo userdata);

	public Paging getOrderPaging(Paging paging, OrderTb orderTb);
	
	//========================================================================================================
	//--- 강사 심사 관리 ---
	
	public Paging getApplyPaging(Paging paging, int passCheckbox);
	
	public Map<String, Object> selectTeacherApplyList(Paging paging, int passCheckbox);
	
	//========================================================================================================
	//--- 게시판 관리 ---
	
	public Map<String, Object> getBoardPaging(Paging paging, int delCheckbox);

	public Map<String, Object> boardList(Map<String, Object> pagingMap, int delCheckbox);

	public Map<String, Object> getAnnounceView(AnnounceBoard announceBoard);

	public void writeEvenAnno(String postName, String content, MultipartFile file, int sort, List<MultipartFile> announceFile, List<MultipartFile> eventFile);

	public Map<String, Object> getEventView(EventBoard eventBoard);

	public AnnounceBoardFile getAnnounceFile(AnnounceBoardFile announceBoardFile);

	public void eventUpdate(EventBoard eventBoard, MultipartFile file, int[] delFileno, List<MultipartFile> eventFile);

	public void announceUpdate(AnnounceBoard announceBoard, int[] delFileno, List<MultipartFile> announceFile);

	public Map<String, Object> getPaymentList(Paging paging, OrderTb orderTb);

	public void setAnnoExist(AnnounceBoard announceBoard);

	public void setEventExist(EventBoard eventBoard);

	public void announceDelete(AnnounceBoard announceBoard);

	public void eventDelete(EventBoard eventBoard);

}
