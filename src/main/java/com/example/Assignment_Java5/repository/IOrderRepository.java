package com.example.Assignment_Java5.repository;

import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface IOrderRepository extends JpaRepository<Order, Integer> {
    @Query("select obj from Order obj JOIN OrderDetail obj2 ON obj.id=obj2.order.id where obj.userDatHang.id= ?1 AND obj2.items.id IS NULL GROUP BY obj.id")
    Page<Order> findAllOrderNickByUser(Integer id, Pageable pageable);

    @Query("select obj from Order obj JOIN OrderDetail obj2 ON obj.id=obj2.order.id where obj.userDatHang.id= ?1 AND obj2.nickGame.id IS NULL GROUP BY obj.id")
    Page<Order> findAllOrderItemsByUser(Integer id, Pageable pageable);

    @Query("select obj from Order obj JOIN OrderDetail obj2 ON obj.id=obj2.order.id where obj2.items.id IS NULL GROUP BY obj.id")
    Page<Order> findAllOrderNick( Pageable pageable);

    @Query("select obj from Order obj JOIN OrderDetail obj2 ON obj.id=obj2.order.id AND obj2.nickGame.id IS NULL GROUP BY obj.id")
    Page<Order> findAllOrderItems(Pageable pageable);

}
