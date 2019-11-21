package cn.tycoding.item.service;

import cn.tycoding.common.service.BaseService;
import cn.tycoding.item.controller.Model.ItemModel;
import cn.tycoding.system.entity.Item;


import java.util.List;

public interface ItemService extends BaseService<Item> {
    List<Item> getItemByFields(Item item);

    void add(ItemModel itemModel);

    ItemModel findById(int id);

    void update(ItemModel itemModel);
}
