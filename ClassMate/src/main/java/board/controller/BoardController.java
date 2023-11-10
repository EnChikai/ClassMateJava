package board.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import board.service.face.BoardService;
import web.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired BoardService boardService;
	
	@GetMapping("/board")
	public void listBoard(Model model, Map<String, Object> map, Paging paging) {
		logger.info("/board/board [GET]");
		
		paging = boardService.getBoardPaging(paging);
	    logger.info("paging : {}", paging);
		
		//자유게시판 조회
		map = boardService.listBoard(paging);
		
		model.addAttribute("freeList", map.get("freeList"));
		model.addAttribute("announceList", map.get("announceList"));
		model.addAttribute("eventList", map.get("eventList"));

		
	}
	
	
	
	
}
