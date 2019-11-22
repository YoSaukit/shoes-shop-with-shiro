package cn.tycoding.item.mapper;

import cn.tycoding.common.config.MyMapper;
import cn.tycoding.system.entity.ItemColor;

import java.util.List;

public interface ItemColorMapper extends MyMapper<ItemColor> {
    List<String> selectByItemId(int id);

    void deleteByIndex(ItemColor itemColor);
}