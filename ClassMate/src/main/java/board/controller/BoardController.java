package board.controller;

import java.util.Arrays;
import java.util.List;
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

import board.dto.AnnounceBoard;
import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import board.dto.EventBoardFile;
import board.dto.FreeBoard;
import board.dto.FreeBoardFile;
import board.service.face.BoardService;
import user.dto.UserInfo;
import web.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired BoardService boardService;
	
	//통합게시판 조회
	@GetMapping("/board")
	public void listBoard(Model model, Map<String, Object> map, Paging paging, 
			HttpSession session, UserInfo userInfo) {
//		logger.info("/board/board [GET]");
		
		paging = boardService.getBoardPaging(paging);
//	    logger.info("paging : {}", paging);
		
		//게시판 조회
		map = boardService.listBoard(paging);
		
		model.addAttribute("paging", paging);
		
		model.addAttribute("freeList", map.get("freeList"));
		model.addAttribute("announceList", map.get("announceList"));
		model.addAttribute("eventList", map.get("eventList"));
		
	}
	
	//자유게시글 작성
	@GetMapping("/freeWrite")
	public void writeGet(UserInfo user, HttpSession session, Model model) {
		
		user.setUserId((String) session.getAttribute("userId"));
		user = boardService.writeUserId(user.getUserId());
		
		model.addAttribute("userNo", user.getUserNo());
		model.addAttribute("userName", user.getUserName());
		
	}
	
	@PostMapping("/freeWrite")
	public String write(FreeBoard freeBoard, Model model, List<MultipartFile> file, HttpSession session) {
		if(freeBoard.getFreeContent() != null && freeBoard.getFreeName() != null && freeBoard.getFreeHead() != null ) {
			boardService.write(freeBoard, file);
//			System.out.println(file);
		}
		
		return "redirect:./board";
	}
	
	//자유게시판 상세조회
	@GetMapping("/freeView")
	private String viewFree(FreeBoard viewFree, Model model) {
			
		if( viewFree.getFreeNo() < 1 ) {
			return "redirect:./board";
		}
		logger.info("아 왜 안되냐고{}",viewFree.getFreeNo());
		//상세보기 게시글 조회
		viewFree = boardService.freeView(viewFree);
//		logger.info("{}", viewFree);
		
		//모델값 전달
		model.addAttribute("viewFree", viewFree);
		
		//첨부파일 정보 전달
		List<FreeBoardFile> freeBoardFile = boardService.getAttachFreeFile( viewFree );
		model.addAttribute("freeBoardFile", freeBoardFile);
//		logger.info("freeBoardFile:{}", freeBoardFile);

		return "board/freeView";
	}
	
	//자유게시판 상세보기 - 첨부파일 다운로드
	@RequestMapping("/download")
	public String down(FreeBoardFile freeBoardFile, Model model) {
		
		//첨부파일 정보 조회
		freeBoardFile = boardService.getFreeFile( freeBoardFile );
		model.addAttribute("downFile", freeBoardFile);
		
		return "down";
	}
	
	//자유게시판 삭제
	@RequestMapping("/delete")
	public String delete(FreeBoard deleteFree, Model model) {
		
		if( deleteFree.getFreeNo() < 1 ) {
			return "redirect:./board";
		}

		boardService.deleteFreeBoard( deleteFree );
		
		return "redirect:./board";
	
	}
	
	//-------------------------------------------------------------
	
	//공지게시판 상세조회
	@GetMapping("/announceView")
	private String viewAnnounce(AnnounceBoard viewAnnounce, Model model) {
			
		if( viewAnnounce.getAnnounceNo() < 1 ) {
			return "redirect:./board";
		}
		
		//상세보기 게시글 조회
		viewAnnounce = boardService.announceView(viewAnnounce);
//		logger.info("{}", viewAnnounce);
		
		//모델값 전달
		model.addAttribute("viewAnnounce", viewAnnounce);
		
		//첨부파일 정보 전달
		List<AnnounceBoardFile> announceBoardFile = boardService.getAttachAnnounceFile( viewAnnounce );
		model.addAttribute("announceBoardFile", announceBoardFile);
//		logger.info("announceBoardFile:{}", announceBoardFile);

		return "board/announceView";
	}
	
	//공지게시판 상세보기 - 첨부파일 다운로드
//	@RequestMapping("/announceDownload")
//	public String down(AnnounceBoardFile announceBoardFile, Model model) {
//		
//		//첨부파일 정보 조회
//		AnnounceBoardFile = boardService.getAnnounceFile( announceBoardFile );
//		model.addAttribute("downFile", announceBoardFile);
//		
//		return "down";
//	}
	
	//공지게시판 상세조회
	@GetMapping("/eventView")
	private String viewEvent(EventBoard viewEvent, Model model) {
			
		if( viewEvent.getEventNo() < 1 ) {
			return "redirect:./board";
		}
		
		//상세보기 게시글 조회
		viewEvent = boardService.EventView(viewEvent);
//		logger.info("{}", viewEvent);
		
		//모델값 전달
		model.addAttribute("viewEvent", viewEvent);
		
		//첨부파일 정보 전달
		List<EventBoardFile> eventBoardFile = boardService.getAttachEventFile( viewEvent );
		model.addAttribute("eventBoardFile", eventBoardFile);
//		logger.info("eventBoardFile:{}", eventBoardFile);

		return "board/eventView";
	}
	
	//공지게시판 상세보기 - 첨부파일 다운로드
//	@RequestMapping("/eventDownload")
//	public String down(EventBoardFile eventBoardFile, Model model) {
//		
//		//첨부파일 정보 조회
//		EventBoardFile = boardService.getEventFile( eventBoardFile );
//		model.addAttribute("downFile", eventBoardFile);
//		
//		return "down";
//	}
	
	
	@GetMapping("/freeUpdate")
	private void freeUpdate(FreeBoard paramFree, Model model) {
		
//		if( paramFree.getFreeNo() < 1 ) {
//			return "redirect:./board";
//		}
		
		//상세보기 페이지 아님 표시
//		paramFree.setFreeHit(-1);
		
		//자유게시판 번호로 자유게시글 조회
//		logger.info("아 왜 안되냐고freeUpadate{}",paramFree.getFreeNo());
		paramFree = boardService.freeView(paramFree);
//		logger.info("유주상스{}", paramFree);
		if( paramFree.getFreeHead().equals("자유")) {
			model.addAttribute("freeHead",1);
		} else if(paramFree.getFreeHead().equals("모임")) {
			model.addAttribute("freeHead", 0);
		}
//		
		model.addAttribute("paramFree", paramFree);
//
//		
		//첨부파일 정보 전달
		List<FreeBoardFile> freeBoardFile = boardService.getAttachFreeFile( paramFree );
//		logger.info("유주상이문제다 {}", freeBoardFile);
		model.addAttribute("freeBoardFile", freeBoardFile);
		
	}
	
	@PostMapping("/freeUpdate")
	public String freeUpdateProc(
			FreeBoard updateParam
			, List<MultipartFile> file
			, int[] delFileno
			
			, HttpSession session
//			, @SessionAttribute("id") String id
//			, @SessionAttribute("nick") String nick
//			
			, Model model) {
//		
//			updateParam.setWriterId( id );
//			updateParam.setWriterNick( nick );

		
//		logger.info("updateParam {}", updateParam);
//		logger.info("file {}", file);
//		logger.info("delFileno {}", Arrays.toString(delFileno));
		logger.info("FreeBoard값 뭐냐고 : {}", updateParam);
		logger.info("file {}", file);

//		updateParam.setWriterId((String) session.getAttribute("id"));
		
//		boardService.update(updateParam, file, delFileno);
		
		return "redirect:./freeView?freeNo=" + updateParam.getFreeNo();
	}
	
	@GetMapping("/question")
	public void question() {
		
	}
	
}
