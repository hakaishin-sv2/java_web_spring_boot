package com.javaweb.entity;

import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.data.annotation.Id;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="building")

public class BuildingEntity {
    @javax.persistence.Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "street")
    public String street;
    @Column(name = "ward")
    private String ward;

    @Column(name = "numberofbasement")
    private Long numberofbasement;
    @Column(name = "floorarea")
    private Long floorarea;
    @Column(name = "direction")
    private String direction;
    @Column(name = "level")
    private Long level;
    @Column(name = "rentprice")
    private Long rentprice;
    @Column(name = "rentpricedescription")
    private String rentpricedescription;
    @Column(name = "managername")
    private String managername;
    @Column(name = "managerphonenumber")
    private String managerphonenumber;
    @ManyToOne
    @JoinColumn(name = "districtid")
    private DistrictEntity district;

    @OneToMany(mappedBy = "building", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<BuildingRenttypeEntity> buildingRentTypes;

    public BuildingEntity(Long buildingId){
      this.id = buildingId;
    }


    public BuildingEntity(){

    }
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

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public Long getNumberofbasement() {
        return numberofbasement;
    }

    public void setNumberofbasement(Long numberofbasement) {
        this.numberofbasement = numberofbasement;
    }

    public Long getFloorarea() {
        return floorarea;
    }

    public void setFloorarea(Long floorarea) {
        this.floorarea = floorarea;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public Long getLevel() {
        return level;
    }

    public void setLevel(Long level) {
        this.level = level;
    }

    public Long getRentprice() {
        return rentprice;
    }

    public void setRentprice(Long rentprice) {
        this.rentprice = rentprice;
    }

    public String getRentpricedescription() {
        return rentpricedescription;
    }

    public void setRentpricedescription(String rentpricedescription) {
        this.rentpricedescription = rentpricedescription;
    }

    public String getManagername() {
        return managername;
    }

    public void setManagername(String managername) {
        this.managername = managername;
    }

    public String getManagerphonenumber() {
        return managerphonenumber;
    }

    public void setManagerphonenumber(String managerphonenumber) {
        this.managerphonenumber = managerphonenumber;
    }

    public DistrictEntity getDistrict() {
        return district;
    }

    public void setDistrict(DistrictEntity district) {
        this.district = district;
    }

    public List<BuildingRenttypeEntity> getBuildingRentTypes() {
        return buildingRentTypes;
    }

    public void setBuildingRentTypes( List<BuildingRenttypeEntity> buildingRentTypes) {
        this.buildingRentTypes = buildingRentTypes;
    }

    public List<UserEntity> getStaffs() {
        return staffs;
    }

    @ManyToMany
    @JoinTable(
            name = "assignmentbuilding",
            joinColumns = @JoinColumn(name = "buildingid"),
            inverseJoinColumns = @JoinColumn(name = "staffid")
    )
    private List<UserEntity> staffs = new ArrayList<>();
    public void setStaffs(List<UserEntity> staffs) {
        this.staffs = staffs;
    }
}
