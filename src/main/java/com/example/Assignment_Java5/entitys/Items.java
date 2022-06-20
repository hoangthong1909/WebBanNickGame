package com.example.Assignment_Java5.entitys;

import com.example.Assignment_Java5.entitys.ItemsEnum.ItemsPlanet;
import com.example.Assignment_Java5.entitys.ItemsEnum.ItemsType;
import com.example.Assignment_Java5.entitys.ItemsEnum.ItemsVP;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
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

    @NotNull(message = "Price cannot be null")
    @Min(10000)
    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "item")
    private ItemsVP item;

    @Column(name = "status")
    private Integer status;

    @NotNull(message = "Quantity cannot be null")
    @Min(0)
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