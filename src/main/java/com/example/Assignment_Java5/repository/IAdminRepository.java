package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IAdminRepository extends JpaRepository<Admin, Integer> {
}