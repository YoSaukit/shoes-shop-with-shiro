package cn.shoes.monitor.service;

import cn.shoes.monitor.entity.OnlineUser;

import java.util.List;

/**
 * @author shoes
 * @date 2019-02-14
 */
public interface SessionService {

    List<OnlineUser> list();

    void forceLogout(String id);
}
