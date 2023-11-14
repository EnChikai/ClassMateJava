package board.service.face;

import java.util.Map;

import board.dto.FreeBoard;
import user.dto.UserInfo;
import web.util.Paging;

public interface BoardService {

	public Paging getBoardPaging(Paging paging);
	
	//게시판 전체 리스트 조회
	public Map<String, Object> listBoard(Paging paging);
	
	//아이디 조회
	public UserInfo writeUserId(String userId);

	//자유 게시판 등록
	public void write(FreeBoard freeBoard);


}
