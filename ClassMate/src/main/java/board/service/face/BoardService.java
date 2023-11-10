package board.service.face;

import java.util.List;
import java.util.Map;

import board.dto.FreeBoard;
import web.util.Paging;

public interface BoardService {

	public Paging getBoardPaging(Paging paging);
	
	//게시판 전체 리스트 조회
	public Map<String, Object> listBoard(Paging paging);


}
