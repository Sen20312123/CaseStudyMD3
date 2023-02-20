package com.example.casestudy3.service;

import com.example.casestudy3.model.Customer;
import com.example.casestudy3.model.Product;

import java.util.List;

public interface ICustomerService {
    List<Customer> getAllCustomer();
    Customer findCustomerById(Long id);
    void editCustomer(Customer customer);
    void deleteCustomerById(Long id);

    void createCustomer(Customer customer);

    boolean checkImageExists(String image);
    List<Customer> getAllCustomerSearchingPaging(String kw, int idCustomerType, int offset, int limit);


    int getNoOfRecords();
    void setNoOfRecords(int noOfRecords);
}
