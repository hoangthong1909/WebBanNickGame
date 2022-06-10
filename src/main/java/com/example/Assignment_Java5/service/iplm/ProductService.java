package com.example.Assignment_Java5.service.iplm;

import com.example.Assignment_Java5.entitys.Product;
import com.example.Assignment_Java5.entitys.ProductType;
import com.example.Assignment_Java5.repository.IProductRepository;
import com.example.Assignment_Java5.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class ProductService implements IProductService {
    @Autowired
    private IProductRepository repository;

    @Override
    public List<Product> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<Product> findPageAll(Pageable pageable) {
        return repository.findAllProduct(pageable);
    }

    @Override
    public Product insert(Product product) {
        product.setId(null);
        return repository.save(product);
    }

    @Override
    public Product update(Product product) {
        Integer id = product.getId();
        if (id != null) {
            Optional<Product> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(product);
            }
        }
        return null;
    }

    @Override
    public Product delete(Integer id) {
        if (id != null) {
            Optional<Product> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Product findById(Integer id) {
        return repository.findById(id).get();
    }

    @Override
    public List<Product> findAllByType(ProductType typeValue) {
        return repository.findAllByType(typeValue);
    }

    @Override
    public void deleteMuch(List<Product> list) {
        repository.deleteAllInBatch(list);
    }

    @Override
    public Integer count(Integer id) {
        return repository.countByCategoryProductId(id);
    }
}
