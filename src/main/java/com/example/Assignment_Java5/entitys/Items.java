package com.example.Assignment_Java5.entitys;

import com.example.Assignment_Java5.entitys.ItemsEnum.ItemsPlanet;
import com.example.Assignment_Java5.entitys.ItemsEnum.ItemsType;
import com.example.Assignment_Java5.entitys.ItemsEnum.ItemsVP;
import com.sun.istack.NotNull;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.Min;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@Entity
@Component
@Table(name = "items")
public class Items {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "type")
    private ItemsType type;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "item")
    private ItemsVP item;

    @Column(name = "status")
    private Integer status;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "datecreate")
    private Date dateCreate;

    @ManyToOne
    @JoinColumn(name = "server_id")
    private Server server;

    @Column(name = "planet")
    private ItemsPlanet planet;

    @Column(name = "image")
    private String image;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category categoryItem;

    @OneToMany(mappedBy = "items")
    private List<OrderDetail> orderDetailsItems;

}