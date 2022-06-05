package com.example.Assignment_Java5.service;

import com.example.Assignment_Java5.entitys.Product;
import com.example.Assignment_Java5.entitys.ProductType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IProductService {
public List<Product> getAll();
public Page<Product> findPageAll(Pageable pageable);
public Product insert(Product product);
public Product update(Product product);
public Product delete(Integer id);
public Product findById(Integer id);
public List<Product> findAllByType(ProductType typeValue);
public void  deleteMuch(List<Product> list);
}
