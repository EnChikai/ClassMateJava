package main.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import board.dto.EventBoard;
import lecture.dto.Class;
import main.dao.face.MainDao;
import main.dto.MainCategory;
import main.dto.SubCategory;
import main.service.face.MainService;
import user.dto.UserInfo;
import web.util.MainClassListPaging;

@Service
public class MainServiceImpl implements MainService{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MainDao mainDao;
	
	@Override
	public Map<String, Object> MainPage(Class cLass, EventBoard eventBoard, Map<String,Object> map) {
		List<EventBoard> selectByEventFileList = mainDao.selectByEventFile();
		int onOff = 1;
		List<Class> onClassOrderTopList = mainDao.ClassOrderTop(onOff);
		List<Class> onRecommended = mainDao.recommended(onOff);
		onOff = 0;
		List<Class> offClassOrderTopList = mainDao.ClassOrderTop(onOff);
		List<Class> offRecommended = mainDao.recommended(onOff);
		map.put("selectByEventFileList", selectByEventFileList);
		map.put("onClassOrderTopList", onClassOrderTopList);
		map.put("onRecommended", onRecommended);
		map.put("offClassOrderTopList", offClassOrderTopList);
		map.put("offRecommended", offRecommended);
		
		return map;
	}


	@Override
	public List<MainCategory> mainCategoryList() {
		
		return mainDao.mainCategoryList();
	}

	@Override
	public List<SubCategory> subCategoryList(SubCategory subCategory) {
		return mainDao.subCategoryList(subCategory);
	}

	
	@Override
	public Map<String, Object> onClassList(Class cLass, MainClassListPaging paging) {
		System.out.println(cLass.getSubCategoryNo());
		
	    //총 게시글 수 조회
	    int totalCount = mainDao.mainOnClassCntAll(cLass);
	    
//	    logger.info("totalCount {}", totalCount);
	      
	    //페이징 객체 생성(페이징 계산)
	    MainClassListPaging paging1 = new MainClassListPaging(totalCount, paging.getCurPage());
		
		Map<String, Object> map = new HashMap<>();
		map.put("cLass", cLass);
		map.put("paging1", paging1);
		
//		logger.info("cLass {}", cLass);
//		logger.info("paging1 {}", paging1);
		
		List<Class> list = mainDao.onClassList(map);
		
		map.put("list", list);
		
		
		return  map;
	}

	@Override
	public Map<String, Object> offClassList(Class cLass, MainClassListPaging paging) {
		System.out.println(cLass.getSubCategoryNo());
		
	    //총 게시글 수 조회
	    int totalCount = mainDao.mainOffClassCntAll(cLass);
	    
//	    logger.info("totalCount {}", totalCount);
	      
	    //페이징 객체 생성(페이징 계산)
	    MainClassListPaging paging1 = new MainClassListPaging(totalCount, paging.getCurPage());
		
		Map<String, Object> map = new HashMap<>();
		map.put("cLass", cLass);
		map.put("paging1", paging1);
		
//		logger.info("cLass {}", cLass);
//		logger.info("paging1 {}", paging1);
		
		List<Class> list = mainDao.offClassList(map);
		
		map.put("list", list);
		
		
		return  map;
	}

	@Override
	public Map<String, Object> onClassList(Class cLass, MainClassListPaging paging, String sort) {
		System.out.println(cLass.getSubCategoryNo());
		
	    //총 게시글 수 조회
	    int totalCount = mainDao.mainOnClassCntAll(cLass);
	    
//	    logger.info("totalCount {}", totalCount);
	      
	    //페이징 객체 생성(페이징 계산)
	    MainClassListPaging paging1 = new MainClassListPaging(totalCount, paging.getCurPage());
		
		Map<String, Object> map = new HashMap<>();
		map.put("cLass", cLass);
		map.put("paging1", paging1);
		map.put("sort", sort);
		logger.info("cLass {}", cLass);
		logger.info("paging1 {}", paging1);
		logger.info("sort {}", sort);
		
		List<Class> list = mainDao.onClassSortList(map);
		
		map.put("list", list);
		
		
		return  map;
	}

	@Override
	public Map<String, Object> offClassList(Class cLass, MainClassListPaging paging, String sort) {
		System.out.println(cLass.getSubCategoryNo());
		
	    //총 게시글 수 조회
	    int totalCount = mainDao.mainOffClassCntAll(cLass);
	    
//	    logger.info("totalCount {}", totalCount);
	      
	    //페이징 객체 생성(페이징 계산)
	    MainClassListPaging paging1 = new MainClassListPaging(totalCount, paging.getCurPage());
		
		Map<String, Object> map = new HashMap<>();
		map.put("cLass", cLass);
		map.put("paging1", paging1);
		map.put("sort", sort);
		logger.info("cLass {}", cLass);
		logger.info("paging1 {}", paging1);
		logger.info("sort {}", sort);
		
		List<Class> list = mainDao.offClassSortList(map);
		
		map.put("list", list);
		
		
		return  map;
	}

	@Override
	public List<Class> ClassViewList(Class cLass) {
		return mainDao.onClassViewList(cLass);
	}

	@Override
	public int basket(Class cLass, HttpSession session) {
		
		//Class 중복검사
		Integer res = mainDao.duplicationBasket(cLass);
		System.out.println(res);

		
		//Class 중복아니니까 insert 진행
		if( res == null ) {
		Map<String,Object> map = new HashMap<>();
		map.put("userNo", session.getAttribute("userNo"));
		map.put("cLass", cLass);
		mainDao.insertBasket(map);
		
		return 0;
		}
		
		return 1;
	}


}
