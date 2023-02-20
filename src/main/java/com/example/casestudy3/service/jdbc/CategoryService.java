package com.example.casestudy3.service.jdbc;

import com.example.casestudy3.model.Category;
import com.example.casestudy3.model.CustomerType;
import com.example.casestudy3.service.ICategoryService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryService extends DBContext implements ICategoryService {
    private static final String SELECT_ALL_CATEGORY ="SELECT * FROM category;" ;
    private static final String SELECT_CATEGORY_BY_ID = "SELECT * FROM mieu_shop.category where id = ?;" ;

    @Override
    public List<Category> getAllCategory() {
        List<Category> categories = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                Category category =getCategoryFromRs(rs);
                categories.add(category);
            }
        }catch (SQLException e){
            printSQLException(e);
        }
        return categories;
    }

    private Category getCategoryFromRs(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");

        Category category = new Category(id, name);
        return category;
    }

    @Override
    public Category getCategoryById(int id) {
        Connection connection = getConnection();
        try {

            PreparedStatement ps = connection.prepareStatement(SELECT_CATEGORY_BY_ID);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryFromRs(rs);
                return c;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }
}
