package teacher.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import teacher.dto.Teacher;
import teacher.dto.TeacherApply;
import teacher.dto.TeacherLicence;
import teacher.json.YourRequestBodyClass;
import teacher.service.face.TeacherService;
import user.dto.UserInfo;
import web.util.TeacherMainPaging;
import lecture.dto.Address;
import lecture.dto.Class;
import lecture.dto.ClassVideo;
import lecture.dto.QuestionAnswer;
import main.dto.MainCategory;
import main.dto.SubCategory;

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

	@GetMapping("/NewFile")
	public void newFile() {}
	
	@PostMapping("/NewFile")
	public void handleFileUpload(MultipartHttpServletRequest request,
	                                               @RequestParam("fileCount") int fileCount) {
	    logger.info("파일 카운트 {}", fileCount);

	    try {
	        List<MultipartFile> files = new ArrayList<>();

	        int[] numberFiles =  new int [fileCount];
	        
	        for (int i = 1; i <= fileCount; i++) {
	            MultipartFile file = request.getFile("fileInput_" + i);
	            // 파일에 대한 처리 수행
	            // files 리스트에 파일 추가 또는 다른 처리 수행
	            files.add(file);
	            logger.info("파일 {}", files);
	            
	            // input type=number에 대한 처리 수행
	            String numberInputValue = request.getParameter("numberInput_" + i);
	            int numberInput = Integer.parseInt(numberInputValue);
	            numberFiles [i-1] = numberInput;
	            logger.info("숫자 입력값 {}", numberFiles);
	        }
	        // 여기서 files 리스트를 사용하여 파일에 대한 추가적인 처리 수행	       
	    } catch (Exception e) {
	       
	    }
	}
	
	@GetMapping("/answer")
	public String answer(ModelMap map, HttpSession session, TeacherMainPaging param) {
		
		List <Class> list = teacherService.answerDrop(session, param);
		
		map.addAttribute("dropList", list);
		
		return null;
	}
	
	@GetMapping("/apply")
	public void apply() {}
	
	
	@PostMapping("/apply")
	public String applyPost(
			 Teacher teacherParam
			, TeacherLicence teacherLicenceParam
			, TeacherApply teacherApply
			, List<MultipartFile> file
			, List<MultipartFile> singleFile	
			, HttpSession session			
			, Model model
			
			) {
		
	    //int userNo = (int) session.getAttribute("userNo"); //로그인 시 세션에 저장된 유저넘버
	    int userNo = 2;

		//teacherParam.setUserNo((int) session.getAttribute("userNo"));
		
	    teacherParam.setUserNo(userNo);
	    
		//logger.info("insertParam {}", teacherParam);
		//logger.info("insertLicenceParam {}", teacherLicenceParam);
		//logger.info("insertLicenceParam {}", singleFile);
		//logger.info("file {}", file);
		//logger.info("delFileno {}", Arrays.toString(delFileno));

		teacherService.applyWrite(teacherParam, teacherLicenceParam, teacherApply ,file, singleFile);
		
		
		
		return "redirect:../main/main";
	}

	
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
	 public void regist() {
		 
	 }
	 
	 @PostMapping("/regist")
	 public String teacherClassRegistPost(	
			 		Teacher teacherParam
				, UserInfo userParam
				, Class classParam
				, Address addressParam
				, ClassVideo classVideoParam
				, MainCategory mainCategoryParam
				, SubCategory subCategoryParam
				, MultipartHttpServletRequest request
				, @RequestParam("fileCount") int fileCount
				, List<MultipartFile> singleFile
				, HttpSession session			
				, Model model
			 	) {
		 
		 logger.info("classParam {}", classParam);
		 logger.info("addressParam {}", addressParam);
		 logger.info("categoryBParam {}", mainCategoryParam);
		 logger.info("categoryDParam {}", subCategoryParam);
		 logger.info("싱글파일 {}", singleFile);
		 
		 

		
			teacherService.classRegist(teacherParam, userParam, classParam, addressParam, classVideoParam, 
					mainCategoryParam, subCategoryParam, request, fileCount, singleFile, session);
		 
		 return null;//"redirect:./detail?classNo=" + registLecture.getClassNo();
	 }
	 
//	 
//	 @RequestMapping("/answer")
//	 public void teacherQaListGet(QuestionAnswer qa, TeacherMainPaging param, Model model, HttpSession session) {
//		 
//		// int classNo = (int) session.getAttribute("classNo"); // 세션에 저장된 유저넘버
//			int userNo = 2; //유저번호가 2번이라는 가정 하에 진행
//		 
//		 TeacherMainPaging paging = teacherService.getAnswerPaging( param, userNo); 
//		 logger.info("{}",paging);
//		 
//		  //질문/답변 리스트 조회 
//			List<QuestionAnswer> list = teacherService.qaList( paging, userNo);
//		  
//			model.addAttribute("paging", paging); 
//			model.addAttribute("list", list);
//		 
			
			
			// 웹에서 전달되는 클래스 번호 가져오기
			// 클래스 번호와 동일한 리스트 출력하도록 바꾸기
		 
//	 }
	 

	 
	 

}
