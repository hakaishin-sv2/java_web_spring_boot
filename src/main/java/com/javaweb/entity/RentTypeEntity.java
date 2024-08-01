package com.javaweb.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "renttype")
public class RentTypeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(mappedBy = "rentTypes")
    private List<BuildingRenttypeEntity> buildingRenttypeEntities;

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

    public List<BuildingRenttypeEntity> getBuildingRenttypeEntities() {
        return buildingRenttypeEntities;
    }

    public void setBuildingRenttypeEntities(List<BuildingRenttypeEntity> buildingRenttypeEntities) {
        this.buildingRenttypeEntities = buildingRenttypeEntities;
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
