package com.example.Assignment_Java5.entitys;

import com.example.Assignment_Java5.entitys.CardEnum.CardType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "card")
public class Card {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "type")
    private CardType type;

    @ManyToOne
    @JoinColumn(name = "parvalue_id")
    private ParValue parValue;

    @Column(name = "code", length = 50)
    private String code;

    @Column(name = "seri", length = 50)
    private String seri;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User userId;

    @Column(name = "status")
    private Integer status;

    @Column(name = "time")
    private Date time;


}