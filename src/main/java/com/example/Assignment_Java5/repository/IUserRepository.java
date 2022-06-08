package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IUserRepository extends JpaRepository<User, Integer> {
    User findByEmail(String email);
}