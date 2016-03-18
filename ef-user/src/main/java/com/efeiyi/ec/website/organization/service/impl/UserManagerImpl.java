package com.efeiyi.ec.website.organization.service.impl;


import com.efeiyi.ec.organization.model.*;
import com.efeiyi.ec.website.organization.service.UserManager;
import com.efeiyi.ec.website.organization.service.dao.UserDao;
import com.ming800.core.base.service.BaseManager;
import com.ming800.core.does.model.XQuery;
import com.ming800.core.taglib.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2016/2/29 0029.
 */
public class UserManagerImpl implements UserManager ,UserDetailsService {

    @Autowired
    private BaseManager baseManager;
    @Autowired
    private UserDao userDao;

    @Override
    public MyUser getMyUserByUsername(String username) {
        String queryStr = "SELECT u FROM MyUser u WHERE u.username=:username AND u.status != 0";
        LinkedHashMap<String, Object> queryParamMap = new LinkedHashMap<>();
        queryParamMap.put("username", username);
        MyUser myUser = userDao.getUniqueMyUserByConditions(username, queryStr, queryParamMap);
        if (myUser == null) {
            throw new UsernameNotFoundException("user '" + username + "' not found...");
        } else {
            return myUser;
        }

    }

    @Override
    public User getUserByUsername(String username) {
        return null;
    }

    @Override
    public User getUserByUserId(String userId) {
        User user = (User) baseManager.getObject(User.class.getName(), userId);
        return user;
    }

    @Override
    public MyUser getMyUserByUserId(String userId) {
        return null;
    }

    @Override
    public Consumer getConsumerByUserId(String userId) {
        return null;
    }

    @Override
    public BigUser getBigUserByUserId(String userId) {
        return null;
    }

    @Override
    public List<ConsumerAddress> listConsumerAddressByUserId(String userId) {
        return null;
    }

    @Override
    public void saveOrUpdateConsumer(Consumer consumer) {

    }

    @Override
    public void removeUser(String userId) {

    }

    @Override
    public List<Consumer> listConsumer(XQuery xQuery) {
        return null;
    }

    @Override
    public List<Consumer> listConsumer(String hql, LinkedHashMap<String, Object> param) {
        return null;
    }

    @Override
    public List<Consumer> plistConsumer(String queryHql, PageEntity pageEntity, LinkedHashMap<String, Object> queryParamMap) {
        return null;
    }

    @Override
    public List<Consumer> plistConsumer(XQuery xQuery) {
        return null;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return null;
    }
}
