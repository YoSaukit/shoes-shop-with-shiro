package cn.shoes.system.mapper;

import cn.shoes.common.config.MyMapper;
import cn.shoes.system.entity.Dept;

import java.util.List;

/**
 * @author shoes
 * @date 2019-02-02
 */
public interface DeptMapper extends MyMapper<Dept> {

    void changeTopNode(List<Long> ids);
}
