package com.example.casestudy3.service;

import com.example.casestudy3.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAllProduct();

    Product findProductById(Long id);
    void editProduct(Product Product);
    void deleteProductById(Long id);

    void createProduct(Product Product);

    boolean checkImageExists(String image);


    List<Product> getAllProductSearchingPaging(String kw, int idCategory, int offset, int limit);


    int getNoOfRecords();
    void setNoOfRecords(int noOfRecords);

}
