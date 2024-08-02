package com.javaweb.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "renttype")
public class RentTypeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    // Constructors
    public RentTypeEntity() {}

    public RentTypeEntity(String name) {
        this.name = name;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public List<BuildingEntity> getBuildings() {
        return buildings;
    }

    @ManyToMany(mappedBy = "renttypes")
    private List<BuildingEntity> buildings;

    public void setBuildings(List<BuildingEntity> buildings) {
        this.buildings = buildings;
    }
}
