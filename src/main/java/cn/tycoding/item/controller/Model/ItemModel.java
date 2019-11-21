package cn.tycoding.item.controller.Model;

import lombok.Data;
import lombok.ToString;

import java.util.Date;
import java.util.List;

/**
 * @author YoSaukit
 * @date 2019/11/20 20:48
 */
@Data
@ToString
public class ItemModel {
    private Integer id;

    private String type;

    /**
     * 图片
     */
    private String picture;

    private String title;

    /**
     * 价格
     */
    private Double price;

    /**
     * 上架时间
     */

    private Date time;

    private String color;

    private String size;
}
