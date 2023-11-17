package main.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<UserInfo> listAll() {
		return mainDao.listAll();
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
	public List<Class> onClassViewList(Class cLass) {
		return mainDao.onClassViewList(cLass);
	}



}
