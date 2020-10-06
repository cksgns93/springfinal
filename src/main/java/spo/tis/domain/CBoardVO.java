package spo.tis.domain;

import java.sql.Timestamp;

public class CBoardVO {
	
	private int cbno;
	private int cno;
	private int idx;
	private String cbtitle;
	private String cbcontent;
	private String cbimage;
	private Timestamp cbupdate;
	private int cbreadnum;
	
	//paging시 필요
	private int start;
	private int end;
	
	//join시 필요한 것
	private String name;
	private String id;
	
	public CBoardVO(){ }


	public CBoardVO(int cbno, int cno, int idx, String cbtitle, String cbcontent, String cbimage, Timestamp cbupdate,
			int cbreadnum) {
		super();
		this.cbno = cbno;
		this.cno = cno;
		this.idx = idx;
		this.cbtitle = cbtitle;
		this.cbcontent = cbcontent;
		this.cbimage = cbimage;
		this.cbupdate = cbupdate;
		this.cbreadnum = cbreadnum;
	}


	//setter, getter
	public int getCbno() {
		return cbno;
	}

	public void setCbno(int cbno) {
		this.cbno = cbno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getCbtitle() {
		return cbtitle;
	}

	public void setCbtitle(String cbtitle) {
		this.cbtitle = cbtitle;
	}

	public String getCbcontent() {
		return cbcontent;
	}

	public void setCbcontent(String cbcontent) {
		this.cbcontent = cbcontent;
	}

	public String getCbimage() {
		return cbimage;
	}

	public void setCbimage(String cbimage) {
		this.cbimage = cbimage;
	}

	public Timestamp getCbupdate() {
		return cbupdate;
	}

	public void setCbupdate(Timestamp cbupdate) {
		this.cbupdate = cbupdate;
	}

	public int getCbreadnum() {
		return cbreadnum;
	}


	public void setCbreadnum(int cbreadnum) {
		this.cbreadnum = cbreadnum;
	}

	//paging
	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
	}
	
	
	//추가
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
