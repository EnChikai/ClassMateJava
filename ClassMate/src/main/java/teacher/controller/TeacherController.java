package teacher.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import teacher.dto.Teacher;
import teacher.dto.TeacherApply;
import teacher.dto.TeacherLicence;
import teacher.json.YourRequestBodyClass;
import teacher.service.face.TeacherService;
import user.dto.UserInfo;
import web.util.Paging;
import web.util.TeacherMainPaging;
import lecture.dto.Address;
import lecture.dto.Class;
import lecture.dto.ClassVideo;
import lecture.dto.QuestionAnswer;
import main.dto.MainCategory;
import main.dto.SubCategory;
import payment.dto.Payment;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private TeacherService teacherService;

	@GetMapping("/main")
	public void main(HttpSession session, Model model, Class lecture, HashMap<String, Object> map, TeacherMainPaging param) {
		
		int userNo = (int) session.getAttribute("userNo"); 
		
		String userName = teacherService.getNameByUserNo(userNo);
		String teacherImg = teacherService.getTeacherImg(userNo);
		
		session.setAttribute("userName", userName);
		session.setAttribute("teacherImg", teacherImg);
		
		model.addAttribute("userName", userName);
		model.addAttribute("teacherImg", teacherImg);
				
		// 강사 정산 내역 페이징 계산
		if (session.getAttribute("teacherNo") != null) {

			lecture.setTeacherNo((int) session.getAttribute("teacherNo"));
			logger.info("티처넘버 안에 뭐가 있니? : {}", lecture.getTeacherNo());


			Paging paging = teacherService.getPaging3(param, session, map);
			logger.info("페이징나와?0 {}", paging);
			
			// 강사 정산 내역
			map = teacherService.getCheckMain(lecture,  map, paging, session);
			model.addAttribute("mainList", map.get("Class"));
			model.addAttribute("paging", paging);
		}

		
	}

	@GetMapping("/check")
	public void check(HttpSession session, Model model, Class lecture, String onOff, HashMap<String, Object> map, Paging param) {
		
		String userName = (String) session.getAttribute("userName");
		String teacherImg = (String) session.getAttribute("teacherImg");
		
		model.addAttribute("userName", userName);
		model.addAttribute("teacherImg", teacherImg);
		
		logger.info("onOff 안에 뭐가 있어? : {}", onOff);
		
		// 강사 정산 내역 페이징 계산
		if (session.getAttribute("teacherNo") != null) {

			lecture.setTeacherNo((int) session.getAttribute("teacherNo"));
			logger.info("티처넘버 안에 뭐가 있니? : {}", lecture.getTeacherNo());
			logger.info("onOff 안에 뭐가 있니? : {}", onOff);

			Paging paging = teacherService.getPaging2(param, session, map, onOff);
			logger.info("페이징나와?0 {}", paging);
			
			// 강사 정산 내역
			map = teacherService.getCheckDetail(lecture,  map, paging, session, onOff);
			model.addAttribute("classList", map.get("Class"));
			model.addAttribute("paging", paging);
		}

		
	}
		
		
		
	
	@PostMapping("/check")
	public void checkDetailProc(Model model, String onOff, Class lecture, HashMap<String, Object> map,
			Paging param, HttpSession session) {
		
		String userName = (String) session.getAttribute("userName");
		String teacherImg = (String) session.getAttribute("teacherImg");
		
		model.addAttribute("userName", userName);
		model.addAttribute("teacherImg", teacherImg);
		
		logger.info("onOff 안에 뭐가 있어? : {}", onOff);

		// 강사 정산 내역 페이징 계산
		if (session.getAttribute("teacherNo") != null) {
			lecture.setTeacherNo((int) session.getAttribute("teacherNo"));
			logger.info("티처넘버 안에 뭐가 있니? : {}", lecture.getTeacherNo());
			logger.info("onOff 안에 뭐가 있니? : {}", onOff);

			if (onOff.equals("99")) {

				Paging paging = teacherService.getPaging2(param, session, map, onOff);

//				 logger.info("paging 안에 뭐가 있어? : {}",paging);

				// 강사 정산 내역
				map = teacherService.getCheckDetail(lecture, map, paging, session, onOff);
				model.addAttribute("classList", map.get("Class"));
				model.addAttribute("paging", paging);
				model.addAttribute("allPayDetail", 1);
			} else if (onOff.equals("1")) {

				Paging onPaging = teacherService.getPaging(param, session, map, onOff);

				// 강사 정산 내역
				map = teacherService.getClassCheckDetail(lecture, map, onPaging, session, onOff);
				model.addAttribute("classList", map.get("Class"));
				model.addAttribute("paging", onPaging);
				model.addAttribute("onPayDetail", 2);
			} else if (onOff.equals("0")) {

				Paging offPaging = teacherService.getPaging2(param, session, map, onOff);

				// 강사 정산 내역
				map = teacherService.getClassCheckDetail(lecture, map, offPaging, session, onOff);
				model.addAttribute("classList", map.get("Class"));
				model.addAttribute("paging", offPaging);
				model.addAttribute("offPayDetail", 3);

			}
		}

	}
	
	@GetMapping("/detail")
	public void detailView (HttpSession session, Model model, Teacher teacherParam, Class lecture, Address addressParam, ClassVideo videoParam) {
		String userName = (String) session.getAttribute("userName");
		String teacherImg = (String) session.getAttribute("teacherImg");
		
		logger.info("클라스 {}", lecture);
		logger.info("강의 {}", videoParam);
		logger.info("주소 {}", addressParam);
		
		model.addAttribute("userName", userName);
		model.addAttribute("teacherImg", teacherImg);
		
		
		
		if( lecture.getClassNo() < 1 ) {
		
		}
		
		Class lectureDetail = teacherService.detailView(lecture);
		
		logger.info("반환됐어? {}", lectureDetail);
		
		int onOff = lectureDetail.getOnOff();
		logger.info("와써 {}", onOff);
		
		model.addAttribute("detailList", lectureDetail);
		
		if (onOff == 1) {
			
		List <ClassVideo> videoDetail = teacherService.detailVideoView(videoParam); 
		logger.info("비디오왔어? {} ", videoDetail);
		model.addAttribute("videoList", videoDetail);
		}	
		else {
				
		Address addressDetail = teacherService.detailAddressView(addressParam); 
		logger.info("주소왔어? {} ", addressDetail);
		model.addAttribute("addressList", addressDetail);
		}

	}
	

	@GetMapping("/NewFile")
	public void newFile3(HttpSession session, Model model) {
		
		String userName = (String) session.getAttribute("userName");
		String teacherImg = (String) session.getAttribute("teacherImg");
		
		model.addAttribute("userName", userName);
		model.addAttribute("teacherImg", teacherImg);
	}

	@PostMapping("/NewFile")
	public void handleFileUpload(MultipartHttpServletRequest request, @RequestParam("fileCount") int fileCount) {
		logger.info("파일 카운트 {}", fileCount);

		try {
			List<MultipartFile> files = new ArrayList<>();

			int[] numberFiles = new int[fileCount];

			for (int i = 1; i <= fileCount; i++) {
				MultipartFile file = request.getFile("fileInput_" + i);
				// 파일에 대한 처리 수행
				// files 리스트에 파일 추가 또는 다른 처리 수행
				files.add(file);
				logger.info("파일 {}", files);

				// input type=number에 대한 처리 수행
				String numberInputValue = request.getParameter("numberInput_" + i);
				int numberInput = Integer.parseInt(numberInputValue);
				numberFiles[i - 1] = numberInput;
				logger.info("숫자 입력값 {}", numberFiles);
			}
			// 여기서 files 리스트를 사용하여 파일에 대한 추가적인 처리 수행
		} catch (Exception e) {

		}
	}


	  @GetMapping("/answer") public String answer(ModelMap map, Model model,
	  HttpSession session, TeacherMainPaging param) {
		  
		String userName = (String) session.getAttribute("userName");
		String teacherImg = (String) session.getAttribute("teacherImg");
			
		model.addAttribute("userName", userName);
		model.addAttribute("teacherImg", teacherImg);
	  
	  List <Class> list = teacherService.answerDrop(session, param);
	  
	  	map.addAttribute("dropList", list);
	  
	  
	  return null; }


//	@RequestMapping("/answer")
//	public void answer(ModelMap map, Model model,
//			 HttpSession session, TeacherMainPaging param, @RequestParam("classNo") String classNo, HashMap<String, Object> hashMap) {
//		  List <Class> list = teacherService.answerDrop(session, param);
//		  map.addAttribute("dropList", list);
//		
//		  TeacherMainPaging paging = teacherService.getPaging( param, classNo );
//		  
//		  List <QuestionAnswer> list2 = teacherService.qalistPost(paging, classNo,
//		  hashMap);
//		  
//		  logger.info("퐈징 {}",paging);
//		  
//		  logger.info("해시맵클번 {}",hashMap.get("classNo"));
//		  
////		  logger.info("요게 맞나?list {}",list2);
//		  
//		  model.addAttribute("paging", paging);
//		  
//		  logger.info("담겨있나 {}", paging);
//		  
//		  model.addAttribute("list", list2);
//
//		
//	}

	
	  @PostMapping("/answer") public void answer(ModelMap map, Model model,
	  HttpSession session, TeacherMainPaging param, @RequestParam("classNo") String
	  classNo, HashMap<String, Object> hashMap) {
	  
	  logger.info("클넘 {}", classNo);
	  
		String userName = (String) session.getAttribute("userName");
		String teacherImg = (String) session.getAttribute("teacherImg");
		
		model.addAttribute("userName", userName);
		model.addAttribute("teacherImg", teacherImg);
	  
	  TeacherMainPaging paging = teacherService.getPaging( param, classNo );
	  
	  List <QuestionAnswer> list = teacherService.qalistPost(classNo);
	  
	  logger.info("퐈징 {}",paging);
	  
	  logger.info("해시맵클번 {}",hashMap.get("classNo"));
	  
	  logger.info("요게 맞나?list {}",list);
	  
	  model.addAttribute("paging", paging);
	  
	  logger.info("담겨있나 {}", paging);
	  
	  model.addAttribute("list", list);
	  
	  List <Class> list2 = teacherService.answerDrop(session, param);
	  
	  map.addAttribute("dropList", list2);
	  
	  
	  
	  }
	 

	@PostMapping(value = "/answer_ok", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String answerOk(Model model, HttpSession session, QuestionAnswer qaParam,
			@RequestParam("answerContent") String answerContent, @RequestParam("questionNo") int questionNo) {

		String userName = (String) session.getAttribute("userName");
		String teacherImg = (String) session.getAttribute("teacherImg");
		
		model.addAttribute("userName", userName);
		model.addAttribute("teacherImg", teacherImg);
		
		
		logger.info("질문번호 {}", questionNo);
		logger.info("답변/수정글 {}", answerContent);

		try {
			qaParam.setQuestionNo(questionNo);
			qaParam.setAnswerContent(answerContent);

			teacherService.qaParamUpdate(qaParam);

			logger.info("qa {}", qaParam);

			return answerContent; // 예시로 "success" 문자열을 반환
		} catch (NumberFormatException e) {
			// 변환 실패 시 처리
			return "error"; // 예시로 "error" 문자열을 반환
		}

	}

	@GetMapping("/apply")
	public void apply(HttpSession session, Model model, UserInfo userParam) {
		
		int userNo = (int) session.getAttribute("userNo"); //로그인 시 세션에 저장된 유저넘버
		
		String userName = teacherService.getTeacherName(userNo);
		
		model.addAttribute("userName", userName);

	}

	@PostMapping("/apply")
	public String applyPost(Teacher teacherParam, TeacherLicence teacherLicenceParam, TeacherApply teacherApply,
			List<MultipartFile> file, List<MultipartFile> singleFile, HttpSession session, Model model

	) {

		int userNo = (int) session.getAttribute("userNo"); //로그인 시 세션에 저장된 유저넘버
		

		// teacherParam.setUserNo((int) session.getAttribute("userNo"));

		teacherParam.setUserNo(userNo);

		logger.info("insertApply {}",teacherApply);
		 logger.info("insertParam {}", teacherParam);
		 logger.info("insertLicenceParam {}", teacherLicenceParam);
		 logger.info("insertLicenceParam {}", singleFile);
		 logger.info("file {}", file);
		// logger.info("delFileno {}", Arrays.toString(delFileno));

		teacherService.applyWrite(teacherParam, teacherLicenceParam, teacherApply, file, singleFile);

		return "redirect:../main/main";
	}

//	@RequestMapping(value = { "/main", "/check" })
//	public void teacherPageGet(Class lecture, TeacherMainPaging param, Model model, HttpSession session) {
//
//		int userNo = (int) session.getAttribute("userNo"); //로그인 시 세션에 저장된 유저넘버
//		//int userNo = 3; // 유저번호가 2번이라는 가정 하에 진행
//
//		String userName = (String) session.getAttribute("userName");
//		String teacherImg = (String) session.getAttribute("teacherImg");
//		
//		model.addAttribute("userName", userName);
//		model.addAttribute("teacherImg", teacherImg);
//		
//		// 페이징 계산
//		TeacherMainPaging paging = teacherService.getPaging(param, userNo);
//		logger.info("{}", paging);
//
//		// 게시글 목록 조회
//		List<Class> list = teacherService.pageList(paging, userNo);
//
//		model.addAttribute("paging", paging);
//		model.addAttribute("list", list);
//
//	}

//	@GetMapping("/detail")
//	public void detail(Model model, HttpSession session) {
//		
//		String userName = (String) session.getAttribute("userName");
//		String teacherImg = (String) session.getAttribute("teacherImg");
//		
//		model.addAttribute("userName", userName);
//		model.addAttribute("teacherImg", teacherImg);
//	}

//	@RequestMapping("/detail")
//	public String teacherClassDetailGet(Class lecture, Model model, HttpSession session) {
//		
//		String userName = (String) session.getAttribute("userName");
//		String teacherImg = (String) session.getAttribute("teacherImg");
//		
//		model.addAttribute("userName", userName);
//		model.addAttribute("teacherImg", teacherImg);
//		
//
//		if (lecture.getClassNo() < 1) {
//			return "teacher/main";
//		}
//
//		lecture = teacherService.teacherClassDetail(lecture);
//
//		return "teacher/detail";
//	}

	@GetMapping("/regist")
	public void regist(Model model, HttpSession session) {
		
		String userName = (String) session.getAttribute("userName");
		String teacherImg = (String) session.getAttribute("teacherImg");
		
		model.addAttribute("userName", userName);
		model.addAttribute("teacherImg", teacherImg);

	}

	@PostMapping("/regist")
	public String teacherClassRegistPost(Teacher teacherParam, UserInfo userParam, Class classParam,
			Address addressParam, ClassVideo classVideoParam, MainCategory mainCategoryParam,
			SubCategory subCategoryParam, MultipartHttpServletRequest request, @RequestParam("fileCount") int fileCount,
			List<MultipartFile> singleFile, HttpSession session, Model model) {

		logger.info("classParam {}", classParam);
		logger.info("addressParam {}", addressParam);
		logger.info("categoryBParam {}", mainCategoryParam);
		logger.info("categoryDParam {}", subCategoryParam);
		logger.info("싱글파일 {}", singleFile);

		teacherService.classRegist(teacherParam, userParam, classParam, addressParam, classVideoParam,
				mainCategoryParam, subCategoryParam, request, fileCount, singleFile, session);

		return "redirect:/teacher/main";// "redirect:./detail?classNo=" + registLecture.getClassNo();
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

	// 강사 정산 내역
	@GetMapping("/payDetail")
	public void payDetail(String onOff, Class lecture, Payment payment, Model model, HashMap<String, Object> map,
			Paging param, HttpSession session) {
		
		String userName = (String) session.getAttribute("userName");
		String teacherImg = (String) session.getAttribute("teacherImg");
		
		model.addAttribute("userName", userName);
		model.addAttribute("teacherImg", teacherImg);

		// 강사 정산 내역 페이징 계산
		if (session.getAttribute("teacherNo") != null) {

			lecture.setTeacherNo((int) session.getAttribute("teacherNo"));
			logger.info("티처넘버 안에 뭐가 있니? : {}", lecture.getTeacherNo());
			logger.info("onOff 안에 뭐가 있니? : {}", onOff);

			Paging paging = teacherService.getPaging(param, session, map, onOff);

			// 강사 정산 내역
			map = teacherService.getpayDetail(lecture, payment, map, paging, session, onOff);
			model.addAttribute("classList", map.get("Class"));
			model.addAttribute("paymentList", map.get("Payment"));
			model.addAttribute("paging", paging);
		}
	}

	@PostMapping("/payDetail")
	public void payDetailProc(Model model, String onOff, Class lecture, Payment payment, HashMap<String, Object> map,
			Paging param, HttpSession session) {
		
		String userName = (String) session.getAttribute("userName");
		String teacherImg = (String) session.getAttribute("teacherImg");
		
		model.addAttribute("userName", userName);
		model.addAttribute("teacherImg", teacherImg);
		
		logger.info("onOff 안에 뭐가 있어? : {}", onOff);

		// 강사 정산 내역 페이징 계산
		if (session.getAttribute("teacherNo") != null) {
			lecture.setTeacherNo((int) session.getAttribute("teacherNo"));
			logger.info("티처넘버 안에 뭐가 있니? : {}", lecture.getTeacherNo());
			logger.info("onOff 안에 뭐가 있니? : {}", onOff);

			if (onOff.equals("99")) {

				Paging paging = teacherService.getPaging(param, session, map, onOff);

//				 logger.info("paging 안에 뭐가 있어? : {}",paging);

				// 강사 정산 내역
				map = teacherService.getpayDetail(lecture, payment, map, paging, session, onOff);
				model.addAttribute("classList", map.get("Class"));
				model.addAttribute("paymentList", map.get("Payment"));
				model.addAttribute("paging", paging);
				model.addAttribute("allPayDetail", 1);
			} else if (onOff.equals("1")) {

				Paging onPaging = teacherService.getPaging(param, session, map, onOff);

				// 강사 정산 내역
				map = teacherService.getClassPayDetail(lecture, payment, map, onPaging, session, onOff);
				model.addAttribute("classList", map.get("Class"));
				model.addAttribute("paymentList", map.get("Payment"));
				model.addAttribute("paging", onPaging);
				model.addAttribute("onPayDetail", 2);
			} else if (onOff.equals("0")) {

				Paging offPaging = teacherService.getPaging(param, session, map, onOff);

				// 강사 정산 내역
				map = teacherService.getClassPayDetail(lecture, payment, map, offPaging, session, onOff);
				model.addAttribute("classList", map.get("Class"));
				model.addAttribute("paymentList", map.get("Payment"));
				model.addAttribute("paging", offPaging);
				model.addAttribute("offPayDetail", 3);

			}
		}

	}

}
