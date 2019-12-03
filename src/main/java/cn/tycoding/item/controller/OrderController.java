package cn.tycoding.item.controller;

import cn.tycoding.common.annotation.Log;
import cn.tycoding.common.controller.BaseController;
import cn.tycoding.common.dto.QueryPage;
import cn.tycoding.common.dto.ResponseCode;
import cn.tycoding.common.exception.GlobalException;
import cn.tycoding.item.controller.Model.CartModel;
import cn.tycoding.item.service.OrderService;
import cn.tycoding.system.entity.OrderTemp;
import io.swagger.annotations.Api;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/order/cart")
@Api(value = "OrderController", tags = {"用户管理模块接口"})
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;
    @Log("购物车列表")
    @PostMapping("/list")
    @RequiresPermissions("cart:list")
    public ResponseCode getItemByFields(QueryPage queryPage,@RequestBody Map<String,Object> param) {
        return ResponseCode.success(super.selectByPageNumSize(queryPage,()->
                orderService.cartList(Integer.parseInt(param.get("memberId").toString()))));
    }
    @Log("添加购物车")
    @PostMapping("/add")
    @RequiresPermissions("cart:add")
    public ResponseCode add(@RequestBody Map<String,Object> param){
        int id = Integer.parseInt(param.get("id").toString());
        String color = param.get("color").toString();
        String size = param.get("size").toString();
        int memberId = Integer.parseInt(param.get("memberId").toString());
        OrderTemp orderTemp = new OrderTemp(id,color,size,memberId,1);
        try {
            orderService.add(orderTemp);
            return ResponseCode.success("添加购物车成功");
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
    @Log("删除购物车")
    @PostMapping("/delete")
    @RequiresPermissions("cart:delete")
    public ResponseCode delete(@RequestBody List<Integer> ids) {
        try {
            orderService.delete(ids);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
    @Log("下单")
    @PostMapping("/buy")
    @RequiresPermissions("cart:buy")
    public ResponseCode buy(@RequestBody Map<String, Object>param) {
        try {
            orderService.buy(param);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @PostMapping("/findByIds")
    public ResponseCode findByIds(@RequestBody List<Integer> ids){
        return ResponseCode.success(orderService.findByIds(ids));
    }

    //订单列表
    @PostMapping("/orderList")
    public ResponseCode orderList(@RequestBody Map<String, Object>param){
        return ResponseCode.success();
    }
}
