package cn.tycoding.item.service.serviceImpl;

import cn.tycoding.common.service.impl.BaseServiceImpl;
import cn.tycoding.item.mapper.ItemMapper;
import cn.tycoding.item.service.ItemService;
import cn.tycoding.system.entity.Item;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author YoSaukit
 * @date 2019/11/18 20:49
 */
@Service
public class ItemServiceImpl extends BaseServiceImpl<Item> implements ItemService {
    @Autowired
    private ItemMapper itemMapper;

    @Override
    public List<Item> getItemByFields(Item item) {
        try {
            Example example = new Example(Item.class);
            Example.Criteria criteria = example.createCriteria();
            if (StringUtils.isNotBlank(item.getTitle())){
                criteria.andCondition("title=",item.getTitle());
            }
            if (StringUtils.isNotBlank(item.getType())){
                criteria.andCondition("type=",item.getType());
            }
            if (StringUtils.isNotBlank(item.getFiledTime())){
                String[] split = item.getFiledTime().split(",");
                criteria.andCondition("time >=", split[0]);
                criteria.andCondition("time <=", split[1]);
            }
            example.setOrderByClause("time desc");
            return this.selectByExample(example);
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
