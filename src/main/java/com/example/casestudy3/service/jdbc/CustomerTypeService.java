package com.example.casestudy3.service.jdbc;

import com.example.casestudy3.model.CustomerType;
import com.example.casestudy3.service.ICustomerTypeService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeService extends DBContext implements ICustomerTypeService {
    private static final String SELECT_ALL_CUSTOMER_TYPE ="SELECT * FROM customer_type" ;
    private static final String SELECT_CUSTOMER_TYPE_BY_ID = "SELECT * FROM customer_type where id = ?;";

    @Override
    public List<CustomerType> getAllCustomerTypes() {
        List<CustomerType> customerTypes = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                CustomerType customerType = getCustomerTypeFromRs(rs);
                 customerTypes.add(customerType);
            }
            
        }catch (SQLException e){
            printSQLException(e);
        }
        return customerTypes;
    }

    private CustomerType getCustomerTypeFromRs(ResultSet rs) throws SQLException {
        CustomerType customerType = new CustomerType();
        int id = rs.getInt("id");
        String name = rs.getString("name");
        customerType.setId(id);
        customerType.setName(name);
        return customerType;
    }

    @Override
    public CustomerType getCustomerTypeById(int id) {
        Connection connection = getConnection();
        try {

            PreparedStatement ps = connection.prepareStatement(SELECT_CUSTOMER_TYPE_BY_ID);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerType c = getCustomerTypeFromRs(rs);
                return c;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
}
    }
