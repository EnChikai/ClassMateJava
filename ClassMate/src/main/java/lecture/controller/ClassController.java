package lecture.controller;

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

import lecture.service.face.ClassService;
import user.dto.UserInfo;
import lecture.dto.Class;
import lecture.dto.QuestionAnswer;

@Controller
@RequestMapping("/class")
public class ClassController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired ClassService classService;
	
	@GetMapping("/onClass")
	public void onClassLecture(Class viewClass, Model model, Map<String, Object> map, HttpSession session) {
		logger.info("/class/onClass");
		int userNo = (int)session.getAttribute("userNo");
		
		UserInfo userInfo = new UserInfo();
		userInfo.setUserNo(userNo);
		
		//넘어오는값 임의 지정
		Class a = new Class();
		a.setClassNo(2);
		map = classService.lectureOn(a);
//		map = classService.lectureOn(viewClass);
		
		logger.info("map :{}",map);
		
		model.addAttribute("lecture", map.get("lecture"));
		model.addAttribute("classVideo", map.get("classVideo"));
		model.addAttribute("questionAnswer", map.get("questionAnswer"));
	}
	
	@GetMapping("/myOnClassList")
	public void myOnClassList(Model model, HttpSession session) {
		logger.info("/class/myOnClassList");
		logger.info("session : {}", session.getAttribute("userNo"));
		int userNo = (int)session.getAttribute("userNo");
		UserInfo userInfo = new UserInfo();
		userInfo.setUserNo(userNo);
		
		List<Class> lecture = classService.allLecture(userInfo);
		
		logger.info("lecture : {}", lecture);
		
		model.addAttribute("lecture", lecture);
		
	}
	
	@GetMapping("/onClassVideo")
	public void onClassVideo(Model model) {
		
	}
	
	@GetMapping("/offClass")
	public void offClass(Class viewClass, Model model, Map<String, Object> map, HttpSession session) {
		logger.info("/class/offClass");
		
		int userNo = (int)session.getAttribute("userNo");
		UserInfo userInfo = new UserInfo();
		userInfo.setUserNo(userNo);
		
		//넘어오는값 임의 지정
		Class a = new Class();
		a.setClassNo(2);
		map = classService.lectureOff(a);
		
//		map = classService.lectureOff(viewClass);
		logger.info("map : {}", map);
		model.addAttribute("address", map.get("address"));
		model.addAttribute("lecture", map.get("lecture"));
		
	}
	
	@GetMapping("/onClassQABoardList")
	public void onClassQABoardList(Class viewClass, Model model, HttpSession session) {
		logger.info("/class/onClassQABoardList");
		
		int userNo = (int)session.getAttribute("userNo");
		UserInfo userInfo = new UserInfo();
		userInfo.setUserNo(userNo);
		
		//넘어오는값 임의 지정
		Class a = new Class();
		a.setClassNo(2);
		
		model.addAttribute("questionAnswer", classService.allQABoardList(a));
	}
	
	@GetMapping("/onClassQAWrite")
	public void onClassQAWrite(Class viewClass, Model model, HttpSession session) {
		logger.info("/class/onClassQAWrite");
		
		int userNo = (int)session.getAttribute("userNo");
		UserInfo userInfo = new UserInfo();
		userInfo.setUserNo(userNo);
		
		//넘어오는값 임의 지정
		Class a = new Class();
		a.setClassNo(2);
		
		model.addAttribute("lecture", classService.myLectureOn(userInfo));
		
	}
	
	@PostMapping("/onClassQAWrite")
	public String onClassQAWritePost(QuestionAnswer questionAnswer, Model model, HttpSession session) {
		logger.info("/class/onClassQAWrite");
		
		logger.info("questionTitle : {}", questionAnswer);
		
		return "redirect: /class/onClassQABoardList";
	}
	
	
}
