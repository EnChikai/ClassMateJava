package lecture.service.impl;

import org.slf4j.Logger;
import java.util.List;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lecture.dao.face.ClassDao;
import lecture.service.face.ClassService;
import user.dto.UserInfo;
import lecture.dto.Class;

@Service
public class ClassServiceImpl implements ClassService {
	
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired ClassDao classDao;
	
	@Override
	public List<Class> classList(UserInfo userInfo) {
		
		int userNo = classDao.getUserNoByUserId(userInfo);
		
		userInfo.setUserNo(userNo);
		
		logger.info("userInfo : {}", userInfo);
		
//		List<Class> lecture = classDao.selectClassListByUser(userInfo);
//		
//		logger.info("lecture : {}", lecture);
//		
//		return lecture;
		
		return classDao.selectClassListByUser(userInfo);
	}

}
