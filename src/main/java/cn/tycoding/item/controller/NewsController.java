package cn.tycoding.item.controller;

import cn.tycoding.common.annotation.Log;
import cn.tycoding.common.controller.BaseController;
import cn.tycoding.common.dto.QueryPage;
import cn.tycoding.common.dto.ResponseCode;
import cn.tycoding.common.exception.GlobalException;
import cn.tycoding.item.service.NewsService;
import cn.tycoding.system.entity.Item;
import cn.tycoding.system.entity.News;
import io.swagger.annotations.Api;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/shop/news")
@Api(value = "NewsController", tags = {"品牌新闻模块接口"})
public class NewsController extends BaseController {

    @Autowired
    private NewsService newsService;
    @Log("商品列表")
    @GetMapping("/list")
    public ResponseCode getNews(News news) {
        return ResponseCode.success(newsService.getNews(news));
    }
    @GetMapping("/findById")
    public ResponseCode findById(int id) {
        return ResponseCode.success(newsService.findById(id));
    }
    @Log("添加商品")
    @PostMapping("/add")
    @RequiresPermissions("news:add")
    public ResponseCode add(@RequestBody News news) {
        try {
            newsService.add(news);
            return ResponseCode.success("添加商品成功");
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
    @Log("编辑商品")
    @PostMapping("update")
    @RequiresPermissions("news:update")
    public ResponseCode update(@RequestBody News news) {
        try {
            newsService.update(news);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
