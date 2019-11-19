package cn.tycoding.system.entity;

import lombok.Data;
import lombok.ToString;

import java.util.Date;
import javax.persistence.*;

@Data
@ToString
@Table(name = "tb_item")
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    @Transient
    private String filedTime;
}