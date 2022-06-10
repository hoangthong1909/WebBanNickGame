package com.example.Assignment_Java5.service;

import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.Product;
import com.example.Assignment_Java5.entitys.ProductType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IItemsService {
    public List<Items> getAll();
    public Page<Items> findPageAll(Pageable pageable);
    public Items insert(Items items);
    public Items update(Items items);
    public Items delete(Integer id);
    public Items findById(Integer id);
    public  Integer count(Integer id);
    public  Page<Items> findItemsByCate(Integer id ,Pageable pageable);
}
