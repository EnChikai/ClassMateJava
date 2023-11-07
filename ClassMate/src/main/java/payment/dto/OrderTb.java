package payment.dto;

public class OrderTb {
	private int orderNno;
	private int userNo;
	private int classNo;
	
	public OrderTb() {}

	@Override
	public String toString() {
		return "OrderTb [orderNno=" + orderNno + ", userNo=" + userNo + ", classNo=" + classNo + "]";
	}

	public OrderTb(int orderNno, int userNo, int classNo) {
		super();
		this.orderNno = orderNno;
		this.userNo = userNo;
		this.classNo = classNo;
	}

	public int getOrderNno() {
		return orderNno;
	}

	public void setOrderNno(int orderNno) {
		this.orderNno = orderNno;
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
