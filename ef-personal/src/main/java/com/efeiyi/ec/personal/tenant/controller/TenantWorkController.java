package com.efeiyi.ec.personal.tenant.controller;


import com.efeiyi.ec.product.model.Product;
import com.efeiyi.ec.product.model.ProductDescription;
import com.efeiyi.ec.product.model.ProductPicture;
import com.efeiyi.ec.tenant.model.Tenant;
import com.efeiyi.ec.tenant.model.TenantProject;
import com.ming800.core.base.service.BaseManager;
import com.ming800.core.does.model.XQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by AC丶man on 2015/7/17.
 */

@Controller
@RequestMapping("/tenantWork")
public class TenantWorkController {

    @Autowired
    private BaseManager baseManager;


    /**
     * 获取传承人作品列表
     * @param model
     * @return
     */
    @RequestMapping("/listTenantWork.do")
    public String listTenantProduct(HttpServletRequest request ,Model model) throws Exception {
        String conditions = request.getParameter("conditions");
        String tenantId = conditions.substring(10,conditions.length());
        LinkedHashMap<String,Object> queryParamMap = new LinkedHashMap<>();
        Tenant tenant = (Tenant) baseManager.getObject(Tenant.class.getName(), tenantId);
        XQuery xQuery = new XQuery("plistTenantWork_default",request);
        xQuery.addRequestParamToModel(model, request);
        List tenantWorkList = baseManager.listPageInfo(xQuery).getList();

        model.addAttribute("tenant", tenant);
        model.addAttribute("tenantWorkList",tenantWorkList);
        XQuery xQuery1 = new XQuery("listProject_default",request);
        List<TenantProject> tenantProjectList = baseManager.listObject(xQuery1);
        model.addAttribute("tenantProjectList", tenantProjectList);

        return "/pc/tenantWork/tenantWorkList";

    }
    /**
     * 获取传承人作品详情
     * @param modelMap
     * @return
     */
    @RequestMapping("/{tenantWorkId}")
    public ModelAndView getProduct(HttpServletRequest request,@PathVariable String tenantWorkId,ModelMap modelMap){
        Product product = (Product)baseManager.getObject(Product.class.getName(), tenantWorkId);
        modelMap.addAttribute("product", product);
        return new ModelAndView("/pc/tenantWork/tenantWorkView",modelMap);

    }
}
