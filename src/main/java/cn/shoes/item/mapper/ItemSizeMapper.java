package cn.shoes.item.mapper;

import cn.shoes.common.config.MyMapper;
import cn.shoes.system.entity.ItemSize;

import java.util.List;

public interface ItemSizeMapper extends MyMapper<ItemSize> {
    List<String> selectByItemId(int id);

    void deleteByIndex(ItemSize itemSize);
}