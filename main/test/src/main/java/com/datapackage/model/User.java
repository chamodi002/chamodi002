package com.datapackage.model;

public class User {
	private int id;
    private String name;
    private String address;
    private long contact;
    private String uname;
    private String password;

    public User() {}

    public User(String name, String address, long contact, String uname, String password) {
        this.name = name;
        this.address = address;
        this.contact = contact;
        this.uname = uname;
        this.password = password;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getContact() {
		return contact;
	}

	public void setContact(long contact) {
		this.contact = contact;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
    

}
