package com.javaweb.service.impl;

import com.javaweb.entity.DistrictEntity;
import com.javaweb.repository.DistrictRepository;
import com.javaweb.service.DistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class DistrictServiceIpl implements DistrictService {
    @Autowired
    DistrictRepository districtRepository;
    @Override
    public Map<Long, String> getDistricts() {
        List<DistrictEntity> districtEntityList = districtRepository.findAll();
        Map<Long, String> districts = new HashMap<Long, String>();
        for (DistrictEntity districtEntity : districtEntityList) {
            districts.put(districtEntity.getId(), districtEntity.getName());
        }
        return districts;
    }
}
