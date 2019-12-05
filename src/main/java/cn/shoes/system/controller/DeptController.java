package cn.shoes.system.controller;

import cn.shoes.common.annotation.Log;
import cn.shoes.common.controller.BaseController;
import cn.shoes.common.dto.QueryPage;
import cn.shoes.common.dto.ResponseCode;
import cn.shoes.common.enums.StatusEnums;
import cn.shoes.common.exception.GlobalException;
import cn.shoes.system.entity.Dept;
import cn.shoes.system.service.DeptService;
import io.swagger.annotations.Api;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author shoes
 * @date 2019-02-02
 */
@RestController
@RequestMapping("/system/dept")
@Api(value = "DeptController", tags = {"部门管理模块接口"})
public class DeptController extends BaseController {

    @Autowired
    private DeptService deptService;

    @PostMapping("/list")
    public ResponseCode queryList(QueryPage queryPage, Dept dept) {
        return ResponseCode.success(super.selectByPageNumSize(queryPage, () -> deptService.queryList(dept)));
    }

    @GetMapping("/tree")
    public ResponseCode tree() {
        return ResponseCode.success(deptService.tree());
    }

    @GetMapping("/findById")
    public ResponseCode findById(Long id) {
        return ResponseCode.success(deptService.findById(id));
    }

    @Log("添加部门")
    @PostMapping("/add")
    @RequiresPermissions("dept:add")
    public ResponseCode add(@RequestBody Dept dept) {
        try {
            deptService.add(dept);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @GetMapping("/checkName")
    public ResponseCode checkName(String name, String id) {
        if (name.isEmpty()) {
            return new ResponseCode(StatusEnums.PARAM_ERROR);
        }
        if (!deptService.checkName(name, id)) {
            return new ResponseCode(StatusEnums.PARAM_REPEAT);
        }
        return ResponseCode.success();
    }

    @Log("更新部门")
    @PostMapping("update")
    @RequiresPermissions("dept:update")
    public ResponseCode update(@RequestBody Dept dept) {
        try {
            deptService.update(dept);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @Log("删除部门")
    @PostMapping("/delete")
    @RequiresPermissions("dept:delete")
    public ResponseCode delete(@RequestBody List<Long> ids) {
        try {
            deptService.delete(ids);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
