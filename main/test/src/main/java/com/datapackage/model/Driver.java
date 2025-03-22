package com.datapackage.model;

public class Driver {
    private int id;
    private String name;
    private String license;
    private String phone;

    public Driver() {}

    public Driver(String name, String license, String phone) {
        this.name = name;
        this.license = license;
        this.phone = phone;
    }

    public Driver(int id, String name, String license, String phone) {
        this.id = id;
        this.name = name;
        this.license = license;
        this.phone = phone;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getLicense() { return license; }
    public void setLicense(String license) { this.license = license; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
}
