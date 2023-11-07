package payment.dto;

public class Basket {

	private int basketNo;
	private int userNo;
	private int classNo;
	
	public Basket() {}

	@Override
	public String toString() {
		return "Basket [basketNo=" + basketNo + ", userNo=" + userNo + ", classNo=" + classNo + "]";
	}

	public Basket(int basketNo, int userNo, int classNo) {
		super();
		this.basketNo = basketNo;
		this.userNo = userNo;
		this.classNo = classNo;
	}

	public int getBasketNo() {
		return basketNo;
	}

	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	
	
}
