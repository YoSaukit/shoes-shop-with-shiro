package cn.tycoding.item.controller;

import cn.tycoding.common.controller.BaseController;
import cn.tycoding.common.dto.QueryPage;
import cn.tycoding.common.dto.ResponseCode;
import cn.tycoding.common.utils.ObjectUtil;
import cn.tycoding.common.utils.TimeUtil;
import cn.tycoding.item.service.ItemService;
import cn.tycoding.system.entity.Item;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.apache.ibatis.annotations.Param;
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

    @PostMapping("/list")
    public ResponseCode getItemByFields(QueryPage queryPage, Item item) {
//        String title = ObjectUtil.castString(param.get("title"));
//        String type = ObjectUtil.castString(param.get("type"));
//        Date startTime = ObjectUtil.castDate(param.get("startTime").toString());
//        Date endTime = ObjectUtil.castDate(param.get("endTime").toString());
//        ObjectMapper objectMapper = new ObjectMapper();
//        QueryPage queryPage = objectMapper.convertValue(param.get("queryPage"),QueryPage.class );

//        return ResponseCode.success(super.selectByPageNumSize(queryPage,()->itemService.getItemByFields(title,type,startTime,endTime)));
        return ResponseCode.success(super.selectByPageNumSize(queryPage,()->itemService.getItemByFields(item)));

    }

}
