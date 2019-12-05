package cn.shoes.item.controller;

import cn.shoes.common.annotation.Log;
import cn.shoes.common.controller.BaseController;
import cn.shoes.common.dto.QueryPage;
import cn.shoes.common.dto.ResponseCode;
import cn.shoes.common.exception.GlobalException;
import cn.shoes.item.controller.Model.ItemModel;
import cn.shoes.item.service.ItemService;
import cn.shoes.system.entity.Item;
import io.swagger.annotations.Api;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
