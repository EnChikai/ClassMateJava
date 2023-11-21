package admin.controller;

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

import admin.service.face.AdminService;
import board.dto.AnnounceBoard;
import user.dto.UserInfo;
import web.util.Paging;

@Controller
public class AdminController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private AdminService adminService;
	
	@GetMapping("/admin/main")
	public void adminMainPageGet() {
		logger.info("/admin/main [GET]");
		
		//제작중
		
		
	}
	
	@PostMapping("/admin/main")
	public String adminMainPagePost(HttpSession session) {
		logger.info("/admin/main [Post]");
		
		session.invalidate();
		
		return "redirect:/main/main";
	}
	
	//--------------------------------------------------------------------------

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
			logger.info("delCheckbox확인 : {}", delCheckbox);
		}
		
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
		
		int result = adminService.userInfoUpdate(userdata);
		logger.info("result : {}", result);
		
		return "redirect:/admin/userDetailedInfo?userNo="+userdata.getUserNo();
		
	}
	
	@GetMapping("/admin/secessionUser")
	public String secessionUserGet(
			
			UserInfo userdata
			
			) {
		logger.info("/admin/secessionUser [GET] {}", userdata.getUserNo());

		int result = adminService.secessionUser(userdata);
		logger.info("result {}", result);
		
		return "redirect:/admin/userList";
	}
	
	//--------------------------------------------------------------------------
	
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
		
		// 페이징 계산
		Map<String, Object> pagingMap = adminService.getBoardPaging(paging);
		logger.info("pagingMap : {}", pagingMap);
		
		Map<String, Object> result = adminService.boardList(pagingMap);
		
		if(sort != 0) {
			model.addAttribute("eventBoardList",result.get("eventBoardList"));
			model.addAttribute("paging",pagingMap.get("announcePaging"));
			
		}else {
			model.addAttribute("announceBoardList",result.get("announceBoardList"));
			model.addAttribute("paging",pagingMap.get("eventPaging"));
			
		}
		
		model.addAttribute("sort",sort);
		
	}
	
	@GetMapping("/admin/announceView")
	public void announceViewGet(
			
			AnnounceBoard announceBoard
			, Model model
			
			) {
		logger.info("/admin/announceView [GET] {}", announceBoard.getAnnounceNo());
		
		announceBoard = adminService.getAnnounceView(announceBoard);
		
		model.addAttribute("announceBoard", announceBoard);
		
	}
	
	@GetMapping("/admin/writeEventAnno")
	public void writeEventAnnoGet(
			
			AnnounceBoard announceBoard
			
			) {
		logger.info("/admin/writeEventAnno [GET] {}");
		
		
		
		
	}
	
	
}
