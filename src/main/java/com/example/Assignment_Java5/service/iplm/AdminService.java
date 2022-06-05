package com.example.Assignment_Java5.service.iplm;

import com.example.Assignment_Java5.entitys.Admin;
import com.example.Assignment_Java5.repository.IAdminRepository;
import com.example.Assignment_Java5.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class AdminService implements IAdminService {

    @Autowired
    private IAdminRepository repository;

    @Override
    public List<Admin> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<Admin> findPageAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public Admin insert(Admin admin) {
        admin.setId(null);
        return repository.save(admin);
    }

    @Override
    public Admin update(Admin admin) {
        Integer id = admin.getId();
        if (id != null) {
            Optional<Admin> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(admin);
            }
        }
        return null;
    }

    @Override
    public Admin delete(Integer id) {
        if (id != null) {
            Optional<Admin> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Admin findById(Integer id) {
        return repository.findById(id).get();
    }
}
