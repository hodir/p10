package com.ming800.core.does.service.impl;

import com.ming800.core.does.model.WebServiceHandler;
import com.ming800.core.does.service.WebServiceHandlerManager;
import org.apache.log4j.Logger;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2016/3/14 0014.
 */
public class WebServiceHandlerManagerImpl implements WebServiceHandlerManager {


    private static HashMap<String, String> serviceHandlerMap = new HashMap<>();

    public static void readXmlFiles() {

        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        Logger logger = Logger.getLogger(ModuleManagerImpl.class);
        try {
            Resource[] xmlFiles = resolver.getResources("/system/webService.xml");
            if (xmlFiles != null) {
                for (Resource resource : xmlFiles) {
                    logger.info("开始解析文件：" + resource.getURL());
                    initXmlFiles(new SAXReader().read(resource.getInputStream()));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

    }


    private static void initXmlFiles(org.dom4j.Document document) {
        Node rootNode = document.selectSingleNode("/web-services");
        List<Node> services = rootNode.selectNodes("service");
        for (Node node : services) {
            String serviceName = node.selectSingleNode("@name").getText();
            String serviceHandler = node.selectSingleNode("@handler").getText();
            serviceHandlerMap.put(serviceName, serviceHandler);
        }
    }

    public static String getServiceHandlerByClassTypes(String classType) {
        return serviceHandlerMap.get(classType);
    }

    public static void dealObject(Object object) throws Exception {
        String className = object.getClass().getName();
        String handler = getServiceHandlerByClassTypes(className);
        if (handler != null) {
            String[] handlerGroup = handler.split(":");
            if (handlerGroup.length != 2) {
                throw new Exception();
            } else {
                String propertyName = handlerGroup[0];
                String propertyHandler = handlerGroup[1];
                WebServiceHandler webServiceHandler = (WebServiceHandler) Class.forName(propertyHandler).newInstance();
                webServiceHandler.setValue(object, propertyName);
            }
        }
    }

    public static void dealList(List<Object> objectList) throws Exception {
        for (Object object : objectList) {
            dealObject(object);
        }

    }


}
