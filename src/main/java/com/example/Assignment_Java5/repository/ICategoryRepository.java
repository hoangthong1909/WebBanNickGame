package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.Category;
import com.example.Assignment_Java5.entitys.Product;
import com.example.Assignment_Java5.entitys.ProductType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ICategoryRepository extends JpaRepository<Category, Integer> {
    @Query("Select obj from Category obj where obj.status > 0")
    List<Category> getAll();

    @Query("Select obj from Category obj where obj.status = 1")
    List<Category> findCateProduct();

    @Query("Select obj from Category obj where obj.status = 2")
    List<Category> findCateItems();


}