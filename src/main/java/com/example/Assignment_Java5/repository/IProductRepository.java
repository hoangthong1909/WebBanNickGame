package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.Product;
import com.example.Assignment_Java5.entitys.ProductType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IProductRepository extends JpaRepository<Product,Integer> {
    List<Product> findAllByType(ProductType typeValue);
    @Query("Select obj from Product obj")
    Page<Product> findAllProduct (Pageable pageable);
}
