package user.controller;

import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import user.dto.UserInfo;
import user.service.face.UserService;
@Controller
@RequestMapping("/user")
public class UserController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired UserService userService;
	
	@RequestMapping("/main")
	public void main() {}
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String joinPost(UserInfo userInfo) {
		logger.info("param : {}", userInfo);
		
		userService.join( userInfo );
		
		return "redirect:./main";
	}
	
	@GetMapping("/login")
	public void login() {
		logger.info("test");
	}
	
	@PostMapping("/login")
	public String loginPost( UserInfo userInfo, Model model, HttpSession session ) {
		logger.info("param : {}", userInfo);
		
		UserInfo loginInfo = userService.loginPost( userInfo );
		logger.info("loginInfo : {}", loginInfo);
		
		if( loginInfo != null ) {
			//일반회원 로그인
			if( loginInfo.getUserNo() != 0 ) {
				boolean isLogin = true;
				session.setAttribute("isLogin", isLogin);
				session.setAttribute("userId", loginInfo.getUserId());
				
			} else if( loginInfo.getUserNo() == 0 ) { //관리자 로그인
				boolean isLogin = true;
				session.setAttribute("isLogin", isLogin);
				session.setAttribute("ADMIN", "ADMIN");
				session.setAttribute("userId", loginInfo.getUserId());
			}
			
		} else { //로그인 실패
			session.invalidate();
		}
		
		return "redirect:./main";
	}
	
	@GetMapping("/findUser")
    public String findUserByUsername(Model model, @RequestParam String username) {
        User user = userService.findUserByUsername(username);
        model.addAttribute("user", user);
        return "userProfile"; // userProfile.html 템플릿을 렌더링
    }
	
}
