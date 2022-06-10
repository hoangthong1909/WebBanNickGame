package com.example.Assignment_Java5.service.iplm;

import com.example.Assignment_Java5.entitys.ParValue;
import com.example.Assignment_Java5.repository.IParValueRepository;
import com.example.Assignment_Java5.service.IParValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParValueService implements IParValueService {
    @Autowired
    private IParValueRepository repository;

    @Override
    public List<ParValue> getAll() {
        return repository.findAll();
    }
}
