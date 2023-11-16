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
import user.dto.UserInfo;
import web.util.Paging;

@Service
public class AdminServiceImpl implements AdminService{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminDao adminDao;
	
	@Override
	public Paging getUserPaging(Paging param) {
		logger.info("getPaging()");
		
		//총 게시글 수 조회
		int totalCount = adminDao.userInfoCntAll();
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

}
