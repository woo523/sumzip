package board;

import java.sql.Timestamp;

public class ReplyDTO {
   private int rno;
   private int no;
   private int bno;
   private String riply;
   private Timestamp rdate;
   
   public int getRno() {
	   return rno;
   }
   public void setRno(int rno) {
	   this.rno = rno;
   }
   public int getNo() {
	   return no;
   }
   public void setNo(int no) {
	   this.no = no;
   }
   public int getBno() {
	   return bno;
   }
   public void setBno(int bno) {
	   this.bno = bno;
   }
   public String getRiply() {
	   return riply;
   }
   public void setRiply(String riply) {
	   this.riply = riply;
   }
   public Timestamp getRdate() {
	   return rdate;
   }
   public void setRdate(Timestamp rdate) {
	   this.rdate = rdate;
   }
  
}
