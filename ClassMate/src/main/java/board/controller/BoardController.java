package board.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import board.dto.AnnounceBoard;
import board.dto.FreeBoard;
import board.service.face.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired BoardService boardService;
	
	@GetMapping("/board")
	public void listBoard(Model model, HashMap map) {
		logger.info("/board/board [GET]");
		
		//자유게시판 조회
		List<FreeBoard> allList = boardService.listBoard();
//		List<AnnounceBoard> announceList = boardService.listAnnounceBoard();
		
		
		model.addAttribute("allList", allList);
		
	}
	
	
	
	
}
