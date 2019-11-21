package cn.tycoding.item.controller;

import cn.tycoding.common.annotation.Log;
import cn.tycoding.common.controller.BaseController;
import cn.tycoding.common.dto.QueryPage;
import cn.tycoding.common.dto.ResponseCode;
import cn.tycoding.common.exception.GlobalException;
import cn.tycoding.common.utils.ObjectUtil;
import cn.tycoding.common.utils.TimeUtil;
import cn.tycoding.item.controller.Model.ItemModel;
import cn.tycoding.item.service.ItemService;
import cn.tycoding.system.entity.Item;
import cn.tycoding.system.entity.UserWithRole;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.management.Query;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;

/**
 * @author YoSaukit
 * @date 2019/11/19 10:19
 */
@RestController
@RequestMapping("/item/shop")
@Api(value = "UserController", tags = {"用户管理模块接口"})
public class ItemController extends BaseController {
    @Autowired
    private ItemService itemService;
    @Log("商品列表")
    @PostMapping("/list")
    public ResponseCode getItemByFields(QueryPage queryPage, Item item) {
        return ResponseCode.success(super.selectByPageNumSize(queryPage,()->itemService.getItemByFields(item)));
    }
    @Log("添加商品")
    @PostMapping("/add")
    @RequiresPermissions("shop:add")
    public ResponseCode add(@RequestBody ItemModel itemModel) {
        try {
            itemService.add(itemModel);
            return ResponseCode.success("添加商品成功");
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
    @GetMapping("/findById")
    public ResponseCode findById(int id) {
        return ResponseCode.success(itemService.findById(id));
    }
    @Log("编辑商品")
    @PostMapping("update")
    @RequiresPermissions("shop:update")
    public ResponseCode update(@RequestBody ItemModel itemModel) {
        try {
            itemService.update(itemModel);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

}
