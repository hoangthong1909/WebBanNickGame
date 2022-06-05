package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.Server;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IServerRepository extends JpaRepository<Server, Integer> {
}