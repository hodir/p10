package com.efeiyi.ec.website.base.controller;

import com.efeiyi.ec.organization.model.MyUser;
import com.efeiyi.ec.product.model.Advertisement;
import com.efeiyi.ec.product.model.Product;
import com.efeiyi.ec.product.model.ProductModel;
import com.efeiyi.ec.product.model.ProductPicture;
import com.efeiyi.ec.project.model.Project;
import com.efeiyi.ec.project.model.ProjectCategory;
import com.efeiyi.ec.project.model.ProjectCategoryProductModel;
import com.efeiyi.ec.tenant.model.Tenant;
import com.efeiyi.ec.tenant.model.TenantProject;
import com.efeiyi.ec.website.organization.util.AuthorizationUtil;
import com.ming800.core.base.service.BaseManager;
import com.ming800.core.does.model.XQuery;
import com.ming800.core.p.model.Banner;
import com.ming800.core.p.service.BannerManager;
import com.ming800.core.p.service.ObjectRecommendedManager;
import com.ming800.core.util.CookieTool;
import com.ming800.core.util.RedisApi;
import com.ming800.core.util.StringUtil;
import com.sun.javafx.sg.prism.NGShape;
import net.sf.ezmorph.bean.MorphDynaClass;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.solr.common.util.Hash;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.util.*;

/**
 * Created by Administrator on 2015/8/17.
 */
@Controller
public class HomeController {

    @Autowired
    private ObjectRecommendedManager objectRecommendedManager;

    @Autowired
    private BannerManager bannerManager;

    @Autowired
    private BaseManager baseManager;

    @RequestMapping({"/logoutHandler"})
    public String logoutHandler(HttpServletResponse response) {
        //只有手动退出的时候清除cookie
        CookieTool.addCookie(response, "userinfo", "", 1, ".efeiyi.com");
        return "redirect:/";
    }


    @RequestMapping({"/home.do"})
    public String home1(HttpServletRequest request, Model model) throws Exception {
        HomePage homePage = new HomePage();
        String redirectUrl = request.getParameter("redirect");
        if (redirectUrl != null) {
            return "redirect:" + redirectUrl;
        }
        model.addAttribute("sign", "000");
        model.addAttribute("bannerFlag", "true");

        //------------------------------------判断缓存的部分-------------------------------------
        if (RedisApi.getDataFromCatch("homePage") != null) {
            homePage = (HomePage) RedisApi.getDataFromCatch("homePage");
        } else {
            System.out.println("mysql deal start = " + System.currentTimeMillis());

            //判断是否有需要重定向的页面
            //取得分类列表
            XQuery projectCategoryxQuery = new XQuery("listProjectCategory_default", request);
            projectCategoryxQuery.setSortHql("");
            projectCategoryxQuery.updateHql();
            List<Object> categoryList = baseManager.listObject(projectCategoryxQuery);
            List<ProjectCategory> recommendedCategoryList = objectRecommendedManager.getRecommendedList("categoryRecommended");
            //店铺推荐
            List<Object> recommendedTenantList = objectRecommendedManager.getRecommendedList("tenantRecommended");
            //tenant_project
            HashMap<String, List<ProjectCategoryProductModel>> map = new HashMap<>();
            HashMap<String, List<Project>> projectMap = new HashMap<>();
            for (Object object : categoryList) {
                //取得推荐分类下面商品
                XQuery xQuery = new XQuery("listProjectCategoryProductModel_default", request);
                xQuery.put("projectCategory_id", ((ProjectCategory) object).getId());
                map.put(((ProjectCategory) object).getId(), baseManager.listObject(xQuery));
                //首页
                XQuery projectQuery = new XQuery("listProject_default", request);
                projectQuery.put("projectCategory_id", ((ProjectCategory) object).getId());
                projectQuery.setSortHql("");
                projectQuery.updateHql();
                projectMap.put(((ProjectCategory) object).getId(), baseManager.listObject(projectQuery));
            }
            homePage.setProjectMap2(projectMap);
            homePage.setRecommendMap2(map);
            homePage.setRecommendedCategoryList2(recommendedCategoryList);
            //首页轮播图
            List<Banner> bannerList = bannerManager.getBannerList("ec.home.banner");
            homePage.setBannerList(bannerList);
            //广告区域 营销活动 热卖商品 广告区
            XQuery marketingActivityQuery = new XQuery("listAdvertisement_default1", request);
            XQuery hotSaleQuery = new XQuery("listAdvertisement_default3", request);
            XQuery bannerQuery = new XQuery("listAdvertisement_default5", request);
            List<Advertisement> marketingActivityQueryList = baseManager.listObject(marketingActivityQuery);
            List<Advertisement> hotSaleList = baseManager.listObject(hotSaleQuery);
            List<Advertisement> bannerActivityList = baseManager.listObject(bannerQuery);
            homePage.setMarketingActivityQueryList(marketingActivityQueryList);
            homePage.setHotSaleList(hotSaleList);
            homePage.setBannerActivityList(bannerActivityList);
            //热卖商品
            System.out.println("mysql deal end = " + System.currentTimeMillis());
            JSONObject homePageObject = JSONObject.fromObject(homePage); //从redis里拿出来的字符串
            RedisApi.setDataToCatch("homePage", homePage);
            try {
                Jedis jedis = RedisApi.getPool().getResource();
                jedis.set("homePage", homePageObject.toString());
                jedis.set("projectMap", homePageObject.getJSONObject("projectMap").toString());
                jedis.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (homePage.getMarketingActivityQueryList() != null && homePage.getMarketingActivityQueryList().size() > 0) {
            model.addAttribute("marketingActivityQueryList", homePage.getMarketingActivityQueryList());
        }
        if (homePage.getHotSaleList() != null && homePage.getHotSaleList().size() > 0) {
            model.addAttribute("hotSaleList", homePage.getHotSaleList());
        }
        if (homePage.getBannerActivityList() != null && homePage.getBannerActivityList().size() > 0) {
            model.addAttribute("bannerActivityList", homePage.getBannerActivityList());
        }
        model.addAttribute("recommendedCategoryList", homePage.getRecommendedCategoryList());
        model.addAttribute("bannerList", homePage.getBannerList());
        model.addAttribute("recommendMap", homePage.getRecommendMap());
        model.addAttribute("projectMap", homePage.getProjectMap());
//        model.addAttribute("recommendedTenantList", recommendedTenantList);
        return "/home";
    }


    @RequestMapping({"/productCategory.do"})
    public String listProductCategory(HttpServletRequest request, Model model) throws Exception {
        //取得分类列表
//        boolean isRedis = false;
//        String categoryListStr = "";
//        String projectMapStr = "";
//        long startTime = System.currentTimeMillis();
//        try {
//            Jedis jedis = RedisApi.getPool().getResource();
//            categoryListStr = jedis.get("categoryList");
//            projectMapStr = jedis.get("projectMap");
//            jedis.close();
//        } catch (Exception e) {
//            isRedis = false;
//            e.printStackTrace();
//        }
//        if (categoryListStr != null && !categoryListStr.equals("") && projectMapStr != null && !projectMapStr.equals("")) {
//            isRedis = true;
//        } else {
//            isRedis = false;
//        }
//
//        if (isRedis) {
//            JSONObject projectMapObject = JSONObject.fromObject(projectMapStr);
//            HashMap<String, List<Project>> projectMapTemp = new HashMap<>();
//            for (Object key : projectMapObject.keySet()) {
//                JSONArray jsonObject = projectMapObject.getJSONArray(key.toString());
//                List projectObjectList = (List) JSONArray.toCollection(jsonObject, Project.class);
//                projectMapTemp.put(key.toString(), projectObjectList);
//            }
//
//            List<ProjectCategory> projectCategoryList = (List) JSONArray.toCollection(JSONArray.fromObject(categoryListStr), ProjectCategory.class);
//
//            model.addAttribute("categoryList", projectCategoryList);
//            model.addAttribute("projectMap", projectMapTemp);
//            long endTime = System.currentTimeMillis();
//            System.out.println(endTime - startTime);
//        } else {
        XQuery projectCategoryxQuery = new XQuery("listProjectCategory_default", request);
        projectCategoryxQuery.setSortHql("");
        projectCategoryxQuery.updateHql();
        List<Object> categoryList = baseManager.listObject(projectCategoryxQuery);
        HashMap<String, List> projectMap = new HashMap<>();
        for (Object object : categoryList) {
            XQuery projectQuery = new XQuery("listProject_default", request);
            projectQuery.put("projectCategory_id", ((ProjectCategory) object).getId());
            projectQuery.setSortHql("");
            projectQuery.updateHql();
            projectMap.put(((ProjectCategory) object).getId(), baseManager.listObject(projectQuery));
//            }
//            try {
//                Jedis jedis = RedisApi.getPool().getResource();
//
//                List<ProjectCategory> projectCategoryListTemp = new ArrayList<>();
//                for (Object object : categoryList) {
//                    ProjectCategory projectCategory = (ProjectCategory) object;
//                    ProjectCategory projectCategoryTemp = new ProjectCategory();
//                    projectCategoryTemp.setId(projectCategory.getId());
//                    projectCategoryTemp.setName(projectCategory.getName());
//                    projectCategoryListTemp.add(projectCategoryTemp);
//                }
//                jedis.set("categoryList", JSONArray.fromObject(projectCategoryListTemp).toString());
//                jedis.close();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
            model.addAttribute("categoryList", categoryList);
            model.addAttribute("projectMap", projectMap);
            long endTime = System.currentTimeMillis();
//            System.out.println(endTime - startTime);
        }
        return "/common/productCategory";
    }

    @RequestMapping({"/productCategoryList.do"})
    public String moblieListProductCategory(HttpServletRequest request, Model model) throws Exception {
        XQuery projectCategoryxQuery = new XQuery("listProjectCategory_default", request);
        projectCategoryxQuery.setSortHql("");
        projectCategoryxQuery.updateHql();
        List<Object> categoryList = baseManager.listObject(projectCategoryxQuery);
        HashMap<String, List> projectMap = new HashMap<>();
        for (Object object : categoryList) {
            XQuery projectQuery = new XQuery("listProject_default", request);
            projectQuery.put("projectCategory_id", ((ProjectCategory) object).getId());
            projectQuery.setSortHql("");
            projectQuery.updateHql();
            projectMap.put(((ProjectCategory) object).getId(), baseManager.listObject(projectQuery));

        }
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("projectMap", projectMap);
        return "/common/productCategory";

    }

    @RequestMapping({"/500"})
    public String show500() {
        return "/common/500";
    }

    @RequestMapping({"/404"})
    public String show404() {
        return "/common/404";
    }

    @RequestMapping("/401")
    public String show401(HttpServletResponse response) throws Exception {
        return "redirect:/";
    }

    @RequestMapping({"/toMobile.do"})
    public String toMobileHandler(HttpServletRequest request, Model model) throws Exception {
        String url = request.getParameter("mobileUrl");
        url = URLDecoder.decode(url, "UTF-8");
        model.addAttribute("url", url);
        return "/toMobile";

    }


}
