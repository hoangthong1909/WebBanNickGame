package com.example.Assignment_Java5.service.iplm;

import com.example.Assignment_Java5.entitys.Server;
import com.example.Assignment_Java5.repository.IProductRepository;
import com.example.Assignment_Java5.repository.IServerRepository;
import com.example.Assignment_Java5.service.IServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ServerService implements IServerService {

    @Autowired
    private IServerRepository repository;

    @Override
    public List<Server> getAll() {
        return repository.findAll();
    }
}
