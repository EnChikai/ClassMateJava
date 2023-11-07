package main.dto;

public class SubCategory {
	private int subCategoryNo;
	private int mainCategoryNo;
	
	public SubCategory() {}

	@Override
	public String toString() {
		return "SubCategory [subCategoryNo=" + subCategoryNo + ", mainCategoryNo=" + mainCategoryNo + "]";
	}

	public SubCategory(int subCategoryNo, int mainCategoryNo) {
		super();
		this.subCategoryNo = subCategoryNo;
		this.mainCategoryNo = mainCategoryNo;
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
	
	
}
