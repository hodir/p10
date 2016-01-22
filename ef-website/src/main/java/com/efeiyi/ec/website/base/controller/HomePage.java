package com.efeiyi.ec.website.base.controller;

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

public class HomePage {
    private HashMap<String, List<Object>> recommendMap;
    //        private List<Object> categoryList;
    private List<Object> recommendedCategoryList;
    private List<Object> bannerList;     //  ok
    //        private List<Object> masterList;
    private List<Object> marketingActivityQueryList;
    private List<Object> hotSaleList;
    private List<Object> bannerActivityList;
    private HashMap<String, List<Object>> projectMap;
//        private List<Object> recommendedTenantList;

    public HomePage() {

    }

    public HashMap<String, List<Object>> getRecommendMap() {
        return recommendMap;
    }

    public void setRecommendMap(HashMap<String, List<Object>> recommendMap) {
        this.recommendMap = recommendMap;
    }

    public void setRecommendedCategoryList(List<Object> recommendedCategoryList) {
        this.recommendedCategoryList = recommendedCategoryList;
    }

    public void setProjectMap(HashMap<String, List<Object>> projectMap) {
        this.projectMap = projectMap;
    }

    public void setRecommendMap2(HashMap<String, List<Object>> recommendMap) {
        HashMap<String, List<Object>> recommendMapTemp = new HashMap<>();
        for (String key : recommendMap.keySet()) {
            List<Object> projectCategoryProductModelList = recommendMap.get(key);
            List<Object> projectCategoryProductModelListTemp = new ArrayList<>();
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

    public List<Object> getRecommendedCategoryList() {
        return recommendedCategoryList;
    }

    public void setRecommendedCategoryList2(List<Object> recommendedCategoryList) {

        List<Object> recommendedCategoryListTemp = new ArrayList<>();
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

    public List<Object> getBannerList() {
        return bannerList;
    }

    public void setBannerList(List<Object> bannerList) {
        this.bannerList = bannerList;
    }


    public List<Object> getMarketingActivityQueryList() {
        return marketingActivityQueryList;
    }

    public void setMarketingActivityQueryList(List<Object> marketingActivityQueryList) {
        this.marketingActivityQueryList = marketingActivityQueryList;
    }

    public List<Object> getHotSaleList() {
        return hotSaleList;
    }

    public void setHotSaleList(List<Object> hotSaleList) {
        this.hotSaleList = hotSaleList;
    }

    public List<Object> getBannerActivityList() {
        return bannerActivityList;
    }

    public void setBannerActivityList(List<Object> bannerActivityList) {
        this.bannerActivityList = bannerActivityList;
    }

    public HashMap<String, List<Object>> getProjectMap() {
        return projectMap;
    }

    public void setProjectMap2(HashMap<String, List<Object>> projectMap) {
        HashMap<String, List<Object>> projectMapTemp = new HashMap<>();
        for (String key : projectMap.keySet()) {
            List<Object> projectList = projectMap.get(key);
            List<Object> projectListTemp = new ArrayList<>();
            for (Object projectTemp : projectList) {
                Project temp = (Project) projectTemp;
                Project project = new Project();
                project.setId(temp.getId());
                project.setName(temp.getName());
                projectListTemp.add(project);
            }
            projectMapTemp.put(key, projectListTemp);
        }

        this.projectMap = projectMapTemp;
    }
}
