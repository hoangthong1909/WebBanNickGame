package com.example.Assignment_Java5.entitys;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
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

    @Column(name = "image")
    private String image;

    @OneToMany(mappedBy = "idCategory")
    private List<NickGame> listProduct;

    @OneToMany(mappedBy = "categoryItem")
    private List<Items> listItems;
}