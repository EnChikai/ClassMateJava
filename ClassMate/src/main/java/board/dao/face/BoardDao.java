package board.dao.face;

import java.util.List;

import board.dto.AnnounceBoard;
import board.dto.EventBoard;
import board.dto.FreeBoard;
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

	//공지사항게시판 조회
	public List<AnnounceBoard> selectAnnounceAll();

	//이벤트게시판 조회
	public List<EventBoard> selectEventAll();


}
