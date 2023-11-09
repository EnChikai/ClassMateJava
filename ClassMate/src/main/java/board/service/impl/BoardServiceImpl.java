package board.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.face.BoardDao;
import board.service.face.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired BoardDao boardDao;
	
	
	
}
