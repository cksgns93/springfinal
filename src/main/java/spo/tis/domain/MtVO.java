package spo.tis.domain;

import lombok.Data;

@Data
public class MtVO {
	
	private int mtno; //primary key
	private String bidx; //매칭 글 번호
	private int hmno; //글쓴 사람 회원번호
	private int htno; //글쓴 사람 팀번호
	private int amno; //신청한 사람 회원번호
	private int atno; //신청한 사람 팀번호

	//추가
	private String tname;
	private String game;
	private String addr;
	
	//원래 있던 것
	//private String tname;
	private String tsports;
	private String tplace;
	private String name;
	private String loc;
	private String tking;
	
	private String rank;
	private int idx;
	private String timage;
}
