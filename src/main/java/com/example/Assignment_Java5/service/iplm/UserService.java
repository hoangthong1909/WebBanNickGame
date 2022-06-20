package com.example.Assignment_Java5.service.iplm;

import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.repository.IUserRepository;
import com.example.Assignment_Java5.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class UserService implements IUserService {

    @Autowired
    private IUserRepository repository;

    @Override
    public List<User> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<User> findPageAll(Pageable pageable) {
        return repository.findPageAll(pageable);
    }

    @Override
    public User insert(User user) {
        user.setId(null);
        return repository.save(user);
    }

    @Override
    public User update(User user) {
        Integer id = user.getId();
        if (id != null) {
            Optional<User> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(user);
            }
        }
        return null;
    }

    @Override
    public User delete(Integer id) {
        if (id != null) {
            Optional<User> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public User findById(Integer id) {
        return repository.findById(id).get();
    }

    @Override
    public User findByEmail(String email) {
        return repository.findByEmail(email);
    }
}
