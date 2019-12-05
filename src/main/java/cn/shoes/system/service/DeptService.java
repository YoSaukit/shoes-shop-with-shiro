package cn.shoes.system.service;

import cn.shoes.common.dto.Tree;
import cn.shoes.common.service.BaseService;
import cn.shoes.system.entity.Dept;

import java.util.List;

/**
 * @author shoes
 * @date 2019-02-02
 */
public interface DeptService extends BaseService<Dept> {

    List<Tree<Dept>> tree();

    List<Dept> queryList(Dept dept);

    Dept findById(Long id);

    void add(Dept dept);

    boolean checkName(String name, String id);

    void update(Dept dept);

    void delete(List<Long> ids);
}
