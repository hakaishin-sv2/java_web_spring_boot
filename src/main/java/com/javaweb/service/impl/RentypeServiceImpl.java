package com.javaweb.service.impl;

import com.javaweb.entity.RentTypeEntity;
import com.javaweb.repository.RentypeRepository;
import com.javaweb.service.RentypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class RentypeServiceImpl implements RentypeService {
    @Autowired
    RentypeRepository rentypeRepository;
    @Override
    public Map<String, String> getAllRentypesKeyValue() {
        List<RentTypeEntity> rentTypeEntityList = rentypeRepository.findAll();
        Map<String, String> rentypeKeyValue = new HashMap<>();
        for (RentTypeEntity rentTypeEntity : rentTypeEntityList) {
            rentypeKeyValue.put(rentTypeEntity.getCode(), rentTypeEntity.getName());
        }
        return rentypeKeyValue;
    }
}
