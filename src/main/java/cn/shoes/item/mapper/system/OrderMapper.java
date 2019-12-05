package cn.shoes.item.mapper.system;

import cn.shoes.common.config.MyMapper;
import cn.shoes.system.entity.Order;

public interface OrderMapper extends MyMapper<Order> {
    int dailyCount(String date);
}