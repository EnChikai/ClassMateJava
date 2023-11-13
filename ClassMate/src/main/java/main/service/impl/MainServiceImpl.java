package main.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lecture.dto.Class;
import main.dao.face.MainDao;
import main.dto.MainCategory;
import main.dto.SubCategory;
import main.service.face.MainService;
import user.dto.UserInfo;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired MainDao mainDao;

	@Override
	public List<UserInfo> listAll() {
		return mainDao.listAll();
	}

	@Override
	public List<MainCategory> mainCategoryList() {
		
		return mainDao.mainCategoryList();
	}

	@Override
	public List<SubCategory> subCategoryList(SubCategory subCategory) {
		return mainDao.subCategoryList(subCategory);
	}

	@Override
	public List<Class> onClassList(Class cLass) {
		List<Class> list = mainDao.onClassList(cLass);
		return  list;
	}

	@Override
	public List<Class> offClassList(Class cLass) {
		List<Class> list = mainDao.offClassList(cLass);
		return list;
	}

}
