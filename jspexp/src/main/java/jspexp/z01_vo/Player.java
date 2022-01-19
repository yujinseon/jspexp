package jspexp.z01_vo;

public class Player {
	private String tname;
	private	String name;
	private Double record;
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getRecord() {
		return record;
	}
	public void setRecord(Double record) {
		this.record = record;
	}
	public Player(String tname, String name, Double record) {
		super();
		this.tname = tname;
		this.name = name;
		this.record = record;
	}
	public Player() {
		super();
		// TODO Auto-generated constructor stub
	}
}
