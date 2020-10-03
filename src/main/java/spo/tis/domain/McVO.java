package spo.tis.domain;

import java.util.Date;

public class McVO {

      private int mcno;
      private int idx;
      private int cno;
      private int mcstate;
      private int grade;
      private Date intdate;
      private Date outdate;
      
      private String cname;
      private String cking;
      private String csports;
      private String cplace;
      
      public String getCplace() {
         return cplace;
      }


      public void setCplace(String cplace) {
         this.cplace = cplace;
      }
      
      public String getCname() {
         return cname;
      }

      public void setCname(String cname) {
         this.cname = cname;
      }

      public String getCking() {
         return cking;
      }

      public void setCking(String cking) {
         this.cking = cking;
      }

      public String getCsports() {
         return csports;
      }

      public void setCsports(String csports) {
         this.csports = csports;
      }

      @Override
      public String toString() {
         return "McVO [mcno=" + mcno + ", idx=" + idx + ", cno=" + cno + ", mcstate=" + mcstate + ", grade=" + grade
               + ", intdate=" + intdate + ", outdate=" + outdate + ", cname=" + cname + ", cking=" + cking
               + ", csports=" + csports + "]";
      }

      public int getMcno() {
         return mcno;
      }

      public void setMcno(int mcno) {
         this.mcno = mcno;
      }

      public int getIdx() {
         return idx;
      }

      public void setIdx(int idx) {
         this.idx = idx;
      }

      public int getCno() {
         return cno;
      }

      public void setCno(int cno) {
         this.cno = cno;
      }

      public int getMcstate() {
         return mcstate;
      }

      public void setMcstate(int mcstate) {
         this.mcstate = mcstate;
      }

      public int getGrade() {
         return grade;
      }

      public void setGrade(int grade) {
         this.grade = grade;
      }

      public Date getIntdate() {
         return intdate;
      }

      public void setIntdate(Date intdate) {
         this.intdate = intdate;
      }

      public Date getOutdate() {
         return outdate;
      }

      public void setOutdate(Date outdate) {
         this.outdate = outdate;
      }
      
      
}