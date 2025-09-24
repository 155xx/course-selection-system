package com.xuanke.module;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "torder")
public class Order {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;//id
	private Integer uid;
	private String uname;
	private Integer sid;
	private String sname;
	private Integer uid2;
	private String uname2;
	private String content;
	private String state;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public Integer getUid2() {
		return uid2;
	}
	public void setUid2(Integer uid2) {
		this.uid2 = uid2;
	}
	public String getUname2() {
		return uname2;
	}
	public void setUname2(String uname2) {
		this.uname2 = uname2;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	
}
