package main.dto;

public class MainCategory {
	private int mainCategoryNo;
	private String mainCategoryName;
	
	public MainCategory() {}

	@Override
	public String toString() {
		return "MainCategory [mainCategoryNo=" + mainCategoryNo + ", mainCategoryName=" + mainCategoryName + "]";
	}

	public MainCategory(int mainCategoryNo, String mainCategoryName) {
		super();
		this.mainCategoryNo = mainCategoryNo;
		this.mainCategoryName = mainCategoryName;
	}

	public int getMainCategoryNo() {
		return mainCategoryNo;
	}

	public void setMainCategoryNo(int mainCategoryNo) {
		this.mainCategoryNo = mainCategoryNo;
	}

	public String getMainCategoryName() {
		return mainCategoryName;
	}

	public void setMainCategoryName(String mainCategoryName) {
		this.mainCategoryName = mainCategoryName;
	}
	
	
}
