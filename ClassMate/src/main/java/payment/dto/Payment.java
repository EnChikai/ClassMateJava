package payment.dto;

import java.sql.Date;

public class Payment {
	private int payNo;
	private long orderNo;
	private Date payDate;
	private int payment;
	private String payMethod;
	private String provider;
	private String cardName;
	
	public Payment() {}

	public Payment(int payNo, long orderNo, Date payDate, int payment, String payMethod, String provider,
			String cardName) {
		super();
		this.payNo = payNo;
		this.orderNo = orderNo;
		this.payDate = payDate;
		this.payment = payment;
		this.payMethod = payMethod;
		this.provider = provider;
		this.cardName = cardName;
	}

	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", orderNo=" + orderNo + ", payDate=" + payDate + ", payment=" + payment
				+ ", payMethod=" + payMethod + ", provider=" + provider + ", cardName=" + cardName + "]";
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
}
