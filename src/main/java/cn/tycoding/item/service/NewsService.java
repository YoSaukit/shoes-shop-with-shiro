package cn.tycoding.item.service;

import cn.tycoding.common.service.BaseService;
import cn.tycoding.system.entity.News;

import java.util.List;

public interface NewsService extends BaseService<News> {
    List<News> getNews(News news);

    void add(News news);

    void update(News news);

    News findById(int id);
}

