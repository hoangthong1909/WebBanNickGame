package com.example.Assignment_Java5.entitys;

import lombok.*;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orders")
@Component
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "total")
    private BigDecimal total;

    @Column(name = "datecreate")
    private Date datecreate;

    @Column(name = "status")
    private Integer status;

    @Column(name = "idgame")
    private String idGame;

    @Column(name = "location")
    private String location;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User userDatHang;

    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderdetails;

}