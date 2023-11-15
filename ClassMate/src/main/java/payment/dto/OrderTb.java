package payment.dto;

public class OrderTb {
	private int orderNo;
	private int userNo;
	private int classNo;
	private long merchantUid;
	
	public OrderTb() {}

	public OrderTb(int orderNo, int userNo, int classNo, long merchantUid) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.classNo = classNo;
		this.merchantUid = merchantUid;
	}

	@Override
	public String toString() {
		return "OrderTb [orderNo=" + orderNo + ", userNo=" + userNo + ", classNo=" + classNo + ", merchantUid="
				+ merchantUid + "]";
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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

	public long getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(long merchantUid) {
		this.merchantUid = merchantUid;
	}

}
