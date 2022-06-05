package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.Items;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IItemsRepository extends JpaRepository<Items, Integer> {
}