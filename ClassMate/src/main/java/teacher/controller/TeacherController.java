package teacher.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import teacher.service.face.TeacherService;
import web.util.TeacherMainPaging;
import lecture.dto.Class;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private TeacherService teacherService;

	@GetMapping("/main")
	public void main() {}
	
	@GetMapping("/check")
	public void check() {}

	
	@RequestMapping(value = {"/main", "/check"}) 
	public void teacherPageGet (Class lecture, TeacherMainPaging
	param, Model model, HttpSession session) {

		// int userNO = (int) session.getAttribute("userNo"); //로그인 시 세션에 저장된 유저넘버
		int userNo = 2; //유저번호가 2번이라는 가정 하에 진행
	  
	  //페이징 계산 
		TeacherMainPaging paging = teacherService.getPaging( param, userNo ); 
		logger.info("{}",paging);
	  
	  	  
	  
	  //게시글 목록 조회 
		List<Class> list = teacherService.pageList( paging, userNo);
	  
		model.addAttribute("paging", paging); 
		model.addAttribute("list", list);
	    
	  }
	  
	 @GetMapping("/detail")
	 public void detail() {}
	 
	 @RequestMapping("/detail")
	 public String teacherClassDetailGet(Class lecture, Model model) {
		 
		 if(lecture.getClassNo() < 1) {
			 return "teacher/main";
		 }
		 
		 lecture = teacherService.teacherClassDetail(lecture);
		 
		 return "teacher/detail";
	 }
	 
	 @GetMapping("/regist")
	 public void regist() {}
	 
	 @PostMapping("/regist")
	 public String teacherClassRegistPost(Class registLecture, List<MultipartFile> file, HttpSession session) {
		
		 teacherService.classRegist(registLecture, file);
		 
		 return "redirect:./detail?classNo=" + registLecture.getClassNo();
	 }
	 
	 

}