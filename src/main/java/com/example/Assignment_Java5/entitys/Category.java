package com.example.Assignment_Java5.entitys;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", length = 100)
    private String name;

    @Column(name = "status")
    private Integer status;

    @OneToMany(mappedBy = "idCategory")
    private List<Product> listProduct;

    @OneToMany(mappedBy = "categoryItem")
    private List<Items> listItems;
}