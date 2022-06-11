package com.example.Assignment_Java5.service;

import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.NickEnum.NickPlanet;
import com.example.Assignment_Java5.entitys.NickGame;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface INickGameService {
public List<NickGame> getAll();
public Page<NickGame> findPageAll(Pageable pageable);
public NickGame insert(NickGame product);
public NickGame update(NickGame product);
public NickGame delete(Integer id);
public NickGame findById(Integer id);
public  Page<NickGame> findNickByCate(Integer id , Pageable pageable);
public Integer count(Integer id);
}
