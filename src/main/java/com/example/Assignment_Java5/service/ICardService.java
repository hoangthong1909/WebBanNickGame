package com.example.Assignment_Java5.service;

import com.example.Assignment_Java5.entitys.Card;
import com.example.Assignment_Java5.entitys.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ICardService {
    public List<Card> getAll();
    public Page<Card> findPageAll(Pageable pageable);
    public Card insert(Card card);
    public Card update(Card card);
    public Card delete(Integer id);
    public Card findById(Integer id);
}
