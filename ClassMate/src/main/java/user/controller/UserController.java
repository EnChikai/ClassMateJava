package user.controller;

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

import lecture.dto.Class;
import lecture.service.face.ClassService;
import teacher.dto.Teacher;
import user.dto.UserInfo;
import user.service.face.UserService;
@Controller
@RequestMapping("/user")
public class UserController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired UserService userService;
	@Autowired ClassService classService;
	
	@GetMapping("/mypageMain")
	public void myOnClassList(Model model, HttpSession session) {
		logger.info("/class/myOnClassList");
//		logger.info("session : {}", session.getAttribute("userNo"));
		int userNo = (int)session.getAttribute("userNo");
		UserInfo userInfo = new UserInfo();
		userInfo.setUserNo(userNo);
		
		List<Class> lecture = classService.allLecture(userInfo);
//		logger.info("class : {}", lecture);
		model.addAttribute("lecture", lecture);
	}
	
	@GetMapping("/searchIdPw")
	public void searchIdPw() {}
	
	@PostMapping("/searchIdPw")
	public void searchIdPwPost() {

	}
	
	@GetMapping("/resetPw")
	public void resetPw() {}
	
	@GetMapping("/resetPwChk")
	public void resetPwGet() {}

	@GetMapping("/updatePw")
	public void updatePw() {}
	
	@GetMapping("/updateUserData")
	public void updateUserData(HttpSession session, Model model) {
		logger.info("{}",session.getAttribute("userNo"));
		UserInfo userInfo = new UserInfo();
		userInfo.setUserNo((int)session.getAttribute("userNo"));
		userInfo = userService.updateInfo(userInfo);
		logger.info("{}",userInfo);
		model.addAttribute("userInfo", userInfo);
	}
	
	@ResponseBody
	@PostMapping("/updateUserData")
	public Map<String, Object> updateUserDataPost(HttpSession session, UserInfo updatedUserInfo) {
	    Map<String, Object> response = new HashMap<>();
	    //	    logger.info("param : {}", updatedUserInfo);
		
	    updatedUserInfo.setUserNo((int)session.getAttribute("userNo"));
	    
	    UserInfo existingUserInfo = new UserInfo();
	    existingUserInfo.setUserNo((int)session.getAttribute("userNo"));
	    existingUserInfo = userService.updateInfo(existingUserInfo);
	    
	    
	    
	    // 각 필드를 체크하여 값이 null이면 기존 데이터의 값을 사용한다
	    if (updatedUserInfo.getUserId() == null) {
	        updatedUserInfo.setUserId(existingUserInfo.getUserId());
	    }
	    if (updatedUserInfo.getUserPw() == null) {
	    	updatedUserInfo.setUserPw(existingUserInfo.getUserPw());
	    }
	    if (updatedUserInfo.getUserGender() == null) {
	    	updatedUserInfo.setUserGender(existingUserInfo.getUserGender());
	    }
	    if (updatedUserInfo.getUserBirthday() == null) {
	    	updatedUserInfo.setUserBirthday(existingUserInfo.getUserBirthday());
	    }
	    if (updatedUserInfo.getUserPhone() == null) {
	    	updatedUserInfo.setUserPhone(existingUserInfo.getUserPhone());
	    }
	    if (updatedUserInfo.getUserName() == null) {
	    	updatedUserInfo.setUserName(existingUserInfo.getUserName());
	    }
	    if (updatedUserInfo.getUserEmail() == null) {
	    	updatedUserInfo.setUserEmail(existingUserInfo.getUserEmail());
	    }
	    if (updatedUserInfo.getMainAddress() == null) {
	    	updatedUserInfo.setMainAddress(existingUserInfo.getMainAddress());
	    }
	    if (updatedUserInfo.getSubAddress() == null) {
	    	updatedUserInfo.setSubAddress(existingUserInfo.getSubAddress());
	    }
	    if (updatedUserInfo.getUserPost() == 0) {
	    	updatedUserInfo.setUserPost(existingUserInfo.getUserPost());
	    }
	    if (updatedUserInfo.getUserSecession() == 0) {
	    	updatedUserInfo.setUserSecession(existingUserInfo.getUserSecession());
	    }
	    
	    logger.info("updatedUserInfo : {}", updatedUserInfo);
	    logger.info("existingUserInfo : {}", existingUserInfo);
	    int result = userService.updateUserData(updatedUserInfo);
	    
	    // 회원 정보 업데이트 성공 여부에 따라 1 또는 0을 설정
	    int updateResult = userService.updateUserData(updatedUserInfo);
	    response.put("success", updateResult == 1);
	    return response;
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