
package board.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.face.BoardDao;
import board.dto.FreeBoard;
import board.service.face.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired BoardDao boardDao;

	@Override
	public List<FreeBoard> listBoard() {
		
//		List<FreeBoard> freeList = boardDao.selectFreeAll();
		
//		HashMap<Integer,List<FreeBoard>> map = new HashMap<>();
//		HashMap<Integer,List<AnnounceBoard>> map = new HashMap<>();
		
//		map.put(1, freeList); //값 추가
//		map.put(2,"");
//		map.put(3,"");
		
		return boardDao.selectFreeAll();
	}
	


}

