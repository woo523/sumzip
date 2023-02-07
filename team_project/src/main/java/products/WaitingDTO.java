package products;

import java.sql.Timestamp;

public class WaitingDTO {
	private int wno; //대기번호
	private int pno; //상품번호
	private int no; //유저번호
	private Timestamp wdate;
	
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Timestamp getWdate() {
		return wdate;
	}
	public void setWdate(Timestamp wdate) {
		this.wdate = wdate;
	}
	
}
