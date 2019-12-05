package cn.shoes.system.service;

import cn.shoes.common.dto.Tree;
import cn.shoes.common.service.BaseService;
import cn.shoes.system.entity.Menu;
import cn.shoes.system.entity.User;
import cn.shoes.system.entity.UserWithRole;

import java.util.List;

/**
 * @author shoes
 * @date 2019-01-19
 */
public interface UserService extends BaseService<User> {

    User findByName(String username);

    UserWithRole findById(Long id);

    List<Tree<Menu>> getMenus(String username);

    List<User> queryList(User user);

    void add(UserWithRole user);

    boolean checkName(String name, String id);

    void update(UserWithRole user);

    void delete(List<Long> keys);

    void updatePassword(String password);
}
