package com.efeiyi.ec.website.organization.service;

import com.efeiyi.ec.organization.model.*;
import com.ming800.core.does.model.XQuery;
import com.ming800.core.taglib.PageEntity;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ming
 * Date: 12-10-15
 * Time: 下午5:01
 * To change this template use File | Settings | File Templates.
 */
public interface UserManager {

    User getUserByUsername(String username);

    User getUserByUserId(String userId);

    MyUser getMyUserByUserId(String userId);

    MyUser getMyUserByUsername(String username);

    Consumer getConsumerByUserId(String userId);

    BigUser getBigUserByUserId(String userId);

    List<ConsumerAddress> listConsumerAddressByUserId(String userId);

    void saveOrUpdateConsumer(Consumer consumer);

    void saveOrUpdateMyUser(MyUser myUser);

    void removeUser(String userId);

    List<Consumer> listConsumer(XQuery xQuery); //需要服务端客户端有相同的配置

    List<Consumer> listConsumer(String hql, LinkedHashMap<String, Object> param);

    List<Consumer> plistConsumer(String queryHql, PageEntity pageEntity, LinkedHashMap<String, Object> queryParamMap);

    List<Consumer> plistConsumer(XQuery xQuery);

}
