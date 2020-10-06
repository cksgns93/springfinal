package spo.tis.domain;

import java.sql.Date;

public class CPictureVO {
	
	private int cpno; 
	private String cpimage;
	private String cptitle;
	private Date cpdate;
	private int cno;
	private int idx;
	
	//join시 필요한 속성
	private String name;
	private String id;
	
	public CPictureVO() {
	}

	

	public CPictureVO(int cpno, String cpimage, String cptitle, Date cpdate, int cno, int idx) {
		super();
		this.cpno = cpno;
		this.cpimage = cpimage;
		this.cptitle = cptitle;
		this.cpdate = cpdate;
		this.cno = cno;
		this.idx = idx;
	}


	//setter, getter
	public int getCpno() {
		return cpno;
	}

	public void setCpno(int cpno) {
		this.cpno = cpno;
	}

	public String getCpimage() {
		return cpimage;
	}

	public void setCpimage(String cpimage) {
		this.cpimage = cpimage;
	}

	public String getCptitle() {
		return cptitle;
	}

	public void setCptitle(String cptitle) {
		this.cptitle = cptitle;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public Date getCpdate() {
		return cpdate;
	}

	public void setCpdate(Date cpdate) {
		this.cpdate = cpdate;
	}
	
	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}



	//join시 필요한 속성
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
