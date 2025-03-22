package com.datapackage.model;

public class Vehicle {
    private int id;
    private String type;
    private double price;
    private String imageFileName;
    private String model;
    private String numberPlate;

    // Constructors
    public Vehicle() {}

    public Vehicle(String type, double price, String imageFileName, String model, String numberPlate) {
        this.type = type;
        this.price = price;
        this.imageFileName = imageFileName;
        this.model = model;
        this.numberPlate = numberPlate;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    
    public String getImageFileName() { return imageFileName; }
    public void setImageFileName(String imageFileName) { this.imageFileName = imageFileName; }
    
    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }
    
    public String getNumberPlate() { return numberPlate; }
    public void setNumberPlate(String numberPlate) { this.numberPlate = numberPlate; }
}
