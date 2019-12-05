package cn.shoes.system.mapper;

import cn.shoes.common.config.MyMapper;
import cn.shoes.system.entity.Role;
import cn.shoes.system.entity.RoleWithMenu;

import java.util.List;

/**
 * @author shoes
 * @date 2019-01-19
 */
public interface RoleMapper extends MyMapper<Role> {

    List<Role> findUserRole(String username);

    List<RoleWithMenu> findById(Long id);
}
