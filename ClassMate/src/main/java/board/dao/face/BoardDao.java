package board.dao.face;

import java.util.HashMap;
import java.util.List;

import board.dto.AnnounceBoard;
import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import board.dto.EventBoardFile;
import board.dto.FreeBoard;
import board.dto.FreeBoardFile;
import board.dto.FreeComment;
import board.dto.Question;
import board.dto.QuestionFile;
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
	
	//자유게시판 상세조회 - 댓글 입력
	public void freeCommentInsert(FreeComment freeComment);
	
	//자유게시판 상세조회 - 댓글 조회
	public List<FreeComment> freeCommentList(FreeComment freeComment);

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

	//---------------------------------------------------------------

	//자유게시판 수정하기
	public void update(FreeBoard updateParam);

	//자유게시판 수정하기 - 파일
	public void deleteFiles(int[] delFileno);

	//1:1문의게시판 게시글 카운트
	public int questionCntAll(UserInfo userInfo);

	//1:1문의게시판 목록 조회
	public List<Question> selectQuestionAll(HashMap<String, Object> map);

	//1:1문의게시판 등록
	public void questionInsert(Question question);

	//1:1문의게시판 등록 - 파일
	public void insertFileQuestion(QuestionFile questionFile);

	//1:1문의게시판 상세보기
	public Question selectQuestionNo(Question viewQuestion);

	//1:1문의게시판 상세보기 - 파일
	public List<QuestionFile> AttachQuestionFile(Question viewQuestion);




}
