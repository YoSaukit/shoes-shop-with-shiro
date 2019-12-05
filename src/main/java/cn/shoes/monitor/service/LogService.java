package cn.shoes.monitor.service;

import cn.shoes.common.service.BaseService;
import cn.shoes.monitor.entity.SysLog;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.scheduling.annotation.Async;

import java.util.List;

/**
 * @author shoes
 * @date 2019-03-13
 */
public interface LogService extends BaseService<SysLog> {

    List<SysLog> findByPage(SysLog log);

    void deleteLogs(List<Long> ids);

    @Async
    void saveLog(ProceedingJoinPoint proceedingJoinPoint, SysLog log) throws JsonProcessingException;
}
