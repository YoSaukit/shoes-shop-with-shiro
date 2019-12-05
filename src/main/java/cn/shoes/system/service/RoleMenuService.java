package cn.shoes.system.service;

import cn.shoes.common.service.BaseService;
import cn.shoes.system.entity.RoleMenu;

import java.util.List;

/**
 * @author shoes
 * @date 2019-02-05
 */
public interface RoleMenuService extends BaseService<RoleMenu> {

    void deleteRoleMenusByRoleId(List<Long> keys);

    void deleteRoleMenusByMenuId(List<Long> ids);
}
