package admin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.face.AdminDao;
import admin.service.face.AdminService;
import board.dto.AnnounceBoard;
import board.dto.EventBoard;
import user.dto.UserInfo;
import web.util.Paging;

@Service
public class AdminServiceImpl implements AdminService{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private AdminDao adminDao;
	
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
	public int userInfoUpdate(UserInfo userdata) {
		logger.info("userInfoUpdate()");
		
		int result = 0;
		if(userdata != null) {
			result = adminDao.updateUser(userdata);
		}
		logger.info("updata result : {}", result);
		
		return result;
	}

	@Override
	public int secessionUser(UserInfo userdata) {
		
		int result = 0;
		if(userdata.getUserNo() != 0) {
			result = adminDao.setSecessionUser(userdata);
		}
		logger.info("setSecessionUser result : {}", result);
		
		return 0;
	}

	@Override
	public Map<String, Object> getBoardPaging(Paging param) {
		logger.info("getPaging()");
		
		//총 게시글 수 조회
		int announceTotalCount = adminDao.announceBoardCntAll();
		logger.info("totalCount : {}",announceTotalCount);
		
		int eventTotalCount = adminDao.eventBoardCntAll();
		logger.info("totalCount : {}",eventTotalCount);
		
		//페이징 객체 생성(페이징 계산)
		Paging announcePaging = new Paging(announceTotalCount, param.getCurPage());
		Paging eventPaging = new Paging(eventTotalCount, param.getCurPage());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("announcePaging", announcePaging);
		map.put("eventPaging", eventPaging);
		
		return map;
	}

	@Override
	public Map<String, Object> boardList(Map<String, Object> pagingMap) {
		logger.info("boardList() : {}", pagingMap);
		
		List<EventBoard> eventBoardList = new ArrayList<EventBoard>();
		List<AnnounceBoard> announceBoardList = new ArrayList<AnnounceBoard>();
		
		eventBoardList = adminDao.selectEventBoardAll(pagingMap);
		announceBoardList = adminDao.selectAnnounceBoardAll(pagingMap);
		
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
	public AnnounceBoard getAnnounceView(AnnounceBoard announceBoard) {
		logger.info("getAnnounceView() : {}", announceBoard.getAnnounceNo());
		
		announceBoard = adminDao.selectAnnounceNo(announceBoard);
		if(announceBoard != null) {
			logger.info("조회 성공 announceBoard() : {}", announceBoard);
		}else {
			logger.info("조회 실패 announceBoard() : {}", announceBoard);
		}
		
		return announceBoard;
	}

}
