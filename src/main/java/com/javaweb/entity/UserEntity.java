package com.javaweb.entity;

import javax.crypto.Mac;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity {

    private static final long serialVersionUID = -4988455421375043688L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username", nullable = false, unique = true)
    private String userName;

    @Column(name = "fullname", nullable = false)
    private String fullName;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "status", nullable = false)
    private Integer status;

    @Column(name = "email", unique = true)
    private String email;

    //Cách 1 dùng @ManyToMany
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "role_id", nullable = false))
    private List<RoleEntity> roles = new ArrayList<>();

    public UserEntity(Long staffId) {
        this.id = staffId;
    }

    public UserEntity() {

    }

    public List<RoleEntity> getRoles() {
        return roles;
    }

    public void setRoles(List<RoleEntity> roles) {
        this.roles = roles;
    }

//    @OneToMany(mappedBy="staffs", fetch = FetchType.LAZY)
//    private List<AssignmentBuildingEntity> assignmentBuildingEntities = new ArrayList<>();

    /// Cách 2
//    @OneToMany(mappedBy="users", fetch = FetchType.LAZY)
//    private List<UserRoleEntity> userRoleEntities = new ArrayList<>();
//
//     @OneToMany(mappedBy = "roles",fetch = FetchType.LAZY)
//     private List<RoleEntity> roleEntities = new ArrayList<>();
//    public static long getSerialVersionUID() {
//        return serialVersionUID;
//    }
//    public List<UserRoleEntity> getUserRoleEntities() {
//        return userRoleEntities;
//    }
//
//    public void setUserRoleEntities(List<UserRoleEntity> userRoleEntities) {
//        this.userRoleEntities = userRoleEntities;
//    }

//    // Getter và Setter cho roleEntities
//    public List<RoleEntity> getRoleEntities() {
//        return roleEntities;
//    }
//
//    public void setRoleEntities(List<RoleEntity> roleEntities) {
//        this.roleEntities = roleEntities;
//    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
        @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    @ManyToMany(mappedBy = "staffs", fetch = FetchType.LAZY)
    private List<BuildingEntity> buildings = new ArrayList<>();

    public void setBuildings(List<BuildingEntity> buildings) {
        this.buildings = buildings;
    }

    public List<BuildingEntity> getBuildings() {
        return buildings;
    }
}
