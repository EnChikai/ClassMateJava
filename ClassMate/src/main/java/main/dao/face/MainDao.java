package main.dao.face;

import java.util.List;
import java.util.Map;

import board.dto.EventBoard;
import lecture.dto.Address;
import lecture.dto.Class;
import main.dto.MainCategory;
import main.dto.SubCategory;

public interface MainDao {

	public List<EventBoard> selectByEventFile();

	public List<Class> ClassOrderTop(int onOff);

	public List<Class> recommended(int onOff);

	public List<MainCategory> mainCategoryList();

	public List<SubCategory> subCategoryList(SubCategory subCategory);

	public Integer mainOnClassCntAll(Class cLass);
	
	public List<Class> onClassList(Map<String, Object> map);
	
	public Integer mainOffClassCntAll(Class cLass);
	
	public List<Class> offClassList(Map<String, Object> map);

	public List<Class> onClassSortList(Map<String, Object> map);

	public List<Class> offClassSortList(Map<String, Object> map);

	public List<Class> onClassViewList(Class cLass);

	public Integer duplicationPayment(Map<String, Object> map);
	
	public Integer duplicationBasket(Map<String, Object> map);

	public void insertBasket(Map<String, Object> map);

	public Address getAddress(Class cLass);

	public void endClass();













}
