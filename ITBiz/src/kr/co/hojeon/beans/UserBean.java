package kr.co.hojeon.beans;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserBean {
	private int deptseq;
	private String deptname;
	private String empid;
	private String empname;
	private String email;
	private String userid;
	
	private String typename;
	private String dbname;
	private String jpname;
	private String jdname;
	private String joname;
	private int dbseq;
	
	//아이디 존재 유무 확인
	private boolean userIdExists;
	
	//로그인 여부 정보 저장
	private boolean userLoginYN;
	
	@Size(min=4, max=100)
	@Pattern(regexp="[a-zA-Z0-9]*")
	private String userpw;

	public int getDeptseq() {
		return deptseq;
	}

	public void setDeptseq(int deptseq) {
		this.deptseq = deptseq;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String empid) {
		this.empid = empid;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getDbname() {
		return dbname;
	}

	public void setDbname(String dbname) {
		this.dbname = dbname;
	}

	public String getJpname() {
		return jpname;
	}

	public void setJpname(String jpname) {
		this.jpname = jpname;
	}

	public String getJdname() {
		return jdname;
	}

	public void setJdname(String jdname) {
		this.jdname = jdname;
	}

	public String getJoname() {
		return joname;
	}

	public void setJoname(String joname) {
		this.joname = joname;
	}

	public int getDbseq() {
		return dbseq;
	}

	public void setDbseq(int dbseq) {
		this.dbseq = dbseq;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public boolean isUserIdExists() {
		return userIdExists;
	}

	public void setUserIdExists(boolean userIdExists) {
		this.userIdExists = userIdExists;
	}

	public boolean isUserLoginYN() {
		return userLoginYN;
	}

	public void setUserLoginYN(boolean userLoginYN) {
		this.userLoginYN = userLoginYN;
	}
}
