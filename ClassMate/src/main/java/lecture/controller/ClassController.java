package lecture.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lecture.service.face.ClassService;
import user.dto.UserInfo;
import lecture.dto.Class;

@Controller
@RequestMapping("/class")
public class ClassController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired ClassService classService;
	
	@GetMapping("/onClassLecture")
	public void onClassLecture(Model model) {
		logger.info("/class/onClassLecture");

		
	}
	
	@GetMapping("/myOnClassList")
	public void myOnClassList(Model model, HttpSession session) {
		logger.info("/class/myOnClassList");
		
		String userId = (String)session.getAttribute("userId");
		UserInfo userInfo = new UserInfo();
		userInfo.setUserId(userId);
		
		List<Class> lecture = classService.classList(userInfo);
		
		model.addAttribute("lecture", lecture);
		
	}
	
	@GetMapping("/onClassVideo")
	public void onClassVideo(Model model) {
		
	}
	
	@GetMapping("/offClass")
	public void offClass(Model model) {
		
	}
	
	@GetMapping("/onClassQABoardList")
	public void onClassQABoardList(Model model) {
		
	}
	
	@GetMapping("/onClassQAWrite")
	public void onClassQAWrite(Model model) {
		
	}
	
}
