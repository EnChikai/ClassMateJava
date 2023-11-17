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
	public UserInfo updateUserData(UserInfo userInfo) {
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
	public UserInfo findIdPwByEmail(String email) {
	       // 실제로는 데이터베이스에서 해당 이메일에 대한 아이디 및 비밀번호 정보를 조회하는 로직을 작성해야 합니다.
        // 여기서는 간단한 예제로 사용자가 입력한 이메일에 대한 정보를 바로 반환하는 것으로 가정합니다.
        return userDao.findUserByEmail(email);	}

	@Override
	public UserInfo findIdByEmailAndName(String email, String name) {
		// TODO Auto-generated method stub
		return null;
	}
}
