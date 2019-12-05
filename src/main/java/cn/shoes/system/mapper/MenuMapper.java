package cn.shoes.system.mapper;

import cn.shoes.common.config.MyMapper;
import cn.shoes.system.entity.Menu;

import java.util.List;

/**
 * @author shoes
 * @date 2019-01-19
 */
public interface MenuMapper extends MyMapper<Menu> {

    List<Menu> findUserMenus(String username);

    List<Menu> findUserPermissions(String username);

    void changeTopNode(List<Long> ids);
}
