package cn.shoes.system.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@Data
@ToString
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

    public ItemSize() {
    }

    public ItemSize(Integer itemId, String size) {
        this.itemId = itemId;
        this.size = size;
    }
}