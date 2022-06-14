package com.example.Assignment_Java5.service.iplm;

import com.example.Assignment_Java5.entitys.Card;
import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.repository.ICardRepository;
import com.example.Assignment_Java5.service.ICardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CardService implements ICardService {
    @Autowired
    private ICardRepository repository;

    @Override
    public List<Card> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<Card> findPageAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public Card insert(Card card) {
        card.setId(null);
        return  repository.save(card);
    }

    @Override
    public Card update(Card card) {
        Integer id = card.getId();
        if (id != null) {
            Optional<Card> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(card);
            }
        }
        return null;
    }

    @Override
    public Card delete(Integer id) {
        if (id != null) {
            Optional<Card> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Card findById(Integer id) {
        return repository.findById(id).get();
    }

    @Override
    public Page<Card> findAllByUser(Integer id, Pageable pageable) {
        return repository.findAllByUser(id,pageable);
    }
}
