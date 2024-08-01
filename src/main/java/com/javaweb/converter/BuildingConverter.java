package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;
    public BuildingDTO convertToDto (BuildingEntity entity){
        BuildingDTO result = modelMapper.map(entity, BuildingDTO.class);
        result.setAddress(entity.getStreet()+"-"+entity.getWard()+"-"+ entity.getDistrict().getName());
        return result;
    }

    public BuildingEntity convertToEntity (BuildingDTO dto){
        BuildingEntity result = modelMapper.map(dto, BuildingEntity.class);
        return result;
    }
}
