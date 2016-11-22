package com.gnohisiam.service;

import com.gnohisiam.model.User;
import com.gnohisiam.repository.UserRepository;
import com.gnohisiam.util.CipherUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class UserService {

    @Autowired
    private UserRepository repository;

    /**
     * 根据用户名从DB查找用户，用户不存在则返回 0，密码一致则返回 1，否则返回 2
     * @param name
     * @param password
     * @return
     */
    public int login(String name, String password) {
        User user = repository.findByName(name);
        if (Objects.isNull(user)) {
            return 0;
        }
        return CipherUtil.validatePassword(user.getPassword(), password) ? 1 : 2;
    }

    public boolean isNameExist(String name) {
        return Objects.nonNull(repository.findByName(name));
    }

    public void save(User user) {
        user.setPassword(CipherUtil.generatePassword(user.getPassword()));
        repository.save(user);
    }

}
