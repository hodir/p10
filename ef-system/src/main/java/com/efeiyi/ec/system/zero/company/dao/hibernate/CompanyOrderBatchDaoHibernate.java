package com.efeiyi.ec.system.zero.company.dao.hibernate;

import com.efeiyi.ec.purchase.model.PurchaseOrder;
import com.efeiyi.ec.purchase.model.PurchaseOrderGift;
import com.efeiyi.ec.purchase.model.PurchaseOrderProduct;
import com.efeiyi.ec.system.zero.company.dao.CompanyOrderBatchDao;
import com.efeiyi.ec.zero.company.model.CompanyOrderBatch;
import com.ming800.core.p.service.AutoSerialManager;
import org.apache.commons.lang.RandomStringUtils;
import org.hibernate.CacheMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/12/15.
 * 企业礼品卡批次 Dao实现类
 */

@Repository
public class CompanyOrderBatchDaoHibernate implements CompanyOrderBatchDao {

    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    @Autowired
    @Qualifier("autoSerialManagerImpl")
    private AutoSerialManager autoSerialManager;

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void buildOrderGiftSetByCompanyOrderBatch(CompanyOrderBatch companyOrderBatch) throws Exception {
        Session session = getSession();//使用同一个session
        session.setCacheMode(CacheMode.IGNORE);//关闭与二级缓存的交互
        Integer num = companyOrderBatch.getAmount();
        int count = 0;
//        long begin = System.currentTimeMillis();
        for (int i = 1; i <= num; i++) {

            String serial = autoSerialManager.nextSerial("purchaseOrder");
            PurchaseOrderGift orderGift = new PurchaseOrderGift();

            PurchaseOrderProduct purchaseOrderProduct = new PurchaseOrderProduct();
            purchaseOrderProduct.setProductModel(companyOrderBatch.getProductModel());
            purchaseOrderProduct.setPurchaseOrder(orderGift);
            purchaseOrderProduct.setPurchaseAmount(1);


            orderGift.setSerial(serial);
            orderGift.setOrderType("5");// 1.普通类型 2.秒杀类型 3.礼品卷类型 4.团购类型 5.企业礼品卡类型
            orderGift.setStatus("1");//0假删 1正常
            orderGift.setOrderStatus(PurchaseOrder.ORDER_STATUS_WRGIFT);//订单状态6 待收礼;填写订单后为5未发货
            orderGift.setShowGiftNameStatus("1");//0不显示 1显示
            orderGift.setShowGiftPriceStatus("1");//0不显示 1显示
            orderGift.setGiftMessage(companyOrderBatch.getMessage());
            orderGift.setGiftGaverName(companyOrderBatch.getCompanyName());//送礼人姓名
            orderGift.setCreateDatetime(new Date());
            orderGift.setCompanyOrderBatch(companyOrderBatch);

            session.saveOrUpdate(orderGift);
            session.saveOrUpdate(purchaseOrderProduct);

            count++;
            if (count == 500) {
                session.flush();
                session.clear();
                count = 0;
            }
        }
        session.flush();
//        System.out.print(System.currentTimeMillis()-begin);
    }

}
