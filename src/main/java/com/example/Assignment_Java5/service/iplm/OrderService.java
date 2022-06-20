package com.example.Assignment_Java5.service.iplm;

import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.Order;
import com.example.Assignment_Java5.repository.IItemsRepository;
import com.example.Assignment_Java5.repository.IOrderRepository;
import com.example.Assignment_Java5.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService implements IOrderService {

    @Autowired
    private IOrderRepository repository;

    @Override
    public List<Order> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<Order> findPageAll(Pageable pageable) {
        return repository.findAllPage(pageable);
    }

    @Override
    public Order insert(Order order) {
        order.setId(null);
        return repository.save(order);
    }

    @Override
    public Order update(Order order) {
        Integer id = order.getId();
        if (id != null) {
            Optional<Order> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(order);
            }
        }
        return null;
    }

    @Override
    public Order delete(Integer id) {
        if (id != null) {
            Optional<Order> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Order findById(Integer id) {
        return repository.findById(id).get();
    }

    @Override
    public Page<Order> findAllOrderNickByUser(Integer id, Pageable pageable) {
        return repository.findAllOrderNickByUser(id,pageable);
    }

    @Override
    public Page<Order> findAllOrderItemsByUser(Integer id, Pageable pageable) {
        return repository.findAllOrderItemsByUser(id,pageable);
    }

    @Override
    public Page<Order> findAllOrderItems(Pageable pageable) {
        return repository.findAllOrderItems(pageable);
    }

    @Override
    public Page<Order> findAllOrderNick(Pageable pageable) {
        return repository.findAllOrderNick(pageable);
    }
}
