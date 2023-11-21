package user.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teacher.dto.Teacher;
import user.dao.face.UserDao;
import user.dto.UserInfo;
import user.service.face.UserService;
@Service
public class UserServiceImpl implements UserService{
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired UserDao userDao;

	
	@Override
	public void join(UserInfo userInfo) {
		userDao.insertUser(userInfo);
	}
	
	@Override
	public UserInfo loginPost(UserInfo userInfo) {
		return userDao.selectUser( userInfo );
	}

	//강사 번호
	@Override //강사 번호
	public Teacher getTeacherNo(Teacher teacher) { //강사 번호
		
		return userDao.getTeachNo(teacher); //강사 번호
	} //강사 번호

    @Override
    public boolean checkDuplicateId(String userId) {
        int count = userDao.checkDuplicateId(userId);
        return count > 0;
    }

	@Override
	public UserInfo updateInfo(UserInfo userInfo) {
		logger.info("userInfo: {}",userInfo);
		UserInfo data = userDao.selectUserByNo( userInfo );
		logger.info("a: {}",data);
		return data;
	}

	@Override
	public int updateOutUser(UserInfo userInfo) {
		logger.info("updateOutUser()");
		logger.info("userInfo : {}", userInfo);
//		int data = userDao.deleteUserData( userInfo );
		int data = userDao.updateUserDataout( userInfo );
		logger.info("a: {}",data);
		return data;
		
	}

	@Override
	public int updateUserData(UserInfo userInfo) {
		logger.info("updateUserData()");
		int result = userDao.updateUserData(userInfo);
		return result;
	}


}
