package com.efeiyi.ec.website.order.service;

import com.efeiyi.ec.organization.model.ConsumerAddress;
import com.efeiyi.ec.product.model.ProductModel;
import com.efeiyi.ec.purchase.model.Cart;
import com.efeiyi.ec.purchase.model.PurchaseOrder;
import org.springframework.ui.Model;

import java.math.BigDecimal;
import java.util.HashMap;

/**
 * Created by Administrator on 2015/10/21 0021.
 */
public interface PurchaseOrderManager {

    /*
        生成订单包含几个步骤
        1.生成主订单
        2.生成子订单
        3.
     */

    /**
     * 购物车下单入口
     * @param cart
     * @param model
     * @return
     * @throws Exception
     */
    PurchaseOrder saveOrUpdatePurchaseOrder(Cart cart,Model model) throws Exception;

    /**
     * 单品下单入口
     * @param productModel 商品
     * @param price 单价
     * @param amount 数量
     * @param model
     * @return
     * @throws Exception
     */
    PurchaseOrder saveOrUpdatePurchaseOrder(ProductModel productModel, BigDecimal price, int amount, Model model) throws Exception;

    /**
     * 支持现有订单重新走下单流程
     * @param purchaseOrder  创建好的订单  包括 商品信息，店铺信息，callback（这里的callback存到数据库的时候是不需要URLEncode的）
     * @param model
     * @return
     * @throws Exception
     */
    PurchaseOrder saveOrUpdatePurchaseOrder(PurchaseOrder purchaseOrder, Model model) throws Exception;

    /**
     *  确认订单的接口，修改订单的状态 在个人中心可见，判断支付方式跳转到相应的支付环境
     * @param purchaseOrder
     * @param consumerAddress
     * @param messageMap
     * @param payWay
     * @return
     */
    PurchaseOrder confirmPurchaseOrder(PurchaseOrder purchaseOrder ,ConsumerAddress consumerAddress,HashMap<String, String> messageMap,String payWay);



}
