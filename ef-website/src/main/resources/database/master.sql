
#---------------未执行----------------
ALTER TABLE `purchase_cart_product`
ADD COLUMN `status`  char(8) NULL AFTER `product_id`;

ALTER TABLE `purchase_order`
ADD COLUMN `status`  char(8) NULL AFTER `user_address_id`;


ALTER TABLE `purchase_order`
ADD COLUMN `total`  decimal NULL AFTER `status`;

ALTER TABLE `purchase_order`
ADD COLUMN `orderStatus`  char(255) NULL AFTER `total`;

ALTER TABLE `purchase_order_payment`
ADD COLUMN `paymentAmount`  decimal NULL AFTER `status`;

CREATE TABLE `NewTable` (
  `id`  char(16) NOT NULL ,
  `product_id`  char(16) NULL ,
  `user_id`  char(16) NULL ,
  `status`  char(8) NULL ,
  PRIMARY KEY (`id`)
);

ALTER TABLE `product_favorite`
ADD COLUMN `create_datetime`  datetime NULL AFTER `status`;