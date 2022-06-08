package com.example.Assignment_Java5.service;

import com.example.Assignment_Java5.entitys.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IUserService {
    public List<User> getAll();
    public Page<User> findPageAll(Pageable pageable);
    public User insert(User user);
    public User update(User user);
    public User delete(Integer id);
    public User findById(Integer id);
    public User findByEmail(String email);
}
