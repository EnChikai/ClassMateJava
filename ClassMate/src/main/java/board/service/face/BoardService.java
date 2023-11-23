package board.service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

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
import web.util.PagingQuestion;

public interface BoardService {

	public Paging getBoardPaging(Paging paging);
	
	//게시판 전체 리스트 조회
	public Map<String, Object> listBoard(Paging paging);
	
	//아이디 조회
	public UserInfo writeUserId(String userId);

	//자유게시판 등록, 파일 등록
	public void write(FreeBoard freeBoard, List<MultipartFile> mfile);

	//자유게시판 상세조회 - 조회수, 기본
	public FreeBoard freeView(FreeBoard viewFree);

	//자유게시판 상세조회 - 첨부파일 조회
	public List<FreeBoardFile> getAttachFreeFile(FreeBoard viewFree);

	//자유게시판 상세조회 - 첨부파일 다운로드
	public FreeBoardFile getFreeFile(FreeBoardFile freeBoardFile);

	//자유게시판 상세보기 - 댓글 입력
	public void freeCommentInsert(FreeComment freeComment);
	
	//자유게시판 상세보기 - 댓글 조회
	public List<FreeComment> freeCommentList(FreeComment freeComment);
	
	//자유게시판 삭제
	public void deleteFreeBoard(FreeBoard deleteFree);

	//---------------------------------------------------------------
	
	//공지게시판 상세조회 - 조회수, 기본
	public AnnounceBoard announceView(AnnounceBoard viewAnnounce);

	//공지게시판 상세조회 - 첨부파일 조회
	public List<AnnounceBoardFile> getAttachAnnounceFile(AnnounceBoard viewAnnounce);

	
	//이벤트게시판 상세조회 - 조회수, 기본
	public EventBoard EventView(EventBoard viewEvent);

	//이벤트게시판 상세조회 - 첨부파일 조회
	public List<EventBoardFile> getAttachEventFile(EventBoard viewEvent);

	//---------------------------------------------------------------

	//자유게시판 수정하기
	public void update(FreeBoard updateParam, List<MultipartFile> file, int[] delFileno);

	//---------------------------------------------------------------
	
	public PagingQuestion getQuestionBoardPaging(PagingQuestion pagingQuestion, UserInfo userInfo);

	//1:1문의게시판 목록 조회
	public HashMap<String,Object> questionList(PagingQuestion pagingQuestion, UserInfo userInfo, HashMap<String,Object> map);

	//1:1문의게시판 작성하기
	public void questionWrite(Question question, List<MultipartFile> file);
	
	//1:1문의게시판 조회하기
	public Question questionView(Question viewQuestion);

	//1:1문의게시판 조회하기 - 파일
	public List<QuestionFile> getAttachQuestionFile(Question viewQuestion);



	
	

}
