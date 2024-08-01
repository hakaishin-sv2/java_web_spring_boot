package com.javaweb.entity;

import org.springframework.data.annotation.Id;

import javax.persistence.*;

@Entity
@Table(name="buildingrenttype")
public class BuildingRenttypeEntity {
    @javax.persistence.Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "buildingid")
    private BuildingEntity building;

    @ManyToOne
    @JoinColumn(name="renttypeid", insertable = false, updatable = false)
    private RentTypeEntity rentTypes;



    // Constructors
    public BuildingRenttypeEntity() {}

    public BuildingRenttypeEntity(BuildingEntity building, RentTypeEntity rentTypes) {
        this.building = building;
        this.rentTypes = rentTypes;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BuildingEntity getBuilding() {
        return building;
    }

    public void setBuilding(BuildingEntity building) {
        this.building = building;
       // this.buildingid = building != null ? building.getId() : null;
    }

    public RentTypeEntity getRentTypes() {
        return rentTypes;
    }


}

