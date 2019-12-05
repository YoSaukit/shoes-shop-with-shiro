package cn.shoes.item.mapper;

import cn.shoes.common.config.MyMapper;
import cn.shoes.system.entity.ItemColor;

import java.util.List;

public interface ItemColorMapper extends MyMapper<ItemColor> {
    List<String> selectByItemId(int id);

    void deleteByIndex(ItemColor itemColor);
}