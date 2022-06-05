package com.example.Assignment_Java5.service;

import com.example.Assignment_Java5.entitys.Admin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IAdminService {
    public List<Admin> getAll();
    public Page<Admin> findPageAll(Pageable pageable);
    public Admin insert(Admin admin);
    public Admin update(Admin admin);
    public Admin delete(Integer id);
    public Admin findById(Integer id);
}
