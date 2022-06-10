package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.Card;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ICardRepository extends JpaRepository<Card, Integer> {
}