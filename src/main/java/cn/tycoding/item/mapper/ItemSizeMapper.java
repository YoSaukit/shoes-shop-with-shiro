package cn.tycoding.item.mapper;

import cn.tycoding.common.config.MyMapper;
import cn.tycoding.system.entity.ItemSize;

import java.util.List;

public interface ItemSizeMapper extends MyMapper<ItemSize> {
    List<String> selectByItemId(int id);

    void deleteByIndex(ItemSize itemSize);
}