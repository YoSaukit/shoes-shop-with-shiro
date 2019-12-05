package cn.shoes.item.service;

import cn.shoes.common.service.BaseService;
import cn.shoes.system.entity.News;

import java.util.List;

public interface NewsService extends BaseService<News> {
    List<News> getNews(News news);

    void add(News news);

    void update(News news);

    News findById(int id);
}

