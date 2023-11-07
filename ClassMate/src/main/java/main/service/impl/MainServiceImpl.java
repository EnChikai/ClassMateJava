package main.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.dao.face.MainDao;
import main.service.face.MainService;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired MainDao mainDao;

}
