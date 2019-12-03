package cn.tycoding.system.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@Data
@ToString
@Table(name = "tb_order_temp")
public class OrderTemp {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "item_id")
    private Integer itemId;

    private String color;

    private String size;

    @Column(name = "member_id")
    private Integer memberId;

    private Integer num;

    public OrderTemp() {
    }

    public OrderTemp(Integer itemId, String color, String size, Integer memberId, Integer num) {
        this.itemId = itemId;
        this.color = color;
        this.size = size;
        this.memberId = memberId;
        this.num = num;
    }
}