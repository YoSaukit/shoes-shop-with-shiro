package cn.tycoding.item.service;

import cn.tycoding.common.service.BaseService;
import cn.tycoding.item.controller.Model.CartModel;
import cn.tycoding.system.entity.Order;
import cn.tycoding.system.entity.OrderDetail;
import cn.tycoding.system.entity.OrderTemp;

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
