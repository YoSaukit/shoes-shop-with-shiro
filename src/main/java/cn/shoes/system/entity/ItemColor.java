package cn.shoes.system.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@Data
@ToString
@Table(name = "tb_item_color")
public class ItemColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 款号
     */
    @Column(name = "item_id")
    private Integer itemId;

    /**
     * 颜色
     */
    private String color;

    public ItemColor() {
    }

    public ItemColor(Integer itemId, String color) {
        this.itemId = itemId;
        this.color = color;
    }
}