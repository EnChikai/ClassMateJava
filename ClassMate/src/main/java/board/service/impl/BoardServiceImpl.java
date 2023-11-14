
package board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.face.BoardDao;
import board.dto.AnnounceBoard;
import board.dto.EventBoard;
import board.dto.FreeBoard;
import board.service.face.BoardService;
import user.dto.UserInfo;
import web.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired BoardDao boardDao;

	@Override
	public Paging getBoardPaging(Paging paging1) {
	      logger.info("getPaging(Paging param)");
	      
	      //총 게시글 수 조회
	      int totalCount = boardDao.freeCntAll();
	      logger.info("totalCount : {}",totalCount);
	      
	      //페이징 객체 생성(페이징 계산)
	      Paging paging2 = new Paging(totalCount, paging1.getCurPage());
	      
		return paging2;
	}
	
	@Override
	public Map<String, Object> listBoard(Paging paging) {

		List<FreeBoard> freeList = boardDao.selectFreeAll(paging);
		List<AnnounceBoard> announceList = boardDao.selectAnnounceAll();
		List<EventBoard> eventList = boardDao.selectEventAll();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("freeList", freeList);
		map.put("announceList", announceList);
		map.put("eventList", eventList);
		
		return map;
	}

	@Override
	public UserInfo writeUserId(String userId) {
		System.out.println(userId);
		return boardDao.writeUserId(userId);
	}

	@Override
	public void write(FreeBoard freeBoard) {
		boardDao.insert(freeBoard);
	}

	


}

