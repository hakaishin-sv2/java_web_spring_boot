package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface BuildingService {
    public  List<BuildingDTO>   serBuildingDtos(BuildingSearchRequest searchRequest);
    public  List<BuildingDTO>   getBuildings();
    public  BuildingEntity      CreateBuilding(BuildingDTO buildingDTO);
    public  BuildingEntity      UpdateBuilding(Long id ,BuildingDTO buildingDTO);
    public  BuildingDTO         GetItemBuilding(Long id);
    public  ResponseDTO         listStaff(Long id);
    public  ResponseDTO         GiaoToaNha(Long buildingId,List<Long> staffIds);
}