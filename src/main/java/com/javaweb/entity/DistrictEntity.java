package com.javaweb.entity;

import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.data.annotation.Id;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="district")
public class DistrictEntity {
    @javax.persistence.Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name="name")
    private String name;
    @Column(name="code")
    private String code;

    @OneToMany(mappedBy="district",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    public List<BuildingEntity> buildings  = new ArrayList<>();

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
