package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;

import java.util.List;

public class BuildingSearchRequest extends AbstractDTO {
    private String name;
    private Long floorArea;
    private String district;
    private Long districtid;
    private String ward;
    private String street;
    private Long numberofbasement;
    private String direction;
    private Long level;
    private Long areaFrom;
    private Long areaTo;
    private Long rentPriceFrom;
    private Long rentPriceTo;
    private String managername;
    private String managerphonenumber;
    private Long staffId;
    private List<String> typeCode;

    // Check xem nul không
    public boolean isSearchRequestEmpty(BuildingSearchRequest searchRequest) {
        return (searchRequest.getName() == null || searchRequest.getName().isEmpty())
                && searchRequest.getFloorArea() == null
                && searchRequest.getDistrictid() == null
                && (searchRequest.getWard() == null || searchRequest.getWard().isEmpty())
                && (searchRequest.getStreet() == null || searchRequest.getStreet().isEmpty())
                && searchRequest.getNumberOfBasement() == null
                && (searchRequest.getDirection() == null || searchRequest.getDirection().isEmpty())
                && searchRequest.getLevel() == null
                && searchRequest.getAreaFrom() == null
                && searchRequest.getAreaTo() == null
                && searchRequest.getRentPriceFrom() == null
                && searchRequest.getRentPriceTo() == null
                && (searchRequest.getManagerName() == null || searchRequest.getManagerName().isEmpty())
                && (searchRequest.getManagerPhone() == null || searchRequest.getManagerPhone().isEmpty())
                && searchRequest.getStaffId() == null
                && (searchRequest.getTypeCode() == null || searchRequest.getTypeCode().isEmpty());
    }
    public BuildingSearchRequest(Long districtid) {
        this.districtid = districtid;
    }

    public Long getDistrictid() {
        return districtid;
    }

    public void setDistrictid(Long districtid) {
        this.districtid = districtid;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(Long floorArea) {
        this.floorArea = floorArea;
    }

    public Long getNumberOfBasement() {
        return numberofbasement;
    }

    public void setNumberOfBasement(Long numberOfBasement) {
        this.numberofbasement = numberOfBasement;
    }

    public List<String> getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(List<String> typeCode) {
        this.typeCode = typeCode;
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

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getManagerName() {
        return managername;
    }

    public void setManagerName(String managerName) {
        this.managername = managerName;
    }

    public String getManagerPhone() {
        return managerphonenumber;
    }

    public void setManagerPhone(String managerPhone) {
        this.managerphonenumber = managerPhone;
    }

    public Long getRentPriceFrom() {
        return rentPriceFrom;
    }

    public void setRentPriceFrom(Long rentPriceFrom) {
        this.rentPriceFrom = rentPriceFrom;
    }

    public Long getRentPriceTo() {
        return rentPriceTo;
    }

    public void setRentPriceTo(Long rentPriceTo) {
        this.rentPriceTo = rentPriceTo;
    }

    public Long getAreaFrom() {
        return areaFrom;
    }

    public void setAreaFrom(Long areaFrom) {
        this.areaFrom = areaFrom;
    }

    public Long getAreaTo() {
        return areaTo;
    }

    public void setAreaTo(Long areaTo) {
        this.areaTo = areaTo;
    }

    public Long getStaffId() {
        return staffId;
    }

    public void setStaffId(Long staffId) {
        this.staffId = staffId;
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
}
