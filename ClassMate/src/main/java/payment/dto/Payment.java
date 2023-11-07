package payment.dto;

import java.sql.Date;

public class Payment {
	private int payNo;
	private int orderNo;
	private Date payDate;
	private String payAcess;
	private int payment;
	
	public Payment() {}

	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", orderNo=" + orderNo + ", payDate=" + payDate + ", payAcess=" + payAcess
				+ ", payment=" + payment + "]";
	}

	public Payment(int payNo, int orderNo, Date payDate, String payAcess, int payment) {
		super();
		this.payNo = payNo;
		this.orderNo = orderNo;
		this.payDate = payDate;
		this.payAcess = payAcess;
		this.payment = payment;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getPayAcess() {
		return payAcess;
	}

	public void setPayAcess(String payAcess) {
		this.payAcess = payAcess;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}
	
	
}
