//package com.javaweb.entity;
//
//import javax.persistence.*;
//
//@Entity
//@Table(name = "assignmentbuilding")
//public class AssignmentBuildingEntity {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//
//    @ManyToOne
//    @JoinColumn(name = "staffid")
//    private UserEntity staff;
//
//    @ManyToOne
//    @JoinColumn(name = "buildingid")
//    private BuildingEntity building;
//
//    // Getter and Setter for id
//    public Long getId() {
//        return id;
//    }
//
//    public void setId(Long id) {
//        this.id = id;
//    }
//
//    // Getter and Setter for staff
//    public UserEntity getStaff() {
//        return staff;
//    }
//
//    public void setStaff(UserEntity staff) {
//        this.staff = staff;
//    }
//
//    // Getter and Setter for building
//    public BuildingEntity getBuilding() {
//        return building;
//    }
//
//    public void setBuilding(BuildingEntity building) {
//        this.building = building;
//    }
//}
