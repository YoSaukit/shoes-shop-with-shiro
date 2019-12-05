package cn.shoes.item.controller;

import cn.shoes.common.controller.BaseController;
import cn.shoes.common.dto.QueryPage;
import cn.shoes.common.dto.ResponseCode;
import cn.shoes.common.exception.GlobalException;
import cn.shoes.item.service.OrderService;
import io.swagger.annotations.Api;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author YoSaukit
 * @date 2019/12/5 15:18
 */

@RestController
@RequestMapping("/orderDetail/order")
@Api(value = "OrderDetailController", tags = {"订单模块接口"})
public class OrderDetailController extends BaseController {

    @Autowired
    private OrderService orderService;
    //订单列表
    @PostMapping("/list")
    @RequiresPermissions("order:list")
    public ResponseCode orderList(QueryPage queryPage, @RequestBody Map<String, Object> param){
        return ResponseCode.success(super.selectByPageNumSize(queryPage,()->
                orderService.orderList(Integer.parseInt(param.get("id").toString()))));
    }

    @PostMapping("/sent")
    @RequiresPermissions("order:sent")
    public ResponseCode sent(@RequestBody List<Integer> ids){
        try {
            orderService.sent(ids);
            return ResponseCode.success();
        } catch (NumberFormatException e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
