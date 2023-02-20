package com.example.casestudy3.service.jdbc;

import com.example.casestudy3.model.Customer;
import com.example.casestudy3.model.Product;
import com.example.casestudy3.service.IProductService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductService extends DBContext implements IProductService {
    private static final String SELECT_ALL_PRODUCT = "SELECT * FROM mieu_shop.product" ;
    private static final String INSERT_PRODUCT = "INSERT INTO `mieu_shop`.`product` (`name`, `description`, `price`, `quantity`,`image`, `category_id`) VALUES ( ?, ?, ?,?, ?, ?);" ;
    private static final String CHECK_IMAGE_EXIST = "SELECT * FROM mieu_shop.product where image = ?;";
    private static final String FIND_PRODUCT_BY_ID = "SELECT * FROM mieu_shop.product where id = ?;";
    private static final String DELETE_PRODUCT_BY_ID = "DELETE FROM `mieu_shop`.`product` WHERE (`id` = ?);" ;
    private static final String EDIT_PRODUCT = "UPDATE `mieu_shop`.`product` SET `name` = ?, `description` = ?, `price` = ?, `quantity` = ?, `image` = ? ,`category_id` = ? WHERE (`id` =?);";
    private static final String SEARCHING_PAGING_PRODUCT_ALL ="SELECT SQL_CALC_FOUND_ROWS  * FROM product where `name` like ? limit ?,? ;" ;
    private static final String SEARCHING_PAGING_PRODUCT = "SELECT SQL_CALC_FOUND_ROWS  * FROM product where `name` like ? and category_id = ?  limit ?, ?";


    private int noOfRecords;

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public void setNoOfRecords(int noOfRecords) {
        this.noOfRecords = noOfRecords;
    }

    @Override
    public List<Product> getAllProduct() {
        List<Product> products = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
              Product product = getProductFromRs(rs);
                products.add(product);
            }

        }catch (SQLException e){
         printSQLException(e);
        }
        return products;
    }

    private Product getProductFromRs(ResultSet rs) throws SQLException {
        Long id = rs.getLong("id");
        String name = rs.getString("name");
        String description = rs.getString("description");
        int price = rs.getInt("price");
        int quantity = rs.getInt("quantity");
        String image = rs.getString("image");
        int idCategory = rs.getInt("category_id");

        //long id, String name, double price, String description, String image, int quantity, int idCategory
        Product product = new Product(id, name, price, description, image, quantity, idCategory);
        product.setIdCategory(idCategory);
        return product;
    }

    @Override
    public Product findProductById(Long id) {
        Connection connection = getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_PRODUCT_BY_ID);
            preparedStatement.setLong(1, id);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Product product = getProductFromRs(rs);
                return product;
            }

            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }

    @Override
    public void editProduct(Product product) {
        Connection connection = getConnection();

        try {
//            UPDATE `mieu_shop`.`product` SET `name` = ?, `description` = ?, `price` = ?, `quantity` = ?, `image` = ? ,`category_id` = ? WHERE (`id` =?);";
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_PRODUCT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2 , product.getDescription());
            preparedStatement.setInt(3 , product.getPrice());
            preparedStatement.setInt(4 , product.getQuantity());
            preparedStatement.setString(5, product.getImage());
            preparedStatement.setInt(6, product.getIdCategory());
            preparedStatement.setLong(7 , product.getId());

            preparedStatement.executeUpdate();

            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
    }

    @Override
    public void deleteProductById(Long id) {
        Connection connection = getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_PRODUCT_BY_ID);
            ps.setLong(1, id);
            ps.executeUpdate();
            System.out.println("deleteProductById: " + ps);
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
    }

    @Override
    public void createProduct(Product product) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT);
           preparedStatement.setString(1 , product.getName());
           preparedStatement.setString(2, product.getDescription());
           preparedStatement.setInt(3 , product.getPrice());
           preparedStatement.setInt(4 , product.getQuantity());
           preparedStatement.setString(5, product.getImage());
           preparedStatement.setInt(6,product.getIdCategory());
           preparedStatement.executeUpdate();
            System.out.println("createProduct:" + preparedStatement);
        }catch (SQLException e){
            printSQLException(e);
        }
    }

    @Override
    public boolean checkImageExists(String image) {
        Connection connection = getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_IMAGE_EXIST);
            preparedStatement.setString(1, image);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return true;
            }
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }
    public List<Product> getAllProductSearchingPaging(String kw, int idCategory, int offset, int limit) {
        List<Product> products = new ArrayList<>();
        Connection connection = getConnection();

        try {
            PreparedStatement preparedStatement = null;
            if (idCategory == -1) {
                preparedStatement = connection.prepareStatement(SEARCHING_PAGING_PRODUCT_ALL);
                preparedStatement.setString(1, "%" + kw + "%");
                preparedStatement.setInt(2, offset);
                preparedStatement.setInt(3, limit);
            }else{
                preparedStatement = connection.prepareStatement(SEARCHING_PAGING_PRODUCT);
                preparedStatement.setString(1, "%" + kw + "%");
                preparedStatement.setInt(2, idCategory);
                preparedStatement.setInt(3, offset);
                preparedStatement.setInt(4, limit);
            }
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Product p = getProductFromRs(rs);
                products.add(p);
            }

            rs = preparedStatement.executeQuery("SELECT FOUND_ROWS()");
            while (rs.next()) {
                noOfRecords = rs.getInt(1);
            }
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return products;
    }

}
