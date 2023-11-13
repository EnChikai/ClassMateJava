package main.dao.face;

import java.util.List;

import lecture.dto.Class;
import main.dto.MainCategory;
import main.dto.SubCategory;
import user.dto.UserInfo;

public interface MainDao {

	public List<UserInfo> listAll();

	public List<MainCategory> mainCategoryList();

	public List<SubCategory> subCategoryList(SubCategory subCategory);

	public List<Class> onClassList(Class cLass);

	public List<Class> offClassList(Class cLass);




}
