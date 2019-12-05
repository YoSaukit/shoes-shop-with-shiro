package cn.shoes.item.controller.Model;

import lombok.Data;
import lombok.ToString;

/**
 * @author YoSaukit
 * @date 2019/12/1 21:52
 */
@Data
@ToString
public class CartModel {
    private Integer id;

    private Integer itemId;

    private String picture;

    private String title;

    private Double price;

    private String color;

    private String size;

    private Integer num;

    private Double discount;

    public CartModel(Integer id, Integer itemId, String picture, String title, Double price, String color, String size, Integer num, Double discount) {
        this.id = id;
        this.itemId = itemId;
        this.picture = picture;
        this.title = title;
        this.price = price;
        this.color = color;
        this.size = size;
        this.num = num;
        this.discount = discount;
    }
}
