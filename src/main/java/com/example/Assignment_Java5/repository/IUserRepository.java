package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface IUserRepository extends JpaRepository<User, Integer> {
    User findByEmail(String email);
    @Query("select obj from User obj where obj.status > 0")
    Page<User> findPageAll(Pageable pageable);
}