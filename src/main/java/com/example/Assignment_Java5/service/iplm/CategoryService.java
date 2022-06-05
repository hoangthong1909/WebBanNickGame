package com.example.Assignment_Java5.service.iplm;

import com.example.Assignment_Java5.entitys.Category;
import com.example.Assignment_Java5.repository.ICategoryRepository;
import com.example.Assignment_Java5.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
@Component
public class CategoryService implements ICategoryService {

    @Autowired
    private ICategoryRepository repository;

    @Override
    public List<Category> getAll() {
        return repository.getAll();
    }

    @Override
    public Page<Category> findPageAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public List<Category> findCateItems() {
        return repository.findCateItems();
    }

    @Override
    public List<Category> findCateProduct() {
        return repository.findCateProduct();
    }

    @Override
    public Category insert(Category category) {
        category.setId(null);
        return repository.save(category);
    }

    @Override
    public Category update(Category category) {
        Integer id = category.getId();
        if (id != null) {
            Optional<Category> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(category);
            }
        }
        return null;
    }

    @Override
    public Category delete(Integer id) {
        if (id != null) {
            Optional<Category> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Category findById(Integer id) {
        return repository.findById(id).get();
    }
}
