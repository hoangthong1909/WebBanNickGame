package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.Card;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ICardRepository extends JpaRepository<Card, Integer> {
    @Query("select obj from Card obj where obj.userId.id = ?1")
    Page<Card> findAllByUser(Integer id, Pageable pageable);

    @Query("select obj from Card obj where obj.status > 0")
    Page<Card> findPageAll(Pageable pageable);
}