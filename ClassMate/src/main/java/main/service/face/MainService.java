package main.service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lecture.dto.Class;
import main.dto.MainCategory;
import main.dto.SubCategory;
import user.dto.UserInfo;
import web.util.MainClassListPaging;
import web.util.Paging;

public interface MainService {

	public List<UserInfo> listAll();

	public List<MainCategory> mainCategoryList();

	public List<SubCategory> subCategoryList(SubCategory subCategory);

	public Map<String, Object> onClassList(Class cLass, MainClassListPaging paging);

	public List<Class> offClassList(Class cLass);


}
