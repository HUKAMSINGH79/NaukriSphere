package com.naukrisphere.model;

public class Job {
	private int id;
	private String title;
	private String companyName;
	private String location;
	private String salary;
	private String type;
	private String applyLink;

	// Constructor without apply link
	public Job(int id, String title, String companyName, String location, String salary, String type) {
		this.id = id;
		this.title = title;
		this.companyName = companyName;
		this.location = location;
		this.salary = salary;
		this.type = type;
	}

	// Constructor with apply link
	public Job(int id, String title, String companyName, String location, String salary, String type,
			String applyLink) {
		this.id = id;
		this.title = title;
		this.companyName = companyName;
		this.location = location;
		this.salary = salary;
		this.type = type;
		this.applyLink = applyLink;
	}

	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getCompanyName() {
		return companyName;
	}

	public String getLocation() {
		return location;
	}

	public String getSalary() {
		return salary;
	}

	public String getType() {
		return type;
	}

	public String getApplyLink() {
		return applyLink;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setApplyLink(String applyLink) {
		this.applyLink = applyLink;
	}
}
