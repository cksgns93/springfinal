package spo.tis.domain;

import lombok.Data;

@Data
public class ClubVO {

	private int cno; //모임 번호
	private String cname; //모임 이름
	private String csports; //종목
	private String cking; //모임장
	private int cnumber; //클럽 인원수
	private String cplace; //지역
	private String cinfo; //모임 소개
	private String chp1; //전화번호
	private String chp2;
	private String chp3;
	private int cstate; //활동상태 
	private String cimage; //모임사진(메인)
	
	//추가
	private int idx; //회원번호
	
	@Override
	public String toString() {
		return "ClubVO [cno=" + cno + ", cname=" + cname + ", csports=" + csports + ", cking=" + cking + ", cnumber="
				+ cnumber + ", cplace=" + cplace + ", cinfo=" + cinfo + ", chp1=" + chp1 + ", chp2=" + chp2 + ", chp3="
				+ chp3 + ", cstate=" + cstate + "]";
	}
	
	//start, end
	private int start;
	private int end;
	
	//검색
	private String findType; //검색종류
	private String findKeyword; //검색내용
	private String sportsType; //스포츠 종류 
	
	//검색 폼
	private String findTypeh; //검색종류
	private String findKeywordh; //검색내용
	private String sportsTypeh; //스포츠 종류 
	
	public ClubVO(){  
		
	}
	
	public ClubVO(int cno, String cname, String csports, String cking, int cnumber, String cplace, String cinfo,
			String chp1, String chp2, String chp3, int cstate, String cimage) {
		super();
		this.cno = cno;
		this.cname = cname;
		this.csports = csports;
		this.cking = cking;
		this.cnumber = cnumber;
		this.cplace = cplace;
		this.cinfo = cinfo;
		this.chp1 = chp1;
		this.chp2 = chp2;
		this.chp3 = chp3;
		this.cstate = cstate;
		this.cimage = cimage;
	}

	
	
	public ClubVO(String cname, String csports, String cplace, String cinfo, String chp1, String chp2, String chp3,
			String cimage) {
		super();
		this.cname = cname;
		this.csports = csports;
		this.cplace = cplace;
		this.cinfo = cinfo;
		this.chp1 = chp1;
		this.chp2 = chp2;
		this.chp3 = chp3;
		this.cimage = cimage;
	}

}


