package cn.tycoding.system.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@Data
@ToString
@Table(name = "tb_order_detail")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "order_id")
    private Integer orderId;

    @Column(name = "item_id")
    private Integer itemId;

    private String color;

    private String size;

    /**
     * 单价
     */
    private Double price;

    private Integer num;

    /**
     * 折扣
     */
    private Double discount;

    /**
     * 折扣价
     */
    @Column(name = "dis_price")
    private Double disPrice;

    public OrderDetail() {
    }

    public OrderDetail(Integer orderId, Integer itemId, String color, String size, Double price, Integer num, Double discount, Double disPrice) {
        this.orderId = orderId;
        this.itemId = itemId;
        this.color = color;
        this.size = size;
        this.price = price;
        this.num = num;
        this.discount = discount;
        this.disPrice = disPrice;
    }
}