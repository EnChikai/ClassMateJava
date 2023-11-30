package main.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import board.dto.EventBoard;
import lecture.dto.Address;
import lecture.dto.Class;
import main.dto.MainCategory;
import main.dto.SubCategory;
import web.util.Paging;

public interface MainService {

	public Map<String, Object> MainPage(Class cLass, EventBoard eventBoard, Map<String,Object> map);

	public List<MainCategory> mainCategoryList();

	public List<SubCategory> subCategoryList(SubCategory subCategory);

	public Map<String, Object> onClassList(Class cLass, Paging paging);
	
	public Map<String, Object> offClassList(Class cLass, Paging paging);

	public Map<String, Object> onClassList(Class cLass, Paging paging, String sort);

	public Map<String, Object> offClassList(Class cLass, Paging paging, String sort);

	public List<Class> ClassViewList(Class cLass);
	
	public boolean payment(Class cLass, HttpSession session);

	public int basket(Class cLass, HttpSession session);

	public Address getAddress(Class cLass);

	public void endClass();






}
