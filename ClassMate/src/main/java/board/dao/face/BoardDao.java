package board.dao.face;

import java.util.List;

import board.dto.AnnounceBoard;
import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import board.dto.EventBoardFile;
import board.dto.FreeBoard;
import board.dto.FreeBoardFile;
import user.dto.UserInfo;
import web.util.Paging;

public interface BoardDao {

	//자유게시판 게시글 카운트
	public int freeCntAll();
	
	/**
	 * 자유게시판 조회
	 * 
	 * @param paging - 기능을 추가한 조회
	 * @return
	 */
	public List<FreeBoard> selectFreeAll(Paging paging);

	//공지게시판 조회
	public List<AnnounceBoard> selectAnnounceAll();

	//이벤트게시판 조회
	public List<EventBoard> selectEventAll();

	//아이디를 통해서 조회
	public UserInfo writeUserId(String userId);

	//자유게시판 등록
	public void insert(FreeBoard freeBoard);

	//파일 등록
	public void insertFile(FreeBoardFile freeBoardFile);

	//자유게시판 상세조회 - 기본
	public FreeBoard selectFreeBoardNo(FreeBoard viewFree);

	//자유게시판 상세조회 - 조회수
	public int updateHit(FreeBoard viewFree);
	
	//자유게시판 상세조회 - 첨부파일 조회
	public List<FreeBoardFile> AttachFreeFile(FreeBoard viewFree);
	
	//자유게시판 상세조회 - 첨부파일 다운로드
	public FreeBoardFile downFreeFileNo(FreeBoardFile freeBoardFile);

	//자유게시판 파일 삭제
	public void deleteFreeFileBoardNo(FreeBoard deleteFree);

	//자유게시글 삭제
	public void deleteFreeBoardNo(FreeBoard deleteFree);

	//---------------------------------------------------------------
	
	//공지게시판 상세조회 - 조회수
	public int announceUpdateHit(AnnounceBoard viewAnnounce);

	//공지게시판 상세조회 - 기본
	public AnnounceBoard selectAnnounceBoardNo(AnnounceBoard viewAnnounce);

	//공지게시판 상세조회 - 첨부파일 조회
	public List<AnnounceBoardFile> AttachAnnounceFile(AnnounceBoard viewAnnounce);

	
	//이벤트게시판 상세조회 - 조회수
	public void eventUpdateHit(EventBoard viewEvent);

	//이벤트게시판 상세조회 - 기본
	public EventBoard selectEventBoardNo(EventBoard viewEvent);

	//이벤트게시판 상세조회 - 첨부파일 조회
	public List<EventBoardFile> AttachEventFile(EventBoard viewEvent);



}
