package com.example.casestudy3.service;

import com.example.casestudy3.model.Category;

import java.util.List;

public interface ICategoryService {
    List<Category> getAllCategory();

    Category getCategoryById(int id);
}
