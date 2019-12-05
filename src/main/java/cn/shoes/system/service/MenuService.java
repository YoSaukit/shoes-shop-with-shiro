package cn.shoes.system.service;

import cn.shoes.common.dto.Tree;
import cn.shoes.common.service.BaseService;
import cn.shoes.system.entity.Menu;

import java.util.List;

/**
 * @author shoes
 * @date 2019-01-19
 */
public interface MenuService extends BaseService<Menu> {

    List<Menu> findUserPerms(String username);

    List<Menu> findUserPermissions(String username);

    List<Menu> findUserResources(String username);

    List<Menu> findAllResources(Menu menu);

    List<Menu> queryList(Menu menu);

    List<Tree<Menu>> getMenuButtonTree();

    List<Tree<Menu>> getMenuTree();

    Menu findById(Long id);

    void add(Menu menu);

    boolean checkName(String name, String id);

    void update(Menu menu);

    void delete(List<Long> ids);
}
