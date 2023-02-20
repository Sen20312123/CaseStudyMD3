package com.example.casestudy3.model;

import java.util.Date;

public class Customer {
    private Long id ;
    private String name ;
    private Date createAt;
    private String address;
    private String image;

    private int idType;

    public Customer(Long id, String name, Date createAt, String address, String image, int idType) {
        this.id = id;
        this.name = name;
        this.createAt = createAt;
        this.address = address;
        this.image = image;
        this.idType = idType;
    }

    public Customer(Long id, String name, Date createAt, String address, String image) {
        this.id = id;
        this.name = name;
        this.createAt = createAt;
        this.address = address;
        this.image = image;
    }

    public Customer() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getIdType() {
        return idType;
    }

    public void setIdType(int idType) {
        this.idType = idType;
    }
}
