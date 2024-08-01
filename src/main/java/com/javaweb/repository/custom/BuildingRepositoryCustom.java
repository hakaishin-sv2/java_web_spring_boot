package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;

import java.util.List;

public interface BuildingRepositoryCustom {
    List<BuildingEntity> searchBuildings(BuildingSearchRequest searchRequest);
}
