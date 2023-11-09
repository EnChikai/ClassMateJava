package main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.dao.face.MainDao;
import main.service.face.MainService;
import user.dto.UserInfo;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired MainDao mainDao;

	@Override
	public List<UserInfo> listAll() {
		return mainDao.listAll();
	}

}
