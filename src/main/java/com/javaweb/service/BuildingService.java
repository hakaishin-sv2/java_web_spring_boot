package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingService {
    public  Page<BuildingDTO>   serBuildingDtos(BuildingSearchRequest searchRequest, Pageable pageable);
    Page<BuildingDTO>           getBuildings(Pageable pageable);
    public  ResponseDTO         CreateBuilding(BuildingDTO buildingDTO);
    public  BuildingEntity      UpdateBuilding(Long id ,BuildingDTO buildingDTO);
    public  BuildingDTO         GetItemBuilding(Long id);
    public  ResponseDTO         listStaff(Long id);
    public  ResponseDTO         GiaoToaNha(Long buildingId,List<Long> staffIds);
    public  ResponseDTO         DeleteBuilding(List<Long> buildingIds);
}