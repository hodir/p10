package com.efeiyi.ec.system.master.controller;

import com.efeiyi.ec.master.model.Master;
import com.efeiyi.ec.project.model.Project;
import com.efeiyi.ec.project.model.ProjectCategory;
import com.ming800.core.base.service.BaseManager;
import com.ming800.core.does.model.XQuery;
import com.ming800.core.does.model.Xentity;
import com.ming800.core.does.service.DoHandler;
import com.ming800.core.p.service.AutoSerialManager;
import com.ming800.core.util.ApplicationContextUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2015/7/21.
 */
public class MasterWorkForm2Handler implements DoHandler {

    private BaseManager baseManager = (BaseManager) ApplicationContextUtil.getApplicationContext().getBean("baseManagerImpl");
    private AutoSerialManager autoSerialManager = (AutoSerialManager) ApplicationContextUtil.getApplicationContext().getBean("autoSerialManagerImpl");
    @Override
    public ModelMap handle(ModelMap modelMap, HttpServletRequest request) throws Exception {

        XQuery xQuery = new XQuery("listMaster3_default",request);
        List<Master> masterList =(List<Master>)baseManager.listObject(xQuery);
        modelMap.put("masterList",masterList);
        xQuery = new XQuery("listProject4_default",request);
        List<Project> projectList =(List<Project>)baseManager.listObject(xQuery);
        modelMap.put("projectList",projectList);
        System.out.print(request.getParameter("id"));
        if("".equals(request.getParameter("id"))||request.getParameter("id")==null){
            modelMap.put("serial" ,autoSerialManager.nextSerial("MasterWork"));
        }

        return modelMap;
    }
}
