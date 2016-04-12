package com.efeiyi.ec.wiki.art.controller;

import com.efeiyi.ec.master.model.MasterProject;
import com.efeiyi.ec.organization.model.AddressProvince;
import com.efeiyi.ec.product.model.ProductModel;
import com.efeiyi.ec.project.model.Project;
import com.efeiyi.ec.project.model.ProjectCategory;
import com.efeiyi.ec.project.model.ProjectRecommended;
import com.efeiyi.ec.wiki.base.util.projectConvertprojectModelUtil;
import com.efeiyi.ec.wiki.model.ProjectModel;
import com.ming800.core.base.service.BaseManager;
import com.ming800.core.does.model.PageInfo;
import com.ming800.core.does.model.XQuery;
import com.ming800.core.p.service.ObjectRecommendedManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/4/12.
 */
public class ProjectCategoryController {

    @Autowired
    BaseManager baseManager;
    @Autowired
    ObjectRecommendedManager objectRecommendedManager;

    /**
     * 列出技艺和美术
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/listProjectCategory.do")
    public String listProjectCategory(HttpServletRequest request,Model model){
        String craftQuery = "FROM Project p WHERE p.type = 2 AND p.status != 0";
        List<Project> craftList = baseManager.listObject(craftQuery);
        String artQuery = "FROM Project p WHERE p.type = 1 AND p.status != 0";
        List<Project> artList = baseManager.listObject(artQuery);
        model.addAttribute("artList",artList);
        model.addAttribute("craftList",craftList);
        return "";
    }
    /**
     * 工艺详情:description技艺描述；level判断级别;addressDistrict判断省市；
     * 相关大师，在MasterProject中取；相关作品取project下面的ProductModel推荐；
     * @param projectId
     * @param request
     * @param model
     */
    @RequestMapping("/project/{projectId}")
    public String getProjectDetail(HttpServletRequest request,Model model,@PathVariable String projectId) throws Exception {
        Project project = (Project) baseManager.getObject(Project.class.getName(),projectId);
        //相关大师
        XQuery xquery = new XQuery("listMasterProject_default",request);
        xquery.put("project_id",projectId);
        List<MasterProject> masterProjectList = baseManager.listObject(xquery);
        //相关作品
        XQuery worksxQuery = new XQuery("listProductModel_default",request);
        worksxQuery.put("product_project_id",projectId);
        List<ProductModel> productModelList = baseManager.listObject(worksxQuery);
        model.addAttribute("masterProjectList",masterProjectList);
        model.addAttribute("productModelList",productModelList);
        model.addAttribute("project",project);
        return "";
    }

    /**
     * 列出category和address
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/listProjectCategoryAndAddress")
    public String  listCategoryAndAddress(HttpServletRequest request,Model model) throws Exception {
        XQuery xQuery = new XQuery("plistProjectCategory_byType",request);
        List<ProjectCategory> projectCategoryList = baseManager.listObject(xQuery);
        model.addAttribute("projectCategoryList",projectCategoryList);
        XQuery addressXQuery = new XQuery("listAddressProvince_default",request);
        List<AddressProvince> addressProvinceList = baseManager.listObject(addressXQuery);
        model.addAttribute("addressProvinceList",addressProvinceList);
        return "";
    }

    /**
     * 检索条件查询包括projectCategoryId和addressId
     * @param request
     * @param model
     * @return
     * @TODO
     */
    @RequestMapping("/listArtWorks.do")
    @ResponseBody
    public List listArtWorks(HttpServletRequest request,Model model) throws Exception {
        String queryParam = request.getParameter("queryParam");
        if (queryParam ==null || "".equalsIgnoreCase(queryParam)){
            queryParam = "plistProject_all";
        }
        XQuery query = new XQuery(queryParam, request);
        PageInfo pageInfo = baseManager.listPageInfo(query);
        List<Project> projectList = pageInfo.getList();
        return projectList;
    }
}
