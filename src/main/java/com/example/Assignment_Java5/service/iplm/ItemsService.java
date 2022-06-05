package com.example.Assignment_Java5.service.iplm;

import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.Product;
import com.example.Assignment_Java5.repository.IItemsRepository;
import com.example.Assignment_Java5.repository.IProductRepository;
import com.example.Assignment_Java5.service.IItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class ItemsService implements IItemsService {

    @Autowired
    private IItemsRepository repository;

    @Override
    public List<Items> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<Items> findPageAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public Items insert(Items items) {
        items.setId(null);
        return repository.save(items);
    }

    @Override
    public Items update(Items items) {
        Integer id = items.getId();
        if (id != null) {
            Optional<Items> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(items);
            }
        }
        return null;

    }

    @Override
    public Items delete(Integer id) {
        if (id != null) {
            Optional<Items> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Items findById(Integer id) {
        return repository.findById(id).get();
    }
}
