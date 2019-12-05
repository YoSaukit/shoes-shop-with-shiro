package cn.shoes.system.mapper;

import cn.shoes.common.config.MyMapper;
import cn.shoes.system.entity.User;
import cn.shoes.system.entity.UserWithRole;

import java.util.List;

/**
 * @author shoes
 * @date 2019-01-19
 */
public interface UserMapper extends MyMapper<User> {

    List<User> queryList(User user);

    List<UserWithRole> findById(Long id);
}
