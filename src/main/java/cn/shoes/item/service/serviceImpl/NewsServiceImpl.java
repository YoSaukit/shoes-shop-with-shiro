package cn.shoes.item.service.serviceImpl;

import cn.shoes.common.service.impl.BaseServiceImpl;
import cn.shoes.item.mapper.system.NewsMapper;
import cn.shoes.item.service.NewsService;
import cn.shoes.system.entity.News;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class NewsServiceImpl extends BaseServiceImpl<News> implements NewsService {
    @Autowired
    private NewsMapper newsMapper;
    @Override
    public List<News> getNews(News news) {
        Example example = new Example(News.class);
        Example.Criteria criteria = example.createCriteria();
        if (StringUtils.isNotBlank(news.getTitle())){
            criteria.andCondition("title=",news.getTitle());
        }
        example.setOrderByClause("time desc");
        return this.selectByExample(example);
    }

    @Override
    public void add(News news) {
        this.save(news);
    }

    @Override
    public void update(News news) {
        this.updateNotNull(news);
    }

    @Override
    public News findById(int id) {
        return newsMapper.selectByPrimaryKey(id);
    }


}
