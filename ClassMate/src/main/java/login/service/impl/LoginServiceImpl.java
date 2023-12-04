package login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import login.dao.face.LoginDao;
import login.service.face.LoginService;
import user.dto.UserInfo;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired LoginDao loginDao;
	
	@Override
	public boolean isOurClient(UserInfo userInfo) {
		UserInfo result = loginDao.selectUserByEmail(userInfo);
		if (result != null) return true;
		return false;
	}

	@Override
	public void socialJoin(UserInfo userInfo) {
		loginDao.insertUser(userInfo);
	}
	
	@Override
	public UserInfo getUserData(UserInfo userInfo) {
		return loginDao.selectUser(userInfo);
	}
}
