package main.dto;

public class SubCategory {
	private int subCategoryNo;
	private int mainCategoryNo;
	private String subCategoryName;
	
	public SubCategory() {}

	public SubCategory(int subCategoryNo, int mainCategoryNo, String subCategoryName) {
		super();
		this.subCategoryNo = subCategoryNo;
		this.mainCategoryNo = mainCategoryNo;
		this.subCategoryName = subCategoryName;
	}

	@Override
	public String toString() {
		return "SubCategory [subCategoryNo=" + subCategoryNo + ", mainCategoryNo=" + mainCategoryNo
				+ ", subCategoryName=" + subCategoryName + "]";
	}

	public int getSubCategoryNo() {
		return subCategoryNo;
	}

	public void setSubCategoryNo(int subCategoryNo) {
		this.subCategoryNo = subCategoryNo;
	}

	public int getMainCategoryNo() {
		return mainCategoryNo;
	}

	public void setMainCategoryNo(int mainCategoryNo) {
		this.mainCategoryNo = mainCategoryNo;
	}

	public String getSubCategoryName() {
		return subCategoryName;
	}

	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}

}
