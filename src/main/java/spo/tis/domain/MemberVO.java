package spo.tis.domain;

public class MemberVO {
	
	private int idx;
	private String name;
	private String id;
	private String pwd;
	private String gender;
	private String birth;
	private String mark;
	private int hp1;
	private int hp2;
	private int hp3;
	private int state;
	
	MemberVO(){}

	public MemberVO(int idx, String name, String id, String pwd, String gender, String birth, String mark, int hp1,
			int hp2, int hp3, int state) {
		super();
		this.idx = idx;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.gender = gender;
		this.birth = birth;
		this.mark = mark;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.state = state;
	}

	//setter, getter
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getmark() {
		return mark;
	}

	public void setmark(String mark) {
		this.mark = mark;
	}

	public int getHp1() {
		return hp1;
	}

	public void setHp1(int hp1) {
		this.hp1 = hp1;
	}

	public int getHp2() {
		return hp2;
	}

	public void setHp2(int hp2) {
		this.hp2 = hp2;
	}

	public int getHp3() {
		return hp3;
	}

	public void setHp3(int hp3) {
		this.hp3 = hp3;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	
}
