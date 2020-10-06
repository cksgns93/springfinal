package spo.tis.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class matchaddVO {

	private int mno;
	private int tno; //팀번호
	private int idx; //회원번호
	private String game;
	private String mname;
	private String away;
	private String mcontent;
	private String tlevel;
	private Date mdate;
	private String addr;
	private String hp1;
	private String hp2;
	private String hp3;
	private String map;
	private Date mupdate;
	
	private int mmno;
	private int mtidx;
	private int iidx;
	
	//추가
	private int start;
	private int end;
	
	private String findType;
	private String findKeyword;
	private String selSports;

	public matchaddVO() {}
	
	public matchaddVO(int mno, int tno, int idx, String game,String mname, String away, String mcontent, Date mdate, String addr, String hp1, String hp2, String hp3, String map,
			String tlevel, Date mupdate) {
		this.mno = mno;
		this.tno = tno;
		this.idx = idx;
		this.mname = mname;
		this.game = game;
		this.away = away;
		this.tlevel = tlevel;
		this.mcontent = mcontent;
		this.mdate = mdate;
		this.addr = addr;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.map = map;
		this.mupdate = mupdate;
	}

	
}
