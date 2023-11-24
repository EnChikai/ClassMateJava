package admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import payment.dto.OrderTb;
import payment.dto.Payment;
import teacher.dto.Teacher;
import teacher.dto.TeacherApply;
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
		int secessionParam = 0;
		int userCount = adminDao.getUserCountAll(secessionParam);
		logger.info("userList : {}", userCount);
		
		
		//탈퇴 인원
		secessionParam = 1;
		int secessionUserCount = adminDao.getUserCountAll(secessionParam);
		logger.info("secessionUserList : {}", secessionUserCount);

		map.put("userCount", userCount);
		map.put("secessionUserCount", secessionUserCount);
		
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
		
		String orderBy = "user_no"; 
		
		switch (sort) {
			case 1:  orderBy = "user_no DESC";
				break;
			case 2:  orderBy = "user_name";
				break;
			case 3:  orderBy = "user_name DESC";
				break;
        
		}
		logger.info("orderBy");
		
		map.put("paging", paging);
		map.put("orderBy", orderBy);
		
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
		
		if(selectNo != 1) {
			AnnounceBoardFile announceBoardFile = new AnnounceBoardFile();
			announceBoardFile.setAnnounceNo( boardNo );
			announceBoardFile.setOriginName( originName );
			announceBoardFile.setStoredName( storedName );
			
			result = adminDao.insertAnnoFile(announceBoardFile);
			logger.info("insertAnnoFile : {}", result);
		}else {
			EventBoardFile eventBoardFile = new EventBoardFile();
			eventBoardFile.setEventNo(boardNo);
			eventBoardFile.setOriginName( originName );
			eventBoardFile.setStoredName( storedName );
			
			result = adminDao.insertEventFile(eventBoardFile);
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
	public AnnounceBoardFile getAnnounceFile(AnnounceBoardFile announceBoardFile) {

		announceBoardFile = adminDao.selectAnnoFileByFileNo(announceBoardFile);
		
		return announceBoardFile;
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
		logger.info("announceBoard.getEventName() : {}", announceBoard.getAnnounceName());

		if( announceBoard.getAnnounceContent() == null || announceBoard.getAnnounceName().equals("") ) {
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

}
