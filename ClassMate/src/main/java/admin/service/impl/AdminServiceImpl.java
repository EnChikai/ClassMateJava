package admin.service.impl;

import java.util.List;

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
		logger.info("getPaging(Paging param)");
		
		//총 게시글 수 조회
		int totalCount = adminDao.userInfoCntAll();
		logger.info("totalCount : {}",totalCount);
		
		//페이징 객체 생성(페이징 계산)
		Paging paging = new Paging(totalCount, param.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<UserInfo> userInfoList(Paging paging) {
		logger.info("userInfoList(Paging param)");
		
		List<UserInfo> list = adminDao.selectUserAll(paging);
		logger.info("list : {}",list);
		
		if(list != null) {
			logger.info("조회성공");
		}else {
			logger.info("조회실패");
		}
		
		return list;
	}

}
