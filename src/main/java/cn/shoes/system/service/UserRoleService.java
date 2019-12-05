package cn.shoes.system.service;

import cn.shoes.common.service.BaseService;
import cn.shoes.system.entity.UserRole;

import java.util.List;

/**
 * @author shoes
 * @date 2019-02-03
 */
public interface UserRoleService extends BaseService<UserRole> {

    void deleteUserRolesByUserId(List<Long> keys);

    void deleteUserRolesByRoleId(List<Long> keys);
}
