package board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import board.service.face.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired BoardService boardService;
	
	@GetMapping("/board")
	public void board() {
		logger.info("/board/board [GET]");
	}
	
}
