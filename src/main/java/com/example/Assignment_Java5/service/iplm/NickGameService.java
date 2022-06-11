package com.example.Assignment_Java5.service.iplm;

import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.NickEnum.NickPlanet;
import com.example.Assignment_Java5.entitys.NickGame;
import com.example.Assignment_Java5.repository.INickGameRepository;
import com.example.Assignment_Java5.service.INickGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NickGameService implements INickGameService {
    @Autowired
    private INickGameRepository repository;

    @Override
    public List<NickGame> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<NickGame> findPageAll(Pageable pageable) {
        return repository.findAllProduct(pageable);
    }

    @Override
    public NickGame insert(NickGame nick) {
        nick.setId(null);
        return repository.save(nick);
    }

    @Override
    public NickGame update(NickGame product) {
        Integer id = product.getId();
        if (id != null) {
            Optional<NickGame> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(product);
            }
        }
        return null;
    }

    @Override
    public NickGame delete(Integer id) {
        if (id != null) {
            Optional<NickGame> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public NickGame findById(Integer id) {
        return repository.findById(id).get();
    }

    @Override
    public Page<NickGame> findNickByCate(Integer id, Pageable pageable) {
        return repository.findAllByCategoryNick(id,pageable);
    }

    @Override
    public Integer count(Integer id) {
        return repository.countByCategoryProductId(id);
    }
}
