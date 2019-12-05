package cn.shoes.monitor.service;

import cn.shoes.common.service.BaseService;
import cn.shoes.monitor.entity.LoginLog;

import java.util.List;

/**
 * @author shoes
 * @date 2019-03-13
 */
public interface LoginLogService extends BaseService<LoginLog> {

    List<LoginLog> findByPage(LoginLog log);

    void delete(List<Long> ids);

    void saveLog(LoginLog log);
}
