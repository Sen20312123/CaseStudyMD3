package com.example.casestudy3.service;

import com.example.casestudy3.model.CustomerType;

import java.util.List;

public interface ICustomerTypeService {
    List<CustomerType> getAllCustomerTypes();

    CustomerType getCustomerTypeById(int id);
}
