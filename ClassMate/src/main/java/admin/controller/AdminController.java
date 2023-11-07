package admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import admin.service.face.AdminService;
import user.dto.UserInfo;
import web.util.Paging;

@Controller
public class AdminController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService adminService;
	
	@GetMapping("/admin/main")
	public void adminMainPageGet() {
		logger.info("/admin/main [GET]");
		
		//제작중
		
		
	}
	
	@GetMapping("/admin/userList")
	public void userInfoListGet(
			
			Paging paging
			, Model model
			
			) {
		
		
		// 페이징 계산
		paging = adminService.getUserPaging(paging);
		logger.info("paging : {}", paging);
				
		List<UserInfo> list = adminService.userInfoList(paging);
		logger.info("list : {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
	}
}
