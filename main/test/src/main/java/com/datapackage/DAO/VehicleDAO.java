package com.datapackage.DAO;

import com.datapackage.model.Vehicle;
import DBUtill.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VehicleDAO {

    public boolean addVehicle(Vehicle vehicle) {
        String query = "INSERT INTO vehicles (type, price, imageFileName, model, numberPlate) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, vehicle.getType());
            preparedStatement.setDouble(2, vehicle.getPrice());
            preparedStatement.setString(3, vehicle.getImageFileName());
            preparedStatement.setString(4, vehicle.getModel());
            preparedStatement.setString(5, vehicle.getNumberPlate());

            int result = preparedStatement.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        String query = "SELECT * FROM vehicles";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setId(resultSet.getInt("id"));
                vehicle.setType(resultSet.getString("type"));
                vehicle.setPrice(resultSet.getDouble("price"));
                vehicle.setImageFileName(resultSet.getString("imageFileName"));
                vehicle.setModel(resultSet.getString("model"));
                vehicle.setNumberPlate(resultSet.getString("numberPlate"));

                vehicles.add(vehicle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicles;
    }

    public boolean deleteVehicle(int id) {
        String query = "DELETE FROM vehicles WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, id);
            int result = preparedStatement.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}