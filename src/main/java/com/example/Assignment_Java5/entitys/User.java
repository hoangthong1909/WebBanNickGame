package com.example.Assignment_Java5.entitys;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", length = 100)
    private String name;

    @Column(name = "email", length = 100)
    private String email;

    @Column(name = "address", length = 100)
    private String address;

    @Column(name = "password", length = 100)
    private String password;

    @Column(name = "status")
    private Integer status;

    @Column(name = "surplus")
    private BigDecimal surplus;

    @Column(name = "permission")
    private Integer permission;

    @OneToMany(mappedBy = "userDatHang")
    private List<Order> orders;

    @OneToMany(mappedBy = "userId")
    private List<Card> cardList;

}