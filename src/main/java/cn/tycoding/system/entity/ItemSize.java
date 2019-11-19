package cn.tycoding.system.entity;

import javax.persistence.*;

@Table(name = "tb_item_size")
public class ItemSize {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "item_id")
    private Integer itemId;

    /**
     * 尺码
     */
    private String size;

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
     * @return item_id
     */
    public Integer getItemId() {
        return itemId;
    }

    /**
     * @param itemId
     */
    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    /**
     * 获取尺码
     *
     * @return size - 尺码
     */
    public String getSize() {
        return size;
    }

    /**
     * 设置尺码
     *
     * @param size 尺码
     */
    public void setSize(String size) {
        this.size = size == null ? null : size.trim();
    }
}