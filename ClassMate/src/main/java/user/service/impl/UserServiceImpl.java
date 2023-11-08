package user.service.impl;

import org.apache.catalina.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.dao.face.UserDao;
import user.dto.UserInfo;
import user.service.face.UserService;
@Service
public class UserServiceImpl implements UserService{
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired UserDao userDao;

	
	@Override
	public void join(UserInfo userInfo) {
		
	}
	
	@Override
	public UserInfo loginPost(UserInfo userInfo) {
		return userDao.selectUser( userInfo );
	}

	@Override
	public User findUserByUsername(String username) {
		return userDao.searchId(username);
	}

	
		
}
