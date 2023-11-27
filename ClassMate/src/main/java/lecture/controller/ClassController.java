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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lecture.service.face.ClassService;
import oracle.net.aso.c;
import user.dto.UserInfo;
import lecture.dto.Class;
import lecture.dto.ClassVideo;
import lecture.dto.QuestionAnswer;

@Controller
@RequestMapping("/class")
public class ClassController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired ClassService classService;
	
	@GetMapping("/onClass")
	public void onClassLecture(
			Class viewClass
			, Model model
			, Map<String, Object> map
			, HttpSession session) {
		logger.info("/class/onClass");
		
		UserInfo userInfo = classService.userCk(session);
		
		map = classService.lectureOn(viewClass);
		
		logger.info("map :{}",map);
		
		model.addAttribute("lecture", map.get("lecture"));
		model.addAttribute("classVideo", map.get("classVideo"));
		model.addAttribute("questionAnswer", map.get("questionAnswer"));
	}
	
	@GetMapping("/myOnClassList")
	public void myOnClassList(
			Model model
			, HttpSession session) {
		logger.info("/class/myOnClassList");
		UserInfo userInfo = classService.userCk(session);
		
		List<Class> lecture = classService.allLecture(userInfo);
		
		model.addAttribute("lecture", lecture);
	}
	
	@GetMapping("/onClassVideo")
	public void onClassVideo(ClassVideo classVideo, Model model, HttpSession session) {
		logger.info("/onClassVideo");
		
		UserInfo userInfo = classService.userCk(session);
		
		classVideo = classService.video(classVideo);
		
		logger.info("classVideo : {}", classVideo);
		
		model.addAttribute("classVideo", classVideo);
	}
	
	@GetMapping("/offClass")
	public void offClass(
			Class viewClass
			, Model model
			, Map<String, Object> map
			, HttpSession session) {
		logger.info("/class/offClass");
		
		UserInfo userInfo = classService.userCk(session);
		
		map = classService.lectureOff(viewClass);
		
		logger.info("map : {}", map);
		model.addAttribute("address", map.get("address"));
		model.addAttribute("lecture", map.get("lecture"));
		
	}
	
	@GetMapping("/onClassQABoardList")
	public void onClassQABoardList(
			Class viewClass
			, Model model
			, HttpSession session) {
		logger.info("/class/onClassQABoardList");
		
		UserInfo userInfo = classService.userCk(session);
		
		logger.info("viewClass : {}",viewClass);
		
		model.addAttribute("classNo",viewClass.getClassNo());
		model.addAttribute("questionAnswer", classService.allQABoardList(viewClass));
	}
	
	@GetMapping("/onClassQAWrite")
	public void onClassQAWrite(
			Class viewClass
			, Model model
			, HttpSession session) {
		logger.info("/class/onClassQAWrite");
		
		UserInfo userInfo = classService.userCk(session);
		
		logger.info("viewClass : {}",viewClass);
		
		model.addAttribute("selectedClassNo", viewClass.getClassNo());
		model.addAttribute("lecture", classService.myLectureOn(userInfo));
		
	}
	
	@PostMapping("/onClassQAWrite")
	public String onClassQAWritePost(
			QuestionAnswer questionAnswer
			, Model model
			, HttpSession session) {
		logger.info("/class/onClassQAWrite");
		
		logger.info("questionTitle : {}", questionAnswer);
		
		questionAnswer.setUserNo((int)session.getAttribute("userNo"));
		
		classService.insertQA(questionAnswer);
		
		return "redirect: /class/onClassQABoardList?classNo=" + questionAnswer.getClassNo();
	}
	
}
