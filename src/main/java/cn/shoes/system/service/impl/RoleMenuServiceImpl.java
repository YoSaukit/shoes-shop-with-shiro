package cn.shoes.system.service.impl;

import cn.shoes.common.service.impl.BaseServiceImpl;
import cn.shoes.system.entity.RoleMenu;
import cn.shoes.system.service.RoleMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author shoes
 * @date 2019-02-05
 */
@Service
public class RoleMenuServiceImpl extends BaseServiceImpl<RoleMenu> implements RoleMenuService {

    @Override
    @Transactional
    public void deleteRoleMenusByRoleId(List<Long> keys) {
        batchDelete(keys, "roleId", RoleMenu.class);
    }

    @Override
    public void deleteRoleMenusByMenuId(List<Long> ids) {
        this.batchDelete(ids, "menuId", RoleMenu.class);
    }
}
