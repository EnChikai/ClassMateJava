package board.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import board.dto.AnnounceBoard;
import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import board.dto.EventBoardFile;
import board.dto.FreeBoard;
import board.dto.FreeBoardFile;
import board.dto.FreeComment;
import board.dto.Question;
import board.dto.QuestionFile;
import board.service.face.BoardService;
import user.dto.UserInfo;
import web.util.Paging;
import web.util.PagingQuestion;

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
		
		//게시판 조회
		map = boardService.listBoard(paging);
		
		model.addAttribute("paging", paging);
		
		model.addAttribute("freeList", map.get("freeList"));
		model.addAttribute("announceList", map.get("announceList"));
		model.addAttribute("eventList", map.get("eventList"));
		
	}
	
	//자유게시글 작성
	@GetMapping("/freeWrite")
	public String writeGet(UserInfo user, HttpSession session, Model model) {
		
		  // 세션에 저장된 userId 가져오기
		  String userId = (String) session.getAttribute("userId");

		    // 세션에 userId가 없으면 로그인 페이지로 리다이렉트
		    if (userId == null) {
		        return "redirect:/user/login";
		    }

		    // 세션에 저장된 userId를 이용해 사용자 정보 조회
		    user.setUserId(userId);
		    user = boardService.writeUserId(user.getUserId());

		    // 사용자 정보가 올바르게 조회되었을 경우 모델에 추가하고 페이지로 이동
		    if (user != null) {
		        model.addAttribute("userNo", user.getUserNo());
		        model.addAttribute("userName", user.getUserName());
		        return "board/freeWrite"; // 실제 뷰의 경로를 반환
		    } else {
		        // 사용자 정보가 조회되지 않았을 경우 다른 처리를 수행하거나 에러 페이지로 리다이렉트
		        return "redirect:/error";
		    }
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
	private String viewFree(FreeBoard viewFree, Model model, FreeComment freeComment) {
			
		if( viewFree.getFreeNo() < 1 ) {
			return "redirect:./board";
		}
		//상세보기 게시글 조회
		viewFree = boardService.freeView(viewFree);
		
		//모델값 전달
		model.addAttribute("viewFree", viewFree);
		
		//첨부파일 정보 전달
		List<FreeBoardFile> freeBoardFile = boardService.getAttachFreeFile( viewFree );
		model.addAttribute("freeBoardFile", freeBoardFile);
		
		return "board/freeView";
	}

	//자유게시판 상세보기 - 댓글 등록
	@PostMapping("/freeView")
	@ResponseBody 
	public Map<String,Object> freeComment(HttpSession session, @RequestParam Map<String,Object> userInfo ) {
		UserInfo user = new UserInfo();
		user.setUserId((String)session.getAttribute("userId"));
		logger.info(user.toString());
		user = boardService.getUserInfo(user);
		
		FreeComment freeComment = new FreeComment();
		freeComment.setFreeNo(Integer.parseInt((String)userInfo.get("freeNo")));
		freeComment.setUserNo(user.getUserNo());
		freeComment.setFreeCommentContent((String) userInfo.get("freeCommentContent"));
		
		freeComment = boardService.freeCommentInsert(freeComment);
		freeComment.setUserName(user.getUserName());
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("freeCommentNo",freeComment.getFreeCommentNo());
		map.put("freeCommentContent",freeComment.getFreeCommentContent());
		map.put("userName", freeComment.getUserName());
		map.put("freeCommentDate",freeComment.getFreeCommentDate());
		map.put("userNo",freeComment.getUserNo());
		map.put("freeCommentUserNo",user.getUserNo());
		
		return map;
	}
	
	//자유게시물 상세보기 - 댓글 목록
	@GetMapping("/freeView/comments")
	@ResponseBody
	public List<FreeComment> freeViewCommentComments(FreeComment freeComment, HttpSession session) {
		freeComment.setUserNo((int)session.getAttribute("userNo"));
		logger.info("댓글 목록의 게시물 번호 {}",freeComment.getFreeNo());
		List<FreeComment> freeCommentList = boardService.freeCommentList(freeComment);
		logger.info("댓글 목록 {}",freeCommentList); 
		
		return freeCommentList;
	}
	
	//자유게시물 상세보기 - 댓글 삭제
	@PostMapping("/freeView/deleteComment")
	@ResponseBody
	public List<FreeComment> freeViewCommentDelete(FreeComment freeCommentDelete, HttpSession session) {
		freeCommentDelete.setUserNo((int)session.getAttribute("userNo"));
		boardService.freeViewCommentDelete(freeCommentDelete);
		logger.info("삭제 할 게시물번호 {}",freeCommentDelete.getFreeNo());
		List<FreeComment> freeCommentList = boardService.freeCommentList(freeCommentDelete);
		logger.info("삭제 할 댓글번호 {}",freeCommentDelete.getFreeCommentNo());
		logger.info("댓글 삭제 성공");
		
		return freeCommentList;
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
		
		//모델값 전달
		model.addAttribute("viewAnnounce", viewAnnounce);
		
		//첨부파일 정보 전달
		List<AnnounceBoardFile> announceBoardFile = boardService.getAttachAnnounceFile( viewAnnounce );
		model.addAttribute("announceBoardFile", announceBoardFile);

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
		
		//모델값 전달
		model.addAttribute("viewEvent", viewEvent);
		
		//첨부파일 정보 전달
		List<EventBoardFile> eventBoardFile = boardService.getAttachEventFile( viewEvent );
		model.addAttribute("eventBoardFile", eventBoardFile);

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
		paramFree = boardService.freeView(paramFree);
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
		model.addAttribute("freeBoardFile", freeBoardFile);
		
	}
	
	@PostMapping("/freeUpdate")
	public String freeUpdateProc(
			FreeBoard updateParam
			, List<MultipartFile> file
			, int[] delFileno
			, HttpSession session
			
			, Model model) {
		
		updateParam.setUserNo((int) session.getAttribute("userNo"));
		
		boardService.update(updateParam, file, delFileno);
		
		return "redirect:./freeView?freeNo=" + updateParam.getFreeNo();
	}
	
	//1:1 문의게시판 목록
	@GetMapping("/question")
	public void question(Model model, PagingQuestion pagingQuestion, HttpSession session, UserInfo userInfo, HashMap<String, Object> map) {
		
		userInfo.setUserNo((int)session.getAttribute("userNo"));
		pagingQuestion = boardService.getQuestionBoardPaging(pagingQuestion, userInfo);
		
		boardService.questionList(pagingQuestion, userInfo, map);
		
		model.addAttribute("pagingQuestion", pagingQuestion);
		
		model.addAttribute("questionList", map.get("questionList"));
		
	}
	
	//1:1 문의 작성하기
	@GetMapping("/questionWrite")
	private String questionWriteGet(UserInfo user, HttpSession session, Model model) {
		
		// 세션에 저장된 userId 가져오기
		String userId = (String) session.getAttribute("userId");

	    // 세션에 userId가 없으면 로그인 페이지로 리다이렉트
	    if (userId == null) {
	        return "redirect:/user/login";
	    }
		
	    // 세션에 저장된 userId를 이용해 사용자 정보 조회
	    user.setUserId(userId);
	    user = boardService.writeUserId(user.getUserId());
	    
	    // 사용자 정보가 올바르게 조회되었을 경우 모델에 추가하고 페이지로 이동
	    if (user != null) {
	        model.addAttribute("userNo", user.getUserNo());
	        model.addAttribute("userName", user.getUserName());
	        return "board/questionWrite"; // 실제 뷰의 경로를 반환
	    } else {
	        // 사용자 정보가 조회되지 않았을 경우 다른 처리를 수행하거나 에러 페이지로 리다이렉트
	        return "redirect:/error";
	    }
	}
	
	@PostMapping("/questionWrite")
	public String questionWrite(Question question, Model model, List<MultipartFile> file, HttpSession session) {
		logger.info("게시물내용{}",question);
		if(question.getQuestionContent() != null && question.getQuestionName() != null && question.getQuestionCategory() != null ) {
			boardService.questionWrite(question, file);
		}
		
		return "redirect:./question";
	}
	
	//1:1 문의 확인하기
	@GetMapping("/questionView")
	private String questionView(Question viewQuestion, Model model) {
		
//		if( viewQuestion.getQuestionNo() < 1 ) {
//			return "redirect:./question";
//		}
		//상세보기 게시글 조회
		viewQuestion = boardService.questionView(viewQuestion);
		
		//모델값 전달
		model.addAttribute("viewQuestion", viewQuestion);
		
		//첨부파일 정보 전달
		List<QuestionFile> questionFile = boardService.getAttachQuestionFile( viewQuestion );
		model.addAttribute("questionFile", questionFile);

		return "board/questionView";
	}
	
	//통합게시판 검색 - 작성자 : 검색어 입력시 포함된 작성자의 리스트 조회
	@PostMapping("/board/boardNameSearch")
	@ResponseBody
	public Map<String,Object> boardNameSearch(Paging boardParam, Model model, String searchHead) {
		
//		logger.info("나와 {}", boardParam.getSearch());
		
		Paging boardNamePaging = boardService.boardNamePaging(boardParam);
		List<FreeBoard> boardNameList = boardService.boardNameList(boardNamePaging);
		
		logger.info("boardNameList {}", boardNameList);
		logger.info("boardNamePaging {}", boardNamePaging);
		
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("paging", boardNamePaging);
		map.put("boardNameList", boardNameList);
		map.put("searchHead", "작성자");
		
		return map;
	}
	//통합게시판 검색 - 제목 : 검색어 입력시 포함된 제목의 리스트 조회
	@PostMapping("/board/boardTitleSearch")
	@ResponseBody
	public Map<String,Object> boardTitleSearch(Paging boardTitleParam, Model model) {
		
		Paging boardTitlePaging = boardService.boardTitlePaging(boardTitleParam);
		logger.info("boardTitleParam 이거 맞아?{}", boardTitleParam);
	
		List<FreeBoard> boardTitleList = boardService.boardTitleList(boardTitlePaging);
		logger.info("FreeBoardList : {}", boardTitleList);
		logger.info("boardTitlePaging : {}", boardTitlePaging);
		
		Map<String,Object> map = new HashMap<>();
		map.put("paging", boardTitlePaging);
		map.put("boardNameList", boardTitleList);
		map.put("searchHead", "제목");
		
		
		
		return map;
	}
	
	
	
}
