package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.Category;
import com.example.Assignment_Java5.entitys.Items;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IItemsRepository extends JpaRepository<Items, Integer> {
//    Integer countByCategoryItem(Integer id);
    @Query("select count(obj.id) from Items obj where obj.categoryItem.id = ?1 and obj.status=2")
    Integer countByCategoryItemId(Integer id);

//    @Query("Select obj from Items obj where obj.status = 2")
//    List<Items> findByItemsSell();

    @Query("select obj from Items obj where obj.categoryItem.id = ?1")
    Page<Items> findAllByCategoryItem(Integer id,Pageable pageable);
}