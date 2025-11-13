package com.product.bean;

public class AdminBean {

	private String name,pWord,fName,lName,mId;
	private long phNo;
	public AdminBean(String name, String pWord, String fName, String lName, String mId, long phNo) {
		super();
		this.name = name;
		this.pWord = pWord;
		this.fName = fName;
		this.lName = lName;
		this.mId = mId;
		this.phNo = phNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getpWord() {
		return pWord;
	}
	public void setpWord(String pWord) {
		this.pWord = pWord;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public long getPhNo() {
		return phNo;
	}
	public void setPhNo(long phNo) {
		this.phNo = phNo;
	}
	
}
