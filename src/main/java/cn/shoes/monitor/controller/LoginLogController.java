package cn.shoes.monitor.controller;

import cn.shoes.common.annotation.Log;
import cn.shoes.common.controller.BaseController;
import cn.shoes.common.dto.QueryPage;
import cn.shoes.common.dto.ResponseCode;
import cn.shoes.common.exception.GlobalException;
import cn.shoes.monitor.entity.LoginLog;
import cn.shoes.monitor.service.LoginLogService;
import io.swagger.annotations.Api;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author shoes
 * @date 2019-03-13
 */
@RestController
@RequestMapping("/monitor/loginlog")
@Api(value = "LoginLogController", tags = {"登录日志模块接口"})
public class LoginLogController extends BaseController {

    @Autowired
    private LoginLogService loginLogService;

    @PostMapping("/list")
    public ResponseCode findByPage(QueryPage queryPage, LoginLog loginLog) {
        return ResponseCode.success(super.selectByPageNumSize(queryPage, () -> loginLogService.findByPage(loginLog)));
    }

    @Log("删除登录日志")
    @PostMapping("/delete")
    @RequiresPermissions("loginlog:list")
    public ResponseCode delete(@RequestBody List<Long> ids) {
        try {
            loginLogService.delete(ids);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
