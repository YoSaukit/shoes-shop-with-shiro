package cn.tycoding.system.entity;

import javax.persistence.*;

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

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取款号
     *
     * @return item_id - 款号
     */
    public Integer getItemId() {
        return itemId;
    }

    /**
     * 设置款号
     *
     * @param itemId 款号
     */
    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    /**
     * 获取颜色
     *
     * @return color - 颜色
     */
    public String getColor() {
        return color;
    }

    /**
     * 设置颜色
     *
     * @param color 颜色
     */
    public void setColor(String color) {
        this.color = color == null ? null : color.trim();
    }
}