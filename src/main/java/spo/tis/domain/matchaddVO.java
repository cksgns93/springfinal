package spo.tis.domain;

import java.sql.Date;

public class matchaddVO {

	private int mno;
	private int tno;
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
	
	public int getMmno() {
		return mmno;
	}


	public void setMmno(int mmno) {
		this.mmno = mmno;
	}


	public int getIidx() {
		return iidx;
	}


	public void setIidx(int iidx) {
		this.iidx = iidx;
	}


	public matchaddVO() {
		
		
	}

	
	public matchaddVO(int mno, int tno, String game,String mname, String away, String mcontent, Date mdate, String addr, String hp1, String hp2, String hp3, String map,
			String tlevel, Date mupdate) {
		this.mno = mno;
		this.tno = tno;
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

	public String getHp1() {
		return hp1;
	}


	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}


	public String getHp2() {
		return hp2;
	}


	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}


	public String getHp3() {
		return hp3;
	}


	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}


	public String getGame() {
		return game;
	}


	public void setGame(String game) {
		this.game = game;
	}



	public String getTlevel() {
		return tlevel;
	}


	public void setTlevel(String tlevel) {
		this.tlevel = tlevel;
	}


	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getAway() {
		return away;
	}

	public void setAway(String away) {
		this.away = away;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public Date getMdate() {
		return mdate;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	public Date getMupdate() {
		return mupdate;
	}

	public void setMupdate(Date mupdate) {
		this.mupdate = mupdate;
	}


	public int getMtidx() {
		return mtidx;
	}


	public void setMtidx(int mtidx) {
		this.mtidx = mtidx;
	}
	
}
