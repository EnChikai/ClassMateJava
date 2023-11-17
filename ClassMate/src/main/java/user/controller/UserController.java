package user.controller;

import java.util.HashMap;
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

import teacher.dto.Teacher;
import user.dto.UserInfo;
import user.service.face.UserService;
@Controller
@RequestMapping("/user")
public class UserController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired UserService userService;
	
	@GetMapping("/mypageMain")
	public void mypageMain() {}
	
	@GetMapping("/searchIdPw")
	public void searchIdPw() {}
	
	@PostMapping("/searchIdPw")
	public String searchIdPwPost(@RequestParam("email") String email, @RequestParam("name") String name, Model model) {
	    // 이메일과 이름을 이용하여 아이디 찾기 로직을 수행
	    UserInfo foundUserInfo = userService.findIdByEmailAndName(email, name);

	    if (foundUserInfo != null) {
	        model.addAttribute("foundUserInfo", foundUserInfo);
	    } else {
	        model.addAttribute("notFound", true);
	    }

	    return "user/searchUserId"; // 결과를 보여줄 페이지로 이동
	}
	
	@GetMapping("/resetPw")
	public void resetPw() {}

	@GetMapping("/updatePw")
	public void updatePw() {}
	
	@GetMapping("/updateUserData")
	public void updateUserData(HttpSession session, Model model) {
		logger.info("{}",session.getAttribute("userNo"));
		UserInfo userInfo = new UserInfo();
		userInfo.setUserNo((int)session.getAttribute("userNo"));
		userInfo = userService.updateUserData(userInfo);
		logger.info("{}",userInfo);
		model.addAttribute("userInfo", userInfo);
	}
	
	@PostMapping("/updateUserData")
	public void updateUserDataPost() {
		
	}
	
	@PostMapping("/updateUserDataOut")
	public void updateUserDataOut(HttpSession session, Model model) {
		logger.info("성공? 실패?");
		UserInfo userInfo = new UserInfo();
		logger.info("userNo : {}", session.getAttribute("userNo"));
		userInfo.setUserNo((int)session.getAttribute("userNo"));
	    int data = userService.updateOutUser(userInfo);
	    logger.info("탈퇴 처리 결과: {}", data);

	    if (data == 1) {
	    	model.addAttribute("success", true);
	    } else {
	    	model.addAttribute("success", false);
		}
	}
	
	@GetMapping("/searchUserId")
	public void searchUserId() {}
	
	@GetMapping("/join")
	public void join() {}
	
	@GetMapping("/joinOk")
	public String joinOk() {
		return "user/joinOk";
	}
	
	@PostMapping("/join")
	public String joinPost(UserInfo userInfo) {
		logger.info("param : {}", userInfo);
		
		userService.join( userInfo );
		
		return "redirect:./joinOk";
	}
	
	@GetMapping("/login")
	public void login() {
//		logger.info("test");
	}
	
	@PostMapping("/login")
	public String loginPost( UserInfo userInfo, Model model, HttpSession session, Teacher teacher ) {
//		logger.info("param : {}", userInfo);
		
		UserInfo loginInfo = userService.loginPost( userInfo );
		logger.info("loginInfo : {}", loginInfo);
		
	    // 강사 번호
	    if (loginInfo != null) {
	        teacher.setUserNo(loginInfo.getUserNo()); // 강사 번호
	        Teacher teacherNo = userService.getTeacherNo(teacher); // 강사 번호

	        if(teacherNo != null) {
	        	session.setAttribute("teacherNo", teacherNo.getTeacherNo()); // 강사 번호
	        }
	        
	        // 일반회원 로그인
	        if (loginInfo.getUserNo() != 0) {
	            boolean isLogin = true;
	            session.setAttribute("isLogin", isLogin);
	            session.setAttribute("userId", loginInfo.getUserId());
	            session.setAttribute("userNo", loginInfo.getUserNo());

	        } else if (loginInfo.getUserNo() == 0) { // 관리자 로그인
	            boolean isLogin = true;
	            session.setAttribute("isLogin", isLogin);
	            session.setAttribute("admin", "ADMIN");
	            session.setAttribute("userId", loginInfo.getUserId());

	            return "redirect:/admin/main";
	        }
	    } else { // 로그인 실패
	        session.invalidate();
	     
	        return "redirect:/user/login";
	    }
		return "redirect:/main/main";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main/main";
	}
	
    @PostMapping("/checkDuplicateId")
    @ResponseBody
    public Map<String, Object> checkDuplicateId(@RequestParam("userId") String userId) {
        Map<String, Object> result = new HashMap<>();
        
        boolean isDuplicate = userService.checkDuplicateId(userId);
        
        result.put("duplicate", isDuplicate);
        return result;
    }
}