package cn.tycoding.item.service.serviceImpl;

import cn.tycoding.common.dto.ResponseCode;
import cn.tycoding.common.service.BaseService;
import cn.tycoding.common.service.impl.BaseServiceImpl;
import cn.tycoding.item.mapper.system.NewsMapper;
import cn.tycoding.item.service.NewsService;
import cn.tycoding.system.entity.Item;
import cn.tycoding.system.entity.News;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class NewsServiceImpl extends BaseServiceImpl<News> implements NewsService {
    @Autowired
    private NewsMapper newsMapper;
    @Override
    public List<News> getNewsByFields(News news) {
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
        this.add(news);
    }

    @Override
    public void update(News news) {
        this.updateNotNull(news);
    }


}
