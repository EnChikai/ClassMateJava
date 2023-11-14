package board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import board.dto.FreeBoard;
import board.service.face.BoardService;
import user.dto.UserInfo;
import web.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired BoardService boardService;
	
	@GetMapping("/board")
	public void listBoard(Model model, Map<String, Object> map, Paging paging, 
			HttpSession session, UserInfo userInfo) {
		logger.info("/board/board [GET]");
		
		paging = boardService.getBoardPaging(paging);
	    logger.info("paging : {}", paging);
		
		//게시판 조회
		map = boardService.listBoard(paging);
		
		model.addAttribute("paging", paging);
		
		model.addAttribute("freeList", map.get("freeList"));
		model.addAttribute("announceList", map.get("announceList"));
		model.addAttribute("eventList", map.get("eventList"));
		
	}
	
	@GetMapping("/freeWrite")
	public void writeGet(UserInfo user, HttpSession session, Model model) {
		
		user.setUserId((String) session.getAttribute("userId"));
		user = boardService.writeUserId(user.getUserId()); 
		System.out.println("덕주옹" + user);
		
		model.addAttribute("userNo", user.getUserNo());
		model.addAttribute("userName", user.getUserName());
		
	}
	
	@PostMapping("/freeWrite")
	public String write(FreeBoard freeBoard, Model model, MultipartFile mfile, HttpSession session) {
		
		if(freeBoard.getFreeContent() != null && freeBoard.getFreeName() != null && freeBoard.getFreeHead() != null ) {
			boardService.write(freeBoard);
		} 
		
		return "redirect:./board";
	}
	
	
}
