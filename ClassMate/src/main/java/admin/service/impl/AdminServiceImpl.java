package admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import admin.dao.face.AdminDao;
import admin.service.face.AdminService;
import board.dto.AnnounceBoard;
import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import board.dto.EventBoardFile;
import board.dto.FreeBoard;
import board.dto.FreeBoardFile;
import board.dto.FreeComment;
import board.dto.Question;
import board.dto.QuestionFile;
import payment.dto.OrderTb;
import payment.dto.Payment;
import teacher.dto.Teacher;
import teacher.dto.TeacherApply;
import teacher.dto.TeacherLicence;
import user.dto.UserInfo;
import web.util.Paging;
import lecture.dto.Class;

@Service
public class AdminServiceImpl implements AdminService{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private AdminDao adminDao;
	
	@Autowired ServletContext context;
	
	//--- 메인 ---
	
	@Override
	public Map<String, Object> getDashBoardInfo() {
		logger.info("getDashBoardInfo()");
		Map<String, Object> map = new HashMap<String, Object>();
		
		//미탈퇴 인원
		int Param = 0;
		int userCount = adminDao.getUserCountAll(Param);
		logger.info("userList : {}", userCount);
		
		
		//탈퇴 인원
		Param = 1;
		int secessionUserCount = adminDao.getUserCountAll(Param);
		logger.info("secessionUserList : {}", secessionUserCount);

		map.put("userCount", userCount);
		map.put("secessionUserCount", secessionUserCount);
		
		//강사 유저 수
		Param = 1;
		int teacherUserCount = adminDao.getTeacherUserCountAll(Param);
		logger.info("teacherUserCount : {}", teacherUserCount);

		map.put("teacherUserCount", teacherUserCount);
		
		//on 클래스
		Param = 0;
		int onClassCount = adminDao.getOnOffClassCountAll(Param);
		logger.info("onClassCount : {}", onClassCount);
		
		//off 클래스
		Param = 1;
		int offClassCount = adminDao.getOnOffClassCountAll(Param);
		logger.info("offClass : {}", offClassCount);
		
		map.put("onClassCount", onClassCount);
		map.put("offClassCount", offClassCount);
		
		//현재월-1,-2,-3의 총 결제액 가져오기
		Payment paymentData = new Payment();
		
		// 새로운 리스트를 생성하여 payDate와 payment를 각각 저장할 예정입니다.
		List<String> payDateList = new ArrayList<>();
		List<Integer> paymentList = new ArrayList<>();

		for (int monthCount = 0; monthCount < 4; monthCount++) {
		    paymentData = adminDao.getPaymentData(monthCount);

		    // paymentData가 null인 경우 sysdate의 "YY-MM"을 payDateList에 추가
		    if (paymentData == null) {
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM");
		        String sysdateFormatted = dateFormat.format(new Date());
		        payDateList.add(sysdateFormatted);

		        // null인 경우 0을 paymentList에 추가
		        paymentList.add(0);
		    } else {
		        // paymentData가 null이 아닌 경우
		        // payDate를 "YY-MM" 형식으로 변환하여 리스트에 추가
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM");
		        String formattedDate = dateFormat.format(paymentData.getPayDate());
		        payDateList.add(formattedDate);

		        // payment를 리스트에 추가
		        paymentList.add(paymentData.getPayment());

		        logger.info("payDateList : {}", payDateList);
		        logger.info("paymentList : {}", paymentList);
		    }
		}

		map.put("payDateList", payDateList);
		map.put("paymentList", paymentList);
		
		
		map.put("payDateList", payDateList);
		map.put("paymentList", paymentList);
		
		return map;
	}
	
	//================================================================================
	//--- 유저 관리 ---
	
	@Override
	public Paging  getUserPaging(Paging param, int delCheckbox) {
		logger.info("getPaging()");
		
		//총 게시글 수 조회
		int totalCount = adminDao.userInfoCntAll(delCheckbox);
		logger.info("totalCount : {}",totalCount);
		
		//페이징 객체 생성(페이징 계산)
		Paging paging = new Paging(totalCount, param.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<UserInfo> userInfoList(Paging paging, int sort, int delCheckbox) {
		logger.info("userInfoList()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("sort", sort);
		
		List<UserInfo> list = new ArrayList<UserInfo>();
		
		if(delCheckbox != 0) {
			list = adminDao.selectDelUserAll(map);
			logger.info("list : {}",list);
		}else {
			list = adminDao.selectUserAll(map);
			logger.info("list : {}",list);
		}
		
		if(list != null) {
			logger.info("조회성공");
		}else {
			logger.info("조회실패");
		}
		
		return list;
	}

	@Override
	public UserInfo userInfo(UserInfo userdata) {
		logger.info("userInfo()");
		
		userdata = adminDao.selectUser(userdata);
		logger.info("userdata : {}", userdata);
		
		return userdata;
	}

	@Override
	public void userInfoUpdate(UserInfo userdata) {
		logger.info("userInfoUpdate()");
		
		int result = 0;
		if(userdata != null) {
			result = adminDao.updateUser(userdata);
		}
		logger.info("updata result : {}", result);
		
	}

	@Override
	public void secessionUser(UserInfo userdata) {
		
		int result = 0;
		if(userdata.getUserNo() != 0) {
			result = adminDao.setSecessionUser(userdata);
		}
		logger.info("setSecessionUser result : {}", result);
		
	}

	@Override
	public Paging getOrderPaging(Paging param, OrderTb orderTb) {
		logger.info("getOrderPaging()");
		
		//총 주문 수 조회
		int totalCount = adminDao.selectOrderCnt(orderTb);
		logger.info("totalCount : {}",totalCount);
		
		//페이징 객체 생성(페이징 계산)
		Paging paging = new Paging(totalCount, param.getCurPage());
		
		return paging;
	}
	
	@Override
	public Map<String, Object> getPaymentList(Paging paging, OrderTb orderTb) {
		logger.info("getPaymentList()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("orderTb", orderTb);
		
		List<OrderTb> orderList = adminDao.selectUserOrder(map);
		
		map.put("orderList", orderList);
		
		List<Payment> paymentList = new ArrayList<Payment>();
		List<Class> classList = new ArrayList<Class>();
		
		for(int i = 0; i<orderList.size(); i++) {
			logger.info(i+". selectUserOrder() : {}", orderList );
		}
		
		if(paging.getTotalCount() != 0) {
		
			paymentList = adminDao.selectUserPayment(map);
			
			for(int i = 0; i<paymentList.size(); i++) {
				logger.info(i+". selectUserPayment() : {}", paymentList );
				
				Class classInfo = adminDao.selectClassNameByClassNo(orderList.get(i).getClassNo());
				classList.add(classInfo);
				
				logger.info(i+". selectClassNameByClassNo() : {}", classList );
				
			}

			resultMap.put("orderList", orderList);
			resultMap.put("paymentList", paymentList);
			resultMap.put("classList", classList);
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> getUserBoardPaging(String questionCurPage, String freeBoardCurPage, UserInfo userInfo) {
		logger.info("getUserBoardPaging()");

		Map<String, Object> map = new HashMap<String, Object>();
		
		int curPage = 0;
		if(questionCurPage !=null) {
			curPage = Integer.parseInt(questionCurPage);
		}
		
		//1:1문의 게시글 수 조회
		int questionCount = adminDao.userQuestionCntAll(userInfo);
		logger.info("questionCount : {}",questionCount);
		
		//페이징 객체 생성(페이징 계산)
		Paging questionPaging = new Paging(questionCount, curPage);
		
		map.put("questionPaging", questionPaging);

		
		if(freeBoardCurPage !=null) {
			curPage = Integer.parseInt(freeBoardCurPage);
		}
		
		int freeBoardCount = adminDao.userFreeboardCntAll(userInfo);
		logger.info("questionCount : {}",freeBoardCount);
		
		//페이징 객체 생성(페이징 계산)
		Paging freeBoardPaging = new Paging(freeBoardCount, curPage);
		
		map.put("freeBoardPaging", freeBoardPaging);
		
		return map;
	}
	

	@Override
	public Map<String, Object> selectUserPost(UserInfo userInfo, Paging questionPaging, Paging freeBoardPaging) {
		logger.info("selectUserPost()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userInfo", userInfo);
		map.put("questionPaging", questionPaging);
		map.put("freeBoardPaging", freeBoardPaging);
		
		List<Question> questionList = adminDao.userQuestionList(map);
		for(int i = 0; i<questionList.size(); i++) {
			logger.info("questionList : {}", questionList.get(i));
		}
		
		List<FreeBoard> freeBoardList = adminDao.userFreeBoardList(map);
		for(int i = 0; i<freeBoardList.size(); i++) {
			logger.info("freeBoardList : {}", freeBoardList.get(i));
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("questionList", questionList);
		result.put("freeBoardList", freeBoardList);
		
		return result;
	}
	
	@Override
	public Map<String, Object> selectQuestionInfo(Question question) {
		logger.info("selectQuestionInfo()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<QuestionFile> questionFile = new ArrayList<QuestionFile>();
		
		question = adminDao.selectQuestionNo(question);
		logger.info("selectQuestionNo() : {}", question);

		map.put("question", question);
		
		questionFile = adminDao.selectQuestionFiles(question);
		for(int i = 0; i<questionFile.size();i++) {
			logger.info("selectQuestionFiles() : {}", questionFile);
		}
		map.put("questionFile", questionFile);
		
		UserInfo userInfo = new UserInfo();
		userInfo.setUserNo(question.getUserNo());
		userInfo = adminDao.selectUser(userInfo);
		logger.info("selectUser() : {}", userInfo);
		
		map.put("userInfo", userInfo);
		
		return map;
	}
	
	@Override
	public QuestionFile getQuestionFile(QuestionFile questionFile) {
		logger.info("getQuestionFile()");
		
		questionFile = adminDao.selectQuestionFileByFileNo(questionFile);
		
		return questionFile;
	}
	
	@Override
	public void writeAnswer(Question question) {
		logger.info("writeAnswer()");
		
		int result = 0;
		if(question.getAnswerContent() != null) {
			
			question.setAnswer("완료");
			result = adminDao.insertAnswer(question);
			logger.info("insertAnswer() {}", question);
			
		}
		logger.info("result : {}", result);
		
	}
	
	@Override
	public Map<String, Object> viewFreePost(FreeBoard freeBoard) {
		logger.info("selectQuestionInfo()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<FreeBoardFile> freeBoardFiles = new ArrayList<FreeBoardFile>();
		
		freeBoard = adminDao.selectUserFreePost(freeBoard);
		logger.info("selectUserFreePost() : {}", freeBoard);

		map.put("freeBoard", freeBoard);
		
		freeBoardFiles = adminDao.selectFreePostFile(freeBoard);
		for(int i = 0; i<freeBoardFiles.size();i++) {
			logger.info("selectFreePostFile() : {}", freeBoardFiles);
		}
		map.put("freeBoardFiles", freeBoardFiles);
		
		UserInfo userInfo = new UserInfo();
		userInfo.setUserNo(freeBoard.getUserNo());
		userInfo = adminDao.selectUser(userInfo);
		logger.info("selectUser() : {}", userInfo);
		
		map.put("userInfo", userInfo);
		
		return map;
	}
	
	@Override
	public void freePostUpdate(FreeBoard freeBoard, MultipartFile file, int[] delFileno, List<MultipartFile> freeFile) {
		logger.info("freePostUpdate()");

		int result = 0; 
		
		if( freeBoard.getFreeName() == null || freeBoard.getFreeName().equals("") ) {
			freeBoard.setUserName(null);
		}
		logger.info("freeBoard.getFreeName() : {}", freeBoard.getFreeName());

		if( freeBoard.getFreeContent() == null || freeBoard.getFreeContent().equals("") ) {
			freeBoard.setFreeContent("(본문 없음)");
		}
		logger.info("freeBoard.getFreeContent() : {}", freeBoard.getFreeContent());
		
		
		result = adminDao.updateUserFreePost(freeBoard);
		logger.info("freeBoard : {}", freeBoard);
		logger.info("게시판 정보 result : {}", result);
		
		//첨부파일이 없을 경우 처리
		if( freeFile.size() == 0) {
			return;
		}
		
		int selectNo = 2; 
		for(MultipartFile f : freeFile) {
			result = this.insertFile( f, freeBoard.getFreeNo(), selectNo);
			logger.info("게시판 파일 result : {}", result);
		}

		//삭제할 첨부 파일 처리
		if( delFileno != null ) {
			result = adminDao.deleteFreeFiles( delFileno );
		}
				
		return;
		
	}
	
	@Override
	public void freePostDel(FreeBoard freeBoard) {
		logger.info("freeBoard() : {}", freeBoard);

		int result = 0;
		result = adminDao.deleteFreePostFile(freeBoard);
		
		if(result != 0) {
			logger.info("파일 있음 삭제 완료 : {}", result);
			
		}else {
			logger.info("파일 없음 삭제 실패 : {}", result);
			
		}
		
		result = adminDao.deleteUserFreePost(freeBoard);
		logger.info("이벤트 삭제 결과 : {}", result);		
		
	}
	
	//================================================================================
	//--- 강사 신청 관리 ---
	
	@Override
	public Paging getApplyPaging(Paging param, int passCheckbox) {
	logger.info("getApplyPaging()");
		
		//총 게시글 수 조회
		int totalCount = adminDao.selectApplyCntAll(passCheckbox);
		logger.info("totalCount : {}",totalCount);
		
		//페이징 객체 생성(페이징 계산)
		Paging paging = new Paging(totalCount, param.getCurPage());
		
		return paging;
	}
	
	@Override
	public Map<String, Object> selectTeacherApplyList(Paging paging, int passCheckbox) {
		logger.info("selectTeacherApplyList()");

		List<Teacher> teacherList = new ArrayList<Teacher>();
		List<TeacherApply> teacherApplyList = new ArrayList<TeacherApply>();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();
		
		map.put("paging",paging);
		map.put("passCheckbox",passCheckbox);
		
		if(paging.getTotalCount() != 0) {
				
			teacherApplyList = adminDao.selectTeacherApplyAll(map);
			for(int i=0; i<teacherApplyList.size(); i++) {
				logger.info("selectTeacherApplyAll : {}",teacherApplyList);
				
			}
			
			map.put("teacherApplyList",teacherApplyList);
	
			teacherList = adminDao.selectTeacherInfoAll(map);
			for(int i=0; i<teacherList.size(); i++) {
				logger.info("selectTeacherInfoAll : {}",teacherList);
				
			}
		
			result.put("teacherList",teacherList);
			result.put("teacherApplyList",teacherApplyList);
		}
		
		return result;
	}

	@Override
	public Map<String, Object> selectTeacherApply(TeacherApply teacherApply) {
		logger.info("selectTeacherApply()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Teacher teacher = adminDao.selectTeacherInfo(teacherApply);
		logger.info("selectTeacherInfo() : {}", teacher);

		teacherApply = adminDao.selectTeacherApply(teacherApply);		
		logger.info("selectTeacherApply() : {}", teacherApply);
		
		UserInfo userInfo = adminDao.selectUserName(teacher);
		logger.info("selectUserName() : {}", userInfo);
		
		List<TeacherLicence> teacherLicence = adminDao.selectTeacherLicence(teacher);
		logger.info("selectTeacherLicence() : {}", teacherLicence);
		
		map.put("teacher", teacher);
		map.put("teacherApply", teacherApply);
		map.put("userInfo", userInfo);
		map.put("teacherLicence", teacherLicence);
		
		return map;
	}
	
	@Override
	public void teacherPassOrFAil(TeacherApply teacherApply) {
		logger.info("teacherPassOrFAil()");
		
		int result = adminDao.updateTeacherApply(teacherApply);
		logger.info("result() : {}", result);
		
		if(teacherApply.getPassOrNot().equals("0")) {
			result = adminDao.deleteTeacherApply(teacherApply);
			logger.info("deleteTeacherApply() : {}", result);

			result = adminDao.deleteTeacherLicence(teacherApply);
			logger.info("deleteTeacherLicence() : {}", result);

			result = adminDao.deleteTeacherInfo(teacherApply);
			logger.info("deleteTeacherInfo() : {}", result);
		}
		
	}
	
	@Override
	public TeacherLicence getTeacherLicenceFile(TeacherLicence teacherLicence) {
		logger.info("getTeacherLicenceFile()");
		
		teacherLicence = adminDao.selectTeacherLicenceByLicenceNo(teacherLicence);
		
		return teacherLicence;
	}
	
	//================================================================================
	//--- 클래스 관리 ---
	
	@Override
	public List<Class> getClassList(Paging paging, int sort, int delCheckbox) {
		logger.info("getClassList()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Class> classList = new ArrayList<Class>();
		
		map.put("paging", paging);
		map.put("sort", sort);
		map.put("delCheckbox", delCheckbox);
		
		classList = adminDao.selectClassListAll(map);
		for(int i = 0; i<classList.size(); i++) {
			logger.info("selectClassListAll() : {}", classList.get(i));
			
		}
		
		return classList;
	}
	
	@Override
	public Paging getClassPaging(Paging param, int sort, int delCheckbox) {
		logger.info("getClassPaging()");
		logger.info("sort() : {}", sort);
		logger.info("delCheckbox() : {}", delCheckbox);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("sort", sort);
		map.put("delCheckbox", delCheckbox);
		
		//총 게시글 수 조회
		int totalCount = adminDao.classInfoCntAll(map);
		logger.info("totalCount : {}",totalCount);
				
		//페이징 객체 생성(페이징 계산)
		Paging paging = new Paging(totalCount, param.getCurPage());
				
		return paging;
		
	}
	
	//================================================================================
	//--- 게시판 관리 ---
	
	@Override
	public Map<String, Object> getBoardPaging(Paging param, int delCheckbox) {
		logger.info("getPaging()");
		
		//총 게시글 수 조회
		int announceTotalCount = adminDao.announceBoardCntAll(delCheckbox);
		logger.info("totalCount : {}",announceTotalCount);
		
		int eventTotalCount = adminDao.eventBoardCntAll(delCheckbox);
		logger.info("totalCount : {}",eventTotalCount);
		
		//페이징 객체 생성(페이징 계산)
		Paging announcePaging = new Paging(announceTotalCount, param.getCurPage());
		Paging eventPaging = new Paging(eventTotalCount, param.getCurPage());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("eventPaging", eventPaging);
		map.put("announcePaging", announcePaging);
		
		return map;
	}

	@Override
	public Map<String, Object> boardList(Map<String, Object> pagingMap, int delCheckbox) {
		logger.info("boardList() : {}", pagingMap);
		
		List<EventBoard> eventBoardList = new ArrayList<EventBoard>();
		List<AnnounceBoard> announceBoardList = new ArrayList<AnnounceBoard>();
		
		if(delCheckbox != 1) {
			eventBoardList = adminDao.selectEventBoardAll(pagingMap);
			announceBoardList = adminDao.selectAnnounceBoardAll(pagingMap);
			
		}else {
			eventBoardList = adminDao.selectEventBoardDel(pagingMap);
			announceBoardList = adminDao.selectAnnounceBoardDel(pagingMap);
		}
		
		if(eventBoardList != null) {
			logger.info("eventBoardList 조회성공 : {}",eventBoardList);
		}else {
			logger.info("eventBoardList 조회실패 : {}",eventBoardList);
		}
		
		if(announceBoardList != null) {
			logger.info("announceBoardList 조회성공 : {}",announceBoardList);
		}else {
			logger.info("announceBoardList 조회실패 : {}",announceBoardList);
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("eventBoardList", eventBoardList);
		result.put("announceBoardList", announceBoardList);
		
		return result;
	}

	@Override
	public Map<String, Object> getAnnounceView(AnnounceBoard announceBoard) {
		logger.info("getAnnounceView() : {}", announceBoard.getAnnounceNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<AnnounceBoardFile> announceBoardFile = new ArrayList<AnnounceBoardFile>();
		
		announceBoard = adminDao.selectAnnounceNo(announceBoard);
		if(announceBoard != null) {
			logger.info("조회 성공 selectAnnounceNo() : {}", announceBoard);
		}else {
			logger.info("조회 실패 selectAnnounceNo() : {}", announceBoard);
		}
		
		
		//파일조회
		announceBoardFile = adminDao.selectAnnounceFile(announceBoard);
		
		if(announceBoardFile != null) {
			logger.info("조회 성공 selectAnnounceFile() : {}", announceBoardFile);
		}else {
			logger.info("조회 실패 selectAnnounceFile() : {}", announceBoardFile);
		}
		
		map.put("announceBoard", announceBoard);
		map.put("announceBoardFile", announceBoardFile);
		
		return map;
	}

	@Override
	public void writeEvenAnno(String postName, String content, MultipartFile file, int sort
			, List<MultipartFile> announceFile, List<MultipartFile> eventFile) {
		logger.info("writeEvenAnno() : {}");
		
		AnnounceBoard announceBoard = new AnnounceBoard();
		EventBoard eventBoard = new EventBoard();
		int result = 0; 
		
		if( postName == null || postName.equals("") ) {
			postName = "(제목없음)";
		}
		logger.info("postName : {}", postName);
		
		if( content == null || content.equals("") ) {
			content = "(본문없음)";
		}
		logger.info("content : {}", content);
		
		if(sort != 1) {
			announceBoard.setAnnounceName(postName);
			announceBoard.setAnnounceHead("<공지>");
			announceBoard.setAnnounceContent(content);
			logger.info("announceBoard : {}", announceBoard);
			
			result = adminDao.insertAnnounceInfo(announceBoard);
			logger.info("공지 정보 result : {}", result);
			
			//첨부파일이 없을 경우 처리
			if( announceFile.size() == 0 ) {
				return;
			}
			
			int selectNo = 0; 
			for(MultipartFile f : announceFile) {
				result = this.insertFile( f, announceBoard.getAnnounceNo(), selectNo);
				logger.info("공지 파일 result : {}", result);
			}
			

		}else {
			eventBoard.setEventName(postName);
			eventBoard.setEventHead("[이벤트]");
			eventBoard.setEventContent(content);
			logger.info("eventBoard : {}", eventBoard);
			
			result = adminDao.insertEventInfo(eventBoard);
			logger.info("eventBoard : {}", eventBoard);
			logger.info("이벤트 정보 result : {}", result);
			
			result = headImgSave(file, eventBoard);
			logger.info("이벤트 해드 result : {}", result);
			
			//첨부파일이 없을 경우 처리
			if( eventFile.size() == 0 ) {
				return;
			}
			
			int selectNo = 1; 
			for(MultipartFile f : eventFile) {
				result = this.insertFile( f, eventBoard.getEventNo(), selectNo);
				logger.info("이벤트 파일 result : {}", result);
			}

		}
		
	}
	
	private int insertFile(MultipartFile file, int boardNo, int selectNo) {
		logger.info("insertFile()");
		
		int result = 0;
		
		//빈 파일 처리
		if( file.getSize() <= 0 ) {
			return result;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		
		//upload 폴더 생성
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		
		//저장될 파일 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		
		//저장할 파일 객체
		File dest = new File(storedFolder, storedName);
	
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//---------------------------------------------------------------------------
		
		if(selectNo == 0) {
			
			AnnounceBoardFile announceBoardFile = new AnnounceBoardFile();
			announceBoardFile.setAnnounceNo( boardNo );
			announceBoardFile.setOriginName( originName );
			announceBoardFile.setStoredName( storedName );
			
			result = adminDao.insertAnnoFile(announceBoardFile);
			logger.info("insertAnnoFile : {}", result);
			
		}else if((selectNo == 1)) {
			
			EventBoardFile eventBoardFile = new EventBoardFile();
			eventBoardFile.setEventNo(boardNo);
			eventBoardFile.setOriginName( originName );
			eventBoardFile.setStoredName( storedName );
			
			result = adminDao.insertEventFile(eventBoardFile);
			logger.info("insertEventFile : {}", result);
			
		}else if((selectNo == 2)){
			
			FreeBoardFile freeBoardFile = new FreeBoardFile();
			freeBoardFile.setFreeNo(boardNo);
			freeBoardFile.setOriginName( originName );
			freeBoardFile.setStoredName( storedName );
			
			result = adminDao.insertFreeFile(freeBoardFile);
			logger.info("insertEventFile : {}", result);
		}
		
		return result;
	}

	public int headImgSave(MultipartFile file, EventBoard eventBoard) {
		logger.info("filesave()");
		
		int result = 0;
		
		if(file.getSize() <= 0) {
			logger.info("파일의 크기가 0이다, 처리 중단!");
			
			//filesave() 메소드 중단
			return result;
		}
		
		String path = context.getRealPath("upload");
		logger.info("path : {}", path);
		
		
		//폴더 만들기
		File storedFolder = new File(path);
		storedFolder.mkdir();
				
		//업로드된 파일이 저장될 이름
		String uploadFileName = null;
		
		//저장될 파일 객체
		File dest = null;
		
		//저장될 파일명이 중복되지 않도록 반복
		do {
			uploadFileName = file.getOriginalFilename();	//원본 파일명
			uploadFileName += UUID.randomUUID().toString().split("-")[4];	//UUID 추가
			logger.info("storedName : {}",uploadFileName);
		
			dest = new File(storedFolder,uploadFileName);
		}while(dest.exists());
		
		try {
			
			//업로드된 파일을 upload폴더에 저장하기
			(file).transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//DB에 기록하기
		eventBoard.setHeadImg(uploadFileName);
		
		result = adminDao.headImg(eventBoard);
		
		if(result!=0) {
			logger.info("파일 업로드 성공 : {}", result);
			
		}else {
			logger.info("파일 업로드 실패 : {}", result);

		}
		
		return result;
	} 

	@Override
	public Map<String, Object> getEventView(EventBoard eventBoard) {
		logger.info("getAnnounceView() : {}", eventBoard.getEventNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<EventBoardFile> eventBoardFile = new ArrayList<EventBoardFile>();
		
		eventBoard = adminDao.selectEventNo(eventBoard);
		if(eventBoard != null) {
			logger.info("조회 성공 selectEventNo() : {}", eventBoard);
		}else {
			logger.info("조회 실패 selectEventNo() : {}", eventBoard);
		}
		
		//파일조회
		eventBoardFile = adminDao.selectEventFile(eventBoard);
		
		if(eventBoardFile != null) {
			logger.info("조회 성공 selectEventFile() : {}", eventBoardFile);
		}else {
			logger.info("조회 실패 selectEventFile() : {}", eventBoardFile);
		}
		
		map.put("eventBoard", eventBoard);
		map.put("eventBoardFile", eventBoardFile);
		
		return map;
	}

	@Override
	public void eventUpdate(EventBoard eventBoard, MultipartFile file, int[] delFileno, List<MultipartFile> eventFile) {
		logger.info("eventUpdate() : {}");
		int result = 0; 
		
		if( eventBoard.getEventName() == null || eventBoard.getEventName().equals("") ) {
			eventBoard.setEventName("(제목없음)");
		}
		logger.info("eventBoard.getEventName() : {}", eventBoard.getEventName());
		
		if( eventBoard.getEventContent() == null || eventBoard.getEventName().equals("") ) {
			eventBoard.setEventContent("(본문 없음)");
		}
		logger.info("eventBoard.setEventContent() : {}", eventBoard.getEventContent());
		
		eventBoard.setEventHead("[이벤트]");
		logger.info("eventBoard : {}", eventBoard);
		
		result = adminDao.updateEventInfo(eventBoard);
		logger.info("eventBoard : {}", eventBoard);
		logger.info("이벤트 정보 result : {}", result);
		
		if(file.getSize() != 0) {
			result = headImgSave(file, eventBoard);
			logger.info("이벤트 해드 result : {}", result);
		}
		
		//첨부파일이 없을 경우 처리
		if( eventFile.size() == 0) {
			return;
		}
		
		int selectNo = 1; 
		for(MultipartFile f : eventFile) {
			result = this.insertFile( f, eventBoard.getEventNo(), selectNo);
			logger.info("이벤트 파일 result : {}", result);
		}

		//삭제할 첨부 파일 처리
		if( delFileno != null ) {
			result = adminDao.deleteEventFiles( delFileno );
		}
				
		return;
	}

	@Override
	public void announceUpdate(AnnounceBoard announceBoard, int[] delFileno, List<MultipartFile> announceFile) {
		logger.info("announceUpdate() : {}");
		int result = 0; 
		
		if( announceBoard.getAnnounceName() == null || announceBoard.getAnnounceName().equals("") ) {
			announceBoard.setAnnounceName("(제목없음)");
		}
		logger.info("announceBoard.getAnnounceName() : {}", announceBoard.getAnnounceName());

		if( announceBoard.getAnnounceContent() == null || announceBoard.getAnnounceContent().equals("") ) {
			announceBoard.setAnnounceContent("(본문 없음)");
		}
		logger.info("announceBoard.getAnnounceContent() : {}", announceBoard.getAnnounceContent());
		
		announceBoard.setAnnounceHead("<공지사항>");
		logger.info("announceBoard : {}", announceBoard);
		
		result = adminDao.updateAnnoInfo(announceBoard);
		logger.info("announceBoard : {}", announceBoard);
		logger.info("공지 정보 result : {}", result);
		
		//첨부파일이 없을 경우 처리
		if( announceFile.size() == 0) {
			return;
		}
		
		int selectNo = 0; 
		for(MultipartFile f : announceFile) {
			result = this.insertFile( f, announceBoard.getAnnounceNo(), selectNo);
			logger.info("공지 파일 result : {}", result);
		}

		//삭제할 첨부 파일 처리
		if( delFileno != null ) {
			result = adminDao.deleteAnnoFiles( delFileno );
		}
				
		return;
	}

	@Override
	public void setAnnoExist(AnnounceBoard announceBoard) {
		logger.info("announceUpdate() : {}");
		
		int result = adminDao.updateAnnoExist(announceBoard);
		logger.info("공지 exist result : {}", result);
		
	}

	@Override
	public void setEventExist(EventBoard eventBoard) {
		logger.info("setEventUpdate() : {}");
		
		int result = adminDao.updateEventExist(eventBoard);
		logger.info("이벤트 exist result : {}", result);
		
	}

	@Override
	public AnnounceBoardFile getAnnounceFile(AnnounceBoardFile announceBoardFile) {

		announceBoardFile = adminDao.selectAnnoFileByFileNo(announceBoardFile);
		
		return announceBoardFile;
	}
	
	@Override
	public EventBoardFile getEventFile(EventBoardFile eventBoardFile) {
		
		eventBoardFile = adminDao.selectEventFileByFileNo(eventBoardFile);
		
		return eventBoardFile;
	}
	
	@Override
	public void announceDelete(AnnounceBoard announceBoard) {
		logger.info("announceDelet() : {}", announceBoard);

		int result = 0;
		result = adminDao.deleteAnnoFile(announceBoard);
		
		if(result != 0) {
			logger.info("파일 있음 삭제 완료 : {}", result);
			
		}else {
			logger.info("파일 없음 삭제 실패 : {}", result);
			
		}
		
		result = adminDao.deleteAnnoInfo(announceBoard);
		logger.info("공지 삭제 결과 : {}", result);
		
	}

	@Override
	public void eventDelete(EventBoard eventBoard) {
		logger.info("eventDelet() : {}", eventBoard);

		int result = 0;
		result = adminDao.deleteEventFile(eventBoard);
		
		if(result != 0) {
			logger.info("파일 있음 삭제 완료 : {}", result);
			
		}else {
			logger.info("파일 없음 삭제 실패 : {}", result);
			
		}
		
		result = adminDao.deleteEventInfo(eventBoard);
		logger.info("이벤트 삭제 결과 : {}", result);		
	}

	@Override
	public EventBoard getEventHeadImg(EventBoard eventBoard) {
		
		eventBoard = adminDao.selectEventNo(eventBoard);
		
		return eventBoard;
	}

	//================================================================================
	//--- 게시판 관리 > 자유게시판 ---
	
	@Override
	public Paging getFreeBoardPaging(Paging param) {
		logger.info("getClassPaging()");
		
		//총 게시글 수 조회
		int totalCount = adminDao.freeBoardCntAll();
		logger.info("totalCount : {}",totalCount);
		
		//페이징 객체 생성(페이징 계산)
		Paging paging = new Paging(totalCount, param.getCurPage());
		
		return paging;
	}

	@Override
	public Map<String, Object> freeBoardList(Paging paging, int sort) {
		logger.info("freeBoardList()");
		
		List<FreeBoard> freeBoardList = new ArrayList<FreeBoard>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		String orderBy = null;
		
		map.put("paging", paging);
		map.put("sort", sort);
		
		freeBoardList = adminDao.selectFreeBoardAll(map);
		for(int i = 0; i< freeBoardList.size(); i++) {
			logger.info("freeBoardList() : {}", freeBoardList.get(i));
			
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("freeBoardList", freeBoardList);
		
		return result;
	}

	@Override
	public void deleteChecked(int[] freePostNo) {
		logger.info("deleteChecked()");
		
		int result = 0;
		//삭제할 첨부 파일 처리
		if( freePostNo != null ) {
			result = adminDao.deleteFreeFilesByFreeNo( freePostNo );
		}
		logger.info("deleteFreeFilesByFreeNo() : {}", result);

		if( freePostNo != null ) {
			result = adminDao.deletePostBoardNo(freePostNo);
		}
		logger.info("deleteFreeFilesByFreeNo() : {}", result);
		
	}

	@Override
	public Map<String, Object> freeBoardView(FreeBoard freeBoard, Paging param) {
		logger.info("freeBoardView()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<FreeBoardFile> freeBoardFiles = new ArrayList<FreeBoardFile>();
		
		freeBoard = adminDao.selectUserFreePost(freeBoard);
		logger.info("selectUserFreePost() : {}", freeBoard);

		map.put("freeBoard", freeBoard);
		
		freeBoardFiles = adminDao.selectFreePostFile(freeBoard);
		for(int i = 0; i<freeBoardFiles.size();i++) {
			logger.info("selectFreePostFile() : {}", freeBoardFiles);
		}
		map.put("freeBoardFiles", freeBoardFiles);
		
		UserInfo userInfo = new UserInfo();
		userInfo.setUserNo(freeBoard.getUserNo());
		userInfo = adminDao.selectUser(userInfo);
		logger.info("selectUser() : {}", userInfo);
		
		map.put("userInfo", userInfo);
		
		List<FreeComment> freeComment = new ArrayList<FreeComment>();
		List<UserInfo> userNameList = new ArrayList<UserInfo>();
		
		Paging paging = getFreeCommentPaging(param, freeBoard);
		logger.info("freeCommPaging() : {}", paging);
		
		map.put("paging", paging);

		if(paging.getTotalCount() != 0) {
			freeComment = adminDao.selectFreeCommentList(map);
			logger.info("selectFreeCommentList() : {}", freeComment);
			map.put("freeComment", freeComment);

			userNameList = adminDao.selectUserNameList(map);
			logger.info("selectUserNameList() : {}", userNameList);
			
		}
		
		result.put("freeBoard", freeBoard);
		result.put("freeBoardFiles", freeBoardFiles);
		result.put("paging", paging);
		result.put("freeComment", freeComment);
		result.put("userNameList", userNameList);
	
		
		return result;
	}
	
	public Paging getFreeCommentPaging(Paging param, FreeBoard freeBoard) {
		logger.info("getPaging()");
		
		//총 게시글 수 조회
		int totalCount = adminDao.freeCommentCntAll(freeBoard);
		logger.info("totalCount : {}",totalCount);
		
		//페이징 객체 생성(페이징 계산)
		Paging paging = new Paging(totalCount, param.getCurPage());
		
		return paging;
	}

}
