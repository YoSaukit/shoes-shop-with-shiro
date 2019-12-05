package cn.shoes.item.service;

import cn.shoes.common.service.BaseService;
import cn.shoes.item.controller.Model.ItemModel;
import cn.shoes.system.entity.Item;


import java.util.List;

public interface ItemService extends BaseService<Item> {
    List<Item> getItemByFields(Item item);

    void add(ItemModel itemModel);

    ItemModel findById(int id);

    void update(ItemModel itemModel);
}
