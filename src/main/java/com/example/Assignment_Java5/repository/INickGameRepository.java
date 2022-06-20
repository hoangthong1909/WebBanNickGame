package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.NickEnum.NickPlanet;
import com.example.Assignment_Java5.entitys.NickGame;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface INickGameRepository extends JpaRepository<NickGame,Integer> {
    @Query("select count(obj.id) from NickGame obj where obj.idCategory.id = ?1")
    Integer countByCategoryProductId(Integer id);

    @Query("select obj from NickGame obj where obj.idCategory.id = ?1")
    Page<NickGame> findAllByCategoryNick(Integer id, Pageable pageable);

    @Query("select obj from NickGame obj where obj.status > 0")
    Page<NickGame> findPageAll(Pageable pageable);
}
