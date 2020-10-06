package spo.tis.domain;

public class TeamVO {

	private int tno;
	private String tname;
	private String tking;
	private String tsports;
	private int tnumber;
	private int age;
	private String rank;
	private String timage;
	private String tplace;
	private int thp1;
	private int thp2;
	private int thp3;
	private int idx;
	
	private int start;
	private int end;
	
	public TeamVO() {
		
	}
	public TeamVO(String tname, String tking, String tsports, String rank, String tplace, int thp1, int thp2,
			int thp3) {
		super();
		this.tname = tname;
		this.tking = tking;
		this.tsports = tsports;
		this.rank = rank;
		this.tplace = tplace;
		this.thp1 = thp1;
		this.thp2 = thp2;
		this.thp3 = thp3;
	}
	public TeamVO(int tno, String tname, String tking, String tsports, int tnumber, int age, String rank,
			String timage, String tplace, int thp1, int thp2, int thp3) {
		super();
		this.tno = tno;
		this.tname = tname;
		this.tking = tking;
		this.tsports = tsports;
		this.tnumber = tnumber;
		this.age = age;
		this.rank = rank;
		this.timage = timage;
		this.tplace = tplace;
		this.thp1 = thp1;
		this.thp2 = thp2;
		this.thp3 = thp3;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTking() {
		return tking;
	}
	public void setTking(String tking) {
		this.tking = tking;
	}
	public String getTsports() {
		return tsports;
	}
	public void setTsports(String tsports) {
		this.tsports = tsports;
	}
	public int getTnumber() {
		return tnumber;
	}
	public void setTnumber(int tnumber) {
		this.tnumber = tnumber;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getTimage() {
		return timage;
	}
	public void setTimage(String timage) {
		this.timage = timage;
	}
	public String getTplace() {
		return tplace;
	}
	public void setTplace(String tplace) {
		this.tplace = tplace;
	}
	public int getThp1() {
		return thp1;
	}
	public void setThp1(int thp1) {
		this.thp1 = thp1;
	}
	public int getThp2() {
		return thp2;
	}
	public void setThp2(int thp2) {
		this.thp2 = thp2;
	}
	public int getThp3() {
		return thp3;
	}
	public void setThp3(int thp3) {
		this.thp3 = thp3;
	}
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
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	
}
