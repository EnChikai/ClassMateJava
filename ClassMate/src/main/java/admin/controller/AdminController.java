package admin.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import admin.service.face.AdminService;
import board.dto.AnnounceBoard;
import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import board.dto.EventBoardFile;
import board.dto.FreeBoard;
import board.dto.Question;
import board.dto.QuestionFile;
import payment.dto.OrderTb;
import teacher.dto.TeacherApply;
import teacher.dto.TeacherLicence;
import user.dto.UserInfo;
import web.util.Paging;
import lecture.dto.Class;

@Controller
public class AdminController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private AdminService adminService;
	
	//--- 메인 ---
	@GetMapping("/admin/main")
	public void adminMainPageGet(
			
			Model model
			, Map<String, Object> dashBoardInfo
			) {
		logger.info("/admin/main [GET]");
		
		//데쉬보드 제작중
		
		dashBoardInfo = adminService.getDashBoardInfo();
		
		model.addAttribute("userCount",dashBoardInfo.get("userCount"));
		model.addAttribute("secessionUserCount",dashBoardInfo.get("secessionUserCount"));
		model.addAttribute("teacherUserCount",dashBoardInfo.get("teacherUserCount"));
		model.addAttribute("onClassCount",dashBoardInfo.get("onClassCount"));
		model.addAttribute("offClassCount",dashBoardInfo.get("offClassCount"));
		model.addAttribute("payDateList",dashBoardInfo.get("payDateList"));
		model.addAttribute("paymentList",dashBoardInfo.get("paymentList"));
		
	}
	
	@PostMapping("/admin/main")
	public String adminMainPagePost(HttpSession session) {
		logger.info("/admin/main [Post]");
		
		session.invalidate();
		
		return "redirect:/main/main";
	}
	
	//==========================================================================================
	//--- 유저 관리 ---
	
	@GetMapping("/admin/userList")
	public void userInfoListGet(
			
			Paging paging
			, Model model
			, HttpServletRequest request
			
			) {
		logger.info("userInfoListGet [GET]");
		
		int sort = 0; 
		logger.info("sort디폴트 : {}", sort);

		if(request.getParameter("sort") != null) {
			for(int i=0; i<Integer.parseInt((request.getParameter("sort")))+1; i++) {
				sort = i;
			}
		}
		logger.info("sort확인 : {}", sort);
		
		int delCheckbox = 0; 
		logger.info("delCheckbox디폴트 : {}", delCheckbox);
		if(request.getParameter("delCheckbox") != null) {
			if(Integer.parseInt((request.getParameter("delCheckbox")))==1) {
				delCheckbox = 1;
			}
		}
		logger.info("delCheckbox확인 : {}", delCheckbox);
		
		// 페이징 계산
		paging = adminService.getUserPaging(paging, delCheckbox);
		logger.info("paging : {}", paging);
				
		List<UserInfo> list = adminService.userInfoList(paging, sort, delCheckbox);
		logger.info("list : {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("sort", sort);
		model.addAttribute("delCheckbox", delCheckbox);
		
		
	}
	
	@GetMapping("/admin/userDetailedInfo")
	public void userDetailedInfoGet(
			
			UserInfo userdata
			, Model model
			
			){
		logger.info("/admin/userDetailedInfo [GET] {}", userdata.getUserNo());
		
		userdata = adminService.userInfo(userdata);
		logger.info("/admin/userDetailedInfo [GET] {}", userdata);

		model.addAttribute("userdata",userdata);

	}
	
	@GetMapping("/admin/userInfoUpdate")
	public void userInfoUpdateGet(
			
			UserInfo userdata
			, Model model
			
			) {
		logger.info("/admin/userInfoUpdate [GET] {}", userdata.getUserNo());
		
		logger.info("/admin/userDetailedInfo [GET] {}", userdata.getUserNo());
		
		userdata = adminService.userInfo(userdata);
		logger.info("/admin/userDetailedInfo [GET] {}", userdata);

		model.addAttribute("userdata",userdata);
		
		
	}
	
	@PostMapping("/admin/userInfoUpdate")
	public String userInfoUpdatePost(
			
			UserInfo userdata
			
			) {
		logger.info("/admin/userInfoUpdate [POST] {}", userdata);
		
		adminService.userInfoUpdate(userdata);
		
		return "redirect:/admin/userDetailedInfo?userNo="+userdata.getUserNo();
		
	}
	
	@PostMapping("/admin/secessionUser")
	public String secessionUserGet(
			
			UserInfo userdata
			
			) {
		logger.info("/admin/secessionUser [GET] {}", userdata.getUserNo());
		
		adminService.secessionUser(userdata);
		
		return "redirect:/admin/userList";
	}
	
	@GetMapping("/admin/userPaymentList")
	public void userPaymentListGet(
			
			OrderTb orderTb
			, Model model
			, Map<String,Object> map
			, Paging paging
			
			) {
		logger.info("/admin/userPaymentList [GET] {}", orderTb.getUserNo());
		
		//페이징 계산
		paging = adminService.getOrderPaging(paging, orderTb);
		logger.info("paging : {}", paging);
		
		map = adminService.getPaymentList(paging, orderTb);
		logger.info("getPaymentList() : {}", map);
		
		model.addAttribute("paging",paging);
		model.addAttribute("orderTb",orderTb);
		model.addAttribute("map",map);
		
	}
	
	@GetMapping("/admin/userPostList")
	public void userPostListGet(
			
			UserInfo userInfo
			, Map<String, Object> map
			, Model model
			, String questionCurPage
			, String freeBoardCurPage
			
			) {
		logger.info("/admin/userPostListGet [GET]");
		logger.info("Question : {}", userInfo);
		logger.info("questionCurPage : {}", questionCurPage);
		
		//페이징 계산
		map = adminService.getUserBoardPaging(questionCurPage, freeBoardCurPage, userInfo);
		logger.info("questionPaging : {}", map.get("questionPaging"));
		
		model.addAttribute("questionPaging",map.get("questionPaging"));
		model.addAttribute("freeBoardPaging",map.get("freeBoardPaging"));
		
		map = adminService.selectUserPost(userInfo, (Paging) map.get("questionPaging"), (Paging) map.get("freeBoardPaging"));
		
		model.addAttribute("questionList",map.get("questionList"));
		model.addAttribute("freeBoardList",map.get("freeBoardList"));
		model.addAttribute("userInfo",userInfo);
		
	}
	
	@GetMapping("/admin/userQuestionView")
	public void userQuestionViewGet(
			
			Question question
			, Map<String,Object> map
			, Model model
			
			) {
		logger.info("/admin/userQuestionView [GET]");
		logger.info("question : {}", question);
		
		map = adminService.selectQuestionInfo(question);
		logger.info("selectQuestionInfo : {}", map);
		
		model.addAttribute("question",map.get("question"));
		model.addAttribute("questionFile",map.get("questionFile"));
		model.addAttribute("userInfo",map.get("userInfo"));
		
	}
	
	@RequestMapping("/admin/questionFileDownload")
	public String questionFileDown(
			
			QuestionFile questionFile
			, Model model
			
			) {
		logger.info("/admin/questionFileDown [GET] {}",questionFile);
		
		//첨부파일 정보 조회
		questionFile = adminService.getQuestionFile( questionFile );
		logger.info("getEventFile : {}",questionFile);

		model.addAttribute("questionFile", questionFile);
		
		return "adminDown";
	}
	
	@PostMapping("/admin/userQuestionView")
	public String userQuestionViewPost(
			
			Question question
			
			) {
		logger.info("/admin/userQuestionView [POST]");
		logger.info("question : {}", question);
		
		adminService.writeAnswer(question);
		
		return "redirect:/admin/userQuestionView?questionNo="+question.getQuestionNo();
		
	}
	
	@GetMapping("/admin/userFreePostView")
	public void userFreePostViewGet(
			
			FreeBoard freeBoard
			, Map<String,Object> map
			, Model model
			
			) {
		logger.info("/admin/userFreePostViewGet [GET]");
		logger.info("FreeBoard : {}", freeBoard);
		
		map = adminService.viewFreePost(freeBoard);
		logger.info("viewFreePost : {}", map);
		
		model.addAttribute("freeBoard",map.get("freeBoard"));
		model.addAttribute("freeBoardFiles",map.get("freeBoardFiles"));
		model.addAttribute("userInfo",map.get("userInfo"));
		
	}
	
	@GetMapping("/admin/userFreePostUpdate")
	public void userFreePostUpdateGet(
			
			FreeBoard freeBoard
			, Map<String,Object> map
			, Model model
			
			) {
		logger.info("/admin/userFreePostViewGet [GET]");
		logger.info("FreeBoard : {}", freeBoard);
		
		map = adminService.viewFreePost(freeBoard);
		logger.info("viewFreePost : {}", map);
		
		model.addAttribute("freeBoard",map.get("freeBoard"));
		model.addAttribute("freeBoardFiles",map.get("freeBoardFiles"));
		model.addAttribute("userInfo",map.get("userInfo"));
		
	}
	
	@PostMapping("/admin/userFreePostUpdate")
	public String userFreePostUpdatePost(
			
			FreeBoard freeBoard
			, MultipartFile file
			, int[] delFileno
			, List<MultipartFile> freeFile
			
			
			) {
		logger.info("/admin/userFreePostViewPOST [POST]");
		logger.info("freeBoard : {}", freeBoard);
		logger.info("getFreeContent() {}",freeBoard.getFreeContent());
		logger.info("delFileno {}", Arrays.toString(delFileno));
		
		adminService.freePostUpdate(freeBoard, file, delFileno, freeFile);
		
		return "redirect:/admin/userFreePostView?freeNo="+freeBoard.getFreeNo();
		
	}
	
	@PostMapping("/admin/userFreePostDelete")
	public String userFreePostDelPost(
			
			FreeBoard freeBoard
			, Model model
			
			) {
		logger.info("/admin/eventDelete [Post] {}", freeBoard.getFreeNo());
		
		adminService.freePostDel(freeBoard);
		
		return "redirect:/admin/userPostList?userNo="+freeBoard.getUserNo();
	}
	
	//==========================================================================================
	//--- 강사 심사 관리 ---
	
	@GetMapping("/admin/teacherApply")
	public void teacherApplyGet(
			
			Paging paging
			, Model model
			, HttpServletRequest request
			, Map<String,Object> map
			
			){
		logger.info("/admin/teacherApply [GET]");
		
		int passCheckbox = 0; 
		logger.info("passCheckbox디폴트 : {}", passCheckbox);
		if(request.getParameter("passCheckbox") != null) {
			if(Integer.parseInt((request.getParameter("passCheckbox")))==1) {
				passCheckbox = 1;
			}
		}
		logger.info("delCheckbox확인 : {}", passCheckbox);
		
		paging = adminService.getApplyPaging(paging, passCheckbox);
		logger.info("paging : {}", paging);
		
		
		map = adminService.selectTeacherApplyList(paging, passCheckbox);
		logger.info("selectTeacherApplyList : {}", map);
		
		model.addAttribute("paging",paging);
		model.addAttribute("map",map);
		model.addAttribute("passCheckbox", passCheckbox);
		
	}
	
	@GetMapping("/admin/teacherApplyView")
	public void teacherApplyViewGet(
			
			TeacherApply teacherApply
			, Model model
			
			){
		logger.info("/admin/teacherApplyView [GET]");
		logger.info("teacherApply : {}", teacherApply.getTeacherNo() );
		
		Map<String,Object> map = adminService.selectTeacherApply(teacherApply);
		logger.info("map : {}", map );

		model.addAttribute("teacher",map.get("teacher"));
		model.addAttribute("teacherApply",map.get("teacherApply"));
		model.addAttribute("userInfo",map.get("userInfo"));
		model.addAttribute("teacherLicence",map.get("teacherLicence"));
		
	}
	
	@PostMapping("/admin/teacherApplyView")
	public String teacherApplyViewPost(
			
			TeacherApply teacherApply
			
			){
		logger.info("/admin/teacherApplyView [GET]");
		logger.info("getTeacherNo : {}", teacherApply.getTeacherNo() );
		logger.info("getPassOrNot : {}", teacherApply.getPassOrNot() );
		
		adminService.teacherPassOrFAil(teacherApply);
		
		return "redirect:/admin/teacherApply";
		
	}
	
	@RequestMapping("/admin/licenceFileDownload")
	public String licenceFileDown(
			
			TeacherLicence teacherLicence
			, Model model
			
			) {
		logger.info("/admin/questionFileDown [GET] {}",teacherLicence);
		
		//첨부파일 정보 조회
		teacherLicence = adminService.getTeacherLicenceFile( teacherLicence );
		logger.info("getTeacherLicenceFile : {}",teacherLicence);

		model.addAttribute("teacherLicence", teacherLicence);
		
		return "adminDown";
	}
	
	
	//==========================================================================================
	//--- 클래스 관리 ---
	
	@GetMapping("/admin/classList")
	public void classListGet(
			
			Paging paging
			, Model model
			, HttpServletRequest request
			
			){
	logger.info("/admin/classListGet [GET]");
	
	int sort = 0; 
	logger.info("sort디폴트 : {}", sort);

	if(request.getParameter("sort") != null) {
		for(int i=0; i<Integer.parseInt((request.getParameter("sort")))+1; i++) {
			sort = i;
		}
	}
	logger.info("sort확인 : {}", sort);
	
	int delCheckbox = 0; 
	logger.info("delCheckbox디폴트 : {}", delCheckbox);
	if(request.getParameter("delCheckbox") != null) {
		if(Integer.parseInt((request.getParameter("delCheckbox")))==1) {
			delCheckbox = 1;
		}
	}
	logger.info("delCheckbox확인 : {}", delCheckbox);
	
	// 페이징 계산
	paging = adminService.getClassPaging(paging, sort, delCheckbox);
	logger.info("paging : {}", paging);
	
	List<Class> classList = adminService.getClassList(paging, sort, delCheckbox);
	logger.info("getClassList : {}", classList);

	
	model.addAttribute("sort",sort);
	model.addAttribute("delCheckbox",delCheckbox);
	model.addAttribute("paging",paging);
	model.addAttribute("classList",classList);
	
	}
	
	@GetMapping("/admin/classInfo")
	public void classInfoGet() {
		logger.info("/admin/classInfo [GET]");
		
		
	}
	
	
	//==========================================================================================
	//--- 게시판 관리 ---
	
	@GetMapping("/admin/board")
	public void board(
			
			Paging paging
			, Model model
			, HttpServletRequest request
			
			) {
		logger.info("/admin/board [GET]");
		
		int sort = 0; 
		logger.info("sort디폴트 : {}", sort);
		
		if(request.getParameter("sort") != null) {
			for(int i=0; i<Integer.parseInt((request.getParameter("sort")))+1; i++) {
				sort = i;
			}
		}
		logger.info("sort확인 : {}", sort);
		
		int delCheckbox = 0; 
		logger.info("delCheckbox디폴트 : {}", delCheckbox);
		
		if(request.getParameter("delCheckbox") != null) {
			if(Integer.parseInt((request.getParameter("delCheckbox")))==1) {
				delCheckbox = 1;
			}
			logger.info("delCheckbox확인 : {}", delCheckbox);
		}
		
		// 페이징 계산
		Map<String, Object> pagingMap = adminService.getBoardPaging(paging, delCheckbox);
		logger.info("pagingMap : {}", pagingMap);
		
		Map<String, Object> result = adminService.boardList(pagingMap, delCheckbox);
		
		if(sort != 0) {
			model.addAttribute("eventBoardList",result.get("eventBoardList"));
			model.addAttribute("paging",pagingMap.get("eventPaging"));
			
		}else {
			model.addAttribute("announceBoardList",result.get("announceBoardList"));
			model.addAttribute("paging",pagingMap.get("announcePaging"));
			
		}
		
		model.addAttribute("delCheckbox", delCheckbox);
		model.addAttribute("sort",sort);
		
	}
	
	@GetMapping("/admin/announceView")
	public void announceViewGet(
			
			AnnounceBoard announceBoard
			, Model model
			
			) {
		logger.info("/admin/announceView [GET] {}", announceBoard.getAnnounceNo());
		
		Map<String, Object> map = adminService.getAnnounceView(announceBoard);
		
		model.addAttribute("announceBoard", map.get("announceBoard"));
		model.addAttribute("announceBoardFile", map.get("announceBoardFile"));
	}
	
	@GetMapping("/admin/setAnnounceExist")
	public String setAnnounceExistGet(
			
			AnnounceBoard announceBoard
			
			) {
		logger.info("/admin/setAnnounceExist [GET] {}",announceBoard.getAnnounceNo());
		
		adminService.setAnnoExist(announceBoard);

		
		return "redirect:/admin/board";
	}
	
	@GetMapping("/admin/writeEventAnno")
	public void writeEventAnnoGet() {
		logger.info("/admin/writeEventAnno [GET] {}");
	}
	
	@PostMapping("/admin/writeEventAnno")
	public String writeEventAnnoPost(
			
			String postName
			, String content
			, MultipartFile file
			, int sort
			, List<MultipartFile> announceFile
			, List<MultipartFile> eventFile
			
			) {
		logger.info("/admin/writeEventAnno [POST] {}");
		logger.info("postName : {}", postName);
		logger.info("content : {}", content);
		logger.info("file : {}", file);
		logger.info("sort : {}", sort);
		
		adminService.writeEvenAnno(postName, content, file, sort, announceFile, eventFile);
		
		return "redirect:/admin/board";
	}

	@GetMapping("/admin/eventView")
	public void eventViewGet(
			
			EventBoard eventBoard
			, Model model
			
			) {
		logger.info("/admin/announceView [GET] {}", eventBoard.getEventNo());
		
		Map<String, Object> map = adminService.getEventView(eventBoard);
		
		model.addAttribute("eventBoard", map.get("eventBoard"));
		model.addAttribute("eventBoardFile", map.get("eventBoardFile"));
		
	}
	
	@GetMapping("/admin/setEventExist")
	public String setEventExistGet(
			
			EventBoard eventBoard
			
			) {
		logger.info("/admin/setEventExist [GET] {}",eventBoard.getEventNo());
		
		adminService.setEventExist(eventBoard);
		
		return "redirect:/admin/board";
	}
	
	@GetMapping("/admin/eventUpdate")
	public void eventUpdateGet(
			
			EventBoard eventBoard
			, Model model
			
			) {
		logger.info("/admin/eventUpdate [GET] {}", eventBoard.getEventNo());
		
		Map<String, Object> map = adminService.getEventView(eventBoard);
		
		model.addAttribute("eventBoard", map.get("eventBoard"));
		model.addAttribute("eventBoardFile", map.get("eventBoardFile"));
		
		
	}
	
	@PostMapping("/admin/eventUpdate")
	public String eventUpdatePost(
			
			EventBoard eventBoard
			, MultipartFile file
			, int[] delFileno
			, List<MultipartFile> eventFile
			
			) {
		logger.info("/admin/eventUpdate [POST] {}",eventBoard.getEventNo());
		logger.info("getEventContent {}",eventBoard.getEventContent());
		logger.info("delFileno {}", Arrays.toString(delFileno));
		
		adminService.eventUpdate(eventBoard, file, delFileno, eventFile);
		
		return "redirect:/admin/eventView?eventNo="+eventBoard.getEventNo();
	}
	
	@GetMapping("/admin/announceUpdate")
	public void announceUpdateGet(
			
			AnnounceBoard announceBoard
			, Model model
			
			) {
		logger.info("/admin/announceUpdate [GET] {}", announceBoard.getAnnounceNo());
		
		Map<String, Object> map = adminService.getAnnounceView(announceBoard);
		
		model.addAttribute("announceBoard", map.get("announceBoard"));
		model.addAttribute("announceBoardFile", map.get("announceBoardFile"));
		
		
	}
	
	@PostMapping("/admin/announceUpdate")
	public String announceUpdatePost(
			
			AnnounceBoard announceBoard
			, int[] delFileno
			, List<MultipartFile> announceFile
			
			) {
		logger.info("/admin/eventUpdate [POST] {}",announceBoard.getAnnounceNo());
		logger.info("getEventContent {}",announceBoard.getAnnounceContent());
		logger.info("delFileno {}", Arrays.toString(delFileno));
		
		adminService.announceUpdate(announceBoard, delFileno, announceFile);
		
		return "redirect:/admin/announceView?announceNo="+announceBoard.getAnnounceNo();
	}
	
	@RequestMapping("/admin/annoFileDownload")
	public String announceFileDown(
			
			AnnounceBoardFile announceBoardFile
			, Model model
			
			) {
		logger.info("/admin/announceFileDown [GET] {}",announceBoardFile);
		
		//첨부파일 정보 조회
		announceBoardFile = adminService.getAnnounceFile( announceBoardFile );
		logger.info("getAnnounceFile : {}",announceBoardFile);

		model.addAttribute("announceBoardFile", announceBoardFile);
		
		return "adminDown";
	}
	
	@RequestMapping("/admin/eventFileDownload")
	public String eventFileDown(
			
			EventBoardFile eventBoardFile
			, Model model
			
			) {
		logger.info("/admin/eventFileDown [GET] {}",eventBoardFile);
		
		//첨부파일 정보 조회
		eventBoardFile = adminService.getEventFile( eventBoardFile );
		logger.info("getEventFile : {}",eventBoardFile);

		model.addAttribute("eventBoardFile", eventBoardFile);
		
		return "adminDown";
	}
	
	@RequestMapping("/admin/eventHeadImgDownload")
	public String eventHeadImgDown(
			
			EventBoard eventBoard
			, Model model
			
			) {
		logger.info("/admin/eventHeadImgDown [GET] {}",eventBoard.getEventNo());
		
		//첨부파일 정보 조회
		eventBoard = adminService.getEventHeadImg( eventBoard );
		logger.info("getEventFile : {}",eventBoard);

		model.addAttribute("eventBoard", eventBoard);
		
		return "adminDown";
	}
	
	@PostMapping("/admin/announceDelete")
	public String announceDeleteGet(
			
			AnnounceBoard announceBoard
			, Model model
			
			) {
		logger.info("/admin/announceDelete [Post] {}", announceBoard.getAnnounceNo());
		
		adminService.announceDelete(announceBoard);
		
		return "redirect:/admin/board";
	}
	
	@PostMapping("/admin/eventDelete")
	public String eventDeleteGet(
			
			EventBoard eventBoard
			, Model model
			
			) {
		logger.info("/admin/eventDelete [Post] {}", eventBoard.getEventNo());
		
		adminService.eventDelete(eventBoard);
		
		return "redirect:/admin/board";
	}
	
	//==========================================================================================
	//--- 게시판 관리 > 자유게시판 ---
	
	@GetMapping("/admin/freeBoardList")
	public void freeBoardListGet(
			
			Paging paging
			, Map<String, Object> map
			, Model model
			, HttpServletRequest request
			
			) {
		logger.info("/admin/freeBoardList [GET] {}");
		
		int sort = 0; 
		logger.info("sort디폴트 : {}", sort);
		
		if(request.getParameter("sort") != null) {
			for(int i=0; i<Integer.parseInt((request.getParameter("sort")))+1; i++) {
				sort = i;
			}
		}
		logger.info("sort확인 : {}", sort);
		
		// 페이징 계산
		paging = adminService.getFreeBoardPaging(paging);
		logger.info("paging : {}", paging);
		
		map = adminService.freeBoardList(paging, sort);
		
		model.addAttribute("sort",sort);
		model.addAttribute("paging",paging);
		model.addAttribute("freeBoardList",map.get("freeBoardList"));
		
	}
	
	@PostMapping("/admin/freeBoardList")
	public String freeBoardListPost(
			
			@RequestParam("freePostNo") int[] freePostNo
			
			) {
		logger.info("/admin/freeBoardList [POST] {}",freePostNo);
		
		adminService.deleteChecked(freePostNo);
		
		return "redirect:/admin/freeBoardList";
	}
	
	@GetMapping("/admin/freeBoardView")
	public void freeBoardViewGet(
			
			FreeBoard freeBoard
			, Paging paging
			, Map<String,Object> map
			, Model model
			
			) {
		logger.info("/admin/freeBoardView [GET]");
		logger.info("FreeBoard : {}", freeBoard);
		
		map = adminService.freeBoardView(freeBoard, paging);
		logger.info("viewFreePost : {}", map);
		
		model.addAttribute("freeBoard",map.get("freeBoard"));
		model.addAttribute("freeBoardFiles",map.get("freeBoardFiles"));
		model.addAttribute("userInfo",map.get("userInfo"));
		model.addAttribute("paging",map.get("paging"));
		model.addAttribute("freeComment",map.get("freeComment"));
		model.addAttribute("userNameList",map.get("userNameList"));
		
	}
}
