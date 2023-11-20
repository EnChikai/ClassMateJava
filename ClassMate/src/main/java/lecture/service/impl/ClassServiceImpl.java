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
import lecture.dto.ClassVideo;
import lecture.dto.QuestionAnswer;

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
	public List<Class> allLecture(UserInfo userInfo) {		
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

	@Override
	public Map<String, Object> lectureOn(Class lecture) {
		
		logger.info("강의번호 : {}", lecture.getClassNo());
		Map<String, Object> map = new HashMap<String, Object>();
		
		//모든정보가 들어가므로 최적화 시 변수다르게 강의번호만 넣기
		lecture = classDao.selectClassByClassNo(lecture);
		List<ClassVideo> classVideo = classDao.selectClassVideoByClass(lecture);
		List<QuestionAnswer> qa = classDao.selectQuestionAnswerByClass(lecture);
		
		logger.info("lecture : {}", lecture);
		logger.info("ClassVideo : {}", classVideo);
		logger.info("QuestionAnswer : {}", qa);
		
		map.put("lecture", lecture);
		map.put("classVideo", classVideo);
		map.put("questionAnswer", qa);
		
		return map;
	}
	
	@Override
	public List<QuestionAnswer> allQABoardList(Class lecture) {

		return classDao.selectQuestionAnswerByClass(lecture); 
	}
	
	@Override
	public List<Class> myLectureOn(UserInfo userInfo) {
		List<Class> myLecture = classDao.selectClassListByUser(userInfo);
		
		return myLecture;
	}

	@Override
	public void insertQA(QuestionAnswer questionAnswer) {

	classDao.insertQA(questionAnswer);
	}
}
