package cn.shoes.item.service;

import cn.shoes.common.service.BaseService;
import cn.shoes.item.controller.Model.CartModel;
import cn.shoes.system.entity.Order;
import cn.shoes.system.entity.OrderDetail;
import cn.shoes.system.entity.OrderTemp;

import java.util.List;
import java.util.Map;

public interface OrderService extends BaseService<OrderTemp> {

    List<CartModel> cartList(Integer memberId);

    void add(OrderTemp orderTemp);

    void delete(List<Integer> ids);

    void buy(Map<String, Object> param);

    List<CartModel> findByIds(List<Integer> ids);

    List<Order> orderList(Integer memberId);

    OrderDetail orderDetail(Integer id);

    void sent(List<Integer> ids);
}
