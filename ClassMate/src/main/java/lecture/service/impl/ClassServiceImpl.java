package lecture.service.impl;

import org.slf4j.Logger;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lecture.dao.face.ClassDao;
import lecture.service.face.ClassService;
import user.dto.UserInfo;
import lecture.dto.Address;
import lecture.dto.Class;

@Service
public class ClassServiceImpl implements ClassService {
	
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired ClassDao classDao;
	
	@Override
	public UserInfo whoAmI(UserInfo userInfo) {
		int userNo = classDao.getUserNoByUserId(userInfo);
		userInfo.setUserNo(userNo);
		return userInfo;
	}
	
	@Override
	public List<Class> classList(UserInfo userInfo) {		
		List<Class> lecture = classDao.selectClassListByUser(userInfo);
		logger.info("lecture : {}", lecture);
		return lecture;
//		return classDao.selectClassListByUser(userInfo);
	}

	@Override
	public Map<String, Object> lectureOff(Class lecture) {
		Address address = classDao.selectAddressByClass(lecture);
		lecture = classDao.selectClassByClassNo(lecture);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lecture", lecture);
		map.put("address", address);
		return map;
	}

}
