package com.efeiyi.ec.website.base.controller;

import com.efeiyi.ec.product.model.Advertisement;
import com.efeiyi.ec.product.model.Product;
import com.efeiyi.ec.product.model.ProductModel;
import com.efeiyi.ec.product.model.ProductPicture;
import com.efeiyi.ec.project.model.Project;
import com.efeiyi.ec.project.model.ProjectCategory;
import com.efeiyi.ec.project.model.ProjectCategoryProductModel;
import com.ming800.core.p.model.Banner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2016/1/5 0005.
 */
public class HomePage {
    private HashMap<String, List<ProjectCategoryProductModel>> recommendMap;
    //        private List<Object> categoryList;
    private List<ProjectCategory> recommendedCategoryList;
    private List<Banner> bannerList;     //  ok
    //        private List<Object> masterList;
    private List<Advertisement> marketingActivityQueryList;
    private List<Advertisement> hotSaleList;
    private List<Advertisement> bannerActivityList;
    private HashMap<String, List<Project>> projectMap;
//        private List<Object> recommendedTenantList;

    public HomePage(){

    }

    public HashMap<String, List<ProjectCategoryProductModel>> getRecommendMap() {
        return recommendMap;
    }

    public void setRecommendMap(HashMap<String, List<ProjectCategoryProductModel>> recommendMap) {
        this.recommendMap = recommendMap;
    }

    public void setRecommendedCategoryList(List<ProjectCategory> recommendedCategoryList) {
        this.recommendedCategoryList = recommendedCategoryList;
    }

    public void setProjectMap(HashMap<String, List<Project>> projectMap) {
        this.projectMap = projectMap;
    }

    public void setRecommendMap2(HashMap<String, List<ProjectCategoryProductModel>> recommendMap) {
        HashMap<String, List<ProjectCategoryProductModel>> recommendMapTemp = new HashMap<>();
        for (String key : recommendMap.keySet()) {
            List<ProjectCategoryProductModel> projectCategoryProductModelList = recommendMap.get(key);
            List<ProjectCategoryProductModel> projectCategoryProductModelListTemp = new ArrayList<>();
            for (Object product : projectCategoryProductModelList) {
                ProjectCategoryProductModel projectCategoryProductModel = ((ProjectCategoryProductModel) product);
                ProjectCategoryProductModel projectCategoryProductModelTemp = new ProjectCategoryProductModel();
                ProductModel productModelTemp = new ProductModel();
                Product productTemp = new Product();
                List<ProductPicture> productPictureListTemp = new ArrayList<>();
                for (ProductPicture productPictureTemp : projectCategoryProductModel.getProductModel().getProduct().getProductPictureList()) {
                    ProductPicture productPicture = new ProductPicture();
                    productPicture.setStatus(productPictureTemp.getStatus());
                    productPicture.setPictureUrl(productPictureTemp.getPictureUrl());
                    productPictureListTemp.add(productPicture);
                }
                productTemp.setProductPictureList(productPictureListTemp);
                productTemp.setName(projectCategoryProductModel.getProductModel().getProduct().getName());
                productModelTemp.setProduct(productTemp);
                productModelTemp.setId(projectCategoryProductModel.getProductModel().getId());
                projectCategoryProductModelTemp.setProductModel(productModelTemp);
                projectCategoryProductModelTemp.setId(projectCategoryProductModel.getId());
                projectCategoryProductModelListTemp.add(projectCategoryProductModelTemp);
            }
            recommendMapTemp.put(key, projectCategoryProductModelListTemp);
        }
        this.recommendMap = recommendMapTemp;
    }

    public List<ProjectCategory> getRecommendedCategoryList() {
        return recommendedCategoryList;
    }

    public void setRecommendedCategoryList2(List<ProjectCategory> recommendedCategoryList) {

        List<ProjectCategory> recommendedCategoryListTemp = new ArrayList<>();
        for (Object object : recommendedCategoryList) {
            ProjectCategory projectCategory = (ProjectCategory) object;
            ProjectCategory projectCategoryTemp = new ProjectCategory();
            projectCategoryTemp.setId(projectCategory.getId());
            projectCategoryTemp.setName(projectCategory.getName());
            projectCategoryTemp.setContext(projectCategory.getContext());
            recommendedCategoryListTemp.add(projectCategoryTemp);
        }

        this.recommendedCategoryList = recommendedCategoryListTemp;
    }

    public List<Banner> getBannerList() {
        return bannerList;
    }

    public void setBannerList(List<Banner> bannerList) {
        this.bannerList = bannerList;
    }


    public List<Advertisement> getMarketingActivityQueryList() {
        return marketingActivityQueryList;
    }

    public void setMarketingActivityQueryList(List<Advertisement> marketingActivityQueryList) {
        this.marketingActivityQueryList = marketingActivityQueryList;
    }

    public List<Advertisement> getHotSaleList() {
        return hotSaleList;
    }

    public void setHotSaleList(List<Advertisement> hotSaleList) {
        this.hotSaleList = hotSaleList;
    }

    public List<Advertisement> getBannerActivityList() {
        return bannerActivityList;
    }

    public void setBannerActivityList(List<Advertisement> bannerActivityList) {
        this.bannerActivityList = bannerActivityList;
    }

    public HashMap<String, List<Project>> getProjectMap() {
        return projectMap;
    }

    public void setProjectMap2(HashMap<String, List<Project>> projectMap) {
        HashMap<String, List<Project>> projectMapTemp = new HashMap<>();
        for (String key : projectMap.keySet()) {
            List<Project> projectList = projectMap.get(key);
            List<Project> projectListTemp = new ArrayList<>();
            for (Project projectTemp : projectList) {
                Project project = new Project();
                project.setId(projectTemp.getId());
                project.setName(projectTemp.getName());
                projectListTemp.add(project);
            }
            projectMapTemp.put(key, projectListTemp);
        }

        this.projectMap = projectMapTemp;
    }
}
