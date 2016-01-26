package com.ming800.core.util;


import net.sf.json.JSONObject;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.util.HashMap;
import java.util.List;

/**
 * Redis操作接口
 *
 * @author 林计钦
 * @version 1.0 2013-6-14 上午08:54:14
 */
public class RedisApi {
    private static JedisPool pool = null;

    private static HashMap<String, Object> dataCatch = new HashMap<>();

    public static Object getDataFromCatch(String key) {
        return dataCatch.get(key);
    }

    public static void setDataToCatch(String key, Object value) {
        dataCatch.put(key, value);
    }

    public static JedisPool getPool() {
        if (pool == null) {
            JedisPoolConfig config = new JedisPoolConfig();
            //控制一个pool可分配多少个jedis实例，通过pool.getResource()来获取；
            //如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
            config.setMaxTotal(500);
            //控制一个pool最多有多少个状态为idle(空闲的)的jedis实例。
            config.setMaxIdle(50);
            //表示当borrow(引入)一个jedis实例时，最大的等待时间，如果超过等待时间，则直接抛出JedisConnectionException；
            config.setMaxWaitMillis(1000 * 100);
            //在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
            config.setTestOnBorrow(true);
            pool = new JedisPool(config, "192.168.227.130", 6379);
        }
        return pool;
    }

    public void setList(Jedis jedis, String key, List<Object> dataList, Class dataClass) {
        //将列表中的元素逐个转换成json格式存储到redis中
        long index = 0;
        for (Object obj : dataList) {
            JSONObject jsonObject = JSONObject.fromObject(obj);
        }
    }

    /**
     * 获取数据
     *
     * @param key
     * @return
     */
    public static String get(String key) {
        String value = null;

        JedisPool pool = null;
        Jedis jedis = null;
        try {
            pool = getPool();
            jedis = pool.getResource();
            value = jedis.get(key);
        } catch (Exception e) {
            //释放redis对象
            jedis.close();
            e.printStackTrace();
        } finally {
            //返还到连接池
            jedis.close();
        }

        return value;
    }
}