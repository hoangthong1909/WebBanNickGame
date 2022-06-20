package com.example.Assignment_Java5.entitys;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
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
    @NotBlank(message = "Name cannot be blank")
    @Column(name = "name", length = 100)
    private String name;
    @NotBlank(message = "Email cannot be blank")
    @Email(message = "Wrong email format")
    @Column(name = "email", length = 100)
    private String email;
    @NotBlank(message = "Address cannot be blank")
    @Column(name = "address", length = 100)
    private String address;
    @NotBlank(message = "Password cannot be blank")
    @Column(name = "password", length = 100)
    private String password;
    @Column(name = "status")
    private Integer status;
    @NotNull(message = "Surplus cannot be blank")
    @Column(name = "surplus")
    private BigDecimal surplus;

    @Column(name = "permission")
    private Integer permission;

    @OneToMany(mappedBy = "userDatHang")
    private List<Order> orders;

    @OneToMany(mappedBy = "userId")
    private List<Card> cardList;

}