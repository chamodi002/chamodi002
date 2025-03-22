package com.datapackage.model;
import java.time.LocalDateTime;

public class Booking {
    private int id;
    private String vehicleType;
    private String price;
    private String customerName;
    private String customerEmail;
    private String customerPhone;
    private String pickupLocation;
    private String dropoffLocation;
    private String pickupDateTime;
    private LocalDateTime pickupDateTimeObj;

    // Empty constructor
    public Booking() {}

    // Constructor with all fields except id
    public Booking(String vehicleType, String price, String customerName, String customerEmail, 
                  String customerPhone, String pickupLocation, String dropoffLocation, String pickupDateTime) {
        this.vehicleType = vehicleType;
        this.price = price;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
        this.pickupDateTime = pickupDateTime;
    }
    
    // Constructor with all fields including id and LocalDateTime
    public Booking(int id, String vehicleType, double price, String customerName, String customerEmail,
                  String customerPhone, String pickupLocation, String dropoffLocation, LocalDateTime pickupDateTime) {
        this.id = id;
        this.vehicleType = vehicleType;
        this.price = String.valueOf(price);
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
        this.pickupDateTimeObj = pickupDateTime;
        this.pickupDateTime = pickupDateTime.toString();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public String getDropoffLocation() {
        return dropoffLocation;
    }

    public void setDropoffLocation(String dropoffLocation) {
        this.dropoffLocation = dropoffLocation;
    }

    public String getPickupDateTime() {
        return pickupDateTime;
    }

    public void setPickupDateTime(String pickupDateTime) {
        this.pickupDateTime = pickupDateTime;
    }
    
    public LocalDateTime getPickupDateTimeObj() {
        return pickupDateTimeObj;
    }

    public void setPickupDateTimeObj(LocalDateTime pickupDateTimeObj) {
        this.pickupDateTimeObj = pickupDateTimeObj;
    }
}