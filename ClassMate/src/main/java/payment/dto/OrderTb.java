package payment.dto;

public class OrderTb {
	private int orderNo;
	private int userNo;
	private int classNo;
	private String merchantUid;
	private int refund;
	
	public OrderTb() {}

	@Override
	public String toString() {
		return "OrderTb [orderNo=" + orderNo + ", userNo=" + userNo + ", classNo=" + classNo + ", merchantUid="
				+ merchantUid + ", refund=" + refund + "]";
	}

	public OrderTb(int orderNo, int userNo, int classNo, String merchantUid, int refund) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.classNo = classNo;
		this.merchantUid = merchantUid;
		this.refund = refund;
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

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public int getRefund() {
		return refund;
	}

	public void setRefund(int refund) {
		this.refund = refund;
	}
	
}
