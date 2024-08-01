package com.javaweb.api.admin;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    BuildingService buildingService;

    @PostMapping
    public void AddBuilding(@RequestBody BuildingDTO buildingDTO) {
      BuildingDTO dto = buildingDTO;
    }

    @PutMapping ()
    public void UpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        BuildingDTO dto = buildingDTO;
    }

    @DeleteMapping ("/{ids}")
    public void XoaBuilding(@PathVariable List<Long> ids) {

    }

    @PostMapping ("/{ids}")
    public void GiaoToaNha(@PathVariable List<Long> ids) {

    }
    @GetMapping("/{buildingid}/staffs")
    public ResponseDTO getStaffs(@PathVariable Long buildingid){
        ResponseDTO respDTO =  buildingService.listStaff(buildingid);
        return respDTO;
    }

    // insert vàng bảng assignmentbuilding giao toàn nhà
    @PostMapping("/{buildingId}/assignmentbuilding")
   // @Transactional
    public ResponseDTO addBuilding(@PathVariable Long buildingId, @RequestBody List<Long> staffIDs)  {
        buildingService.GiaoToaNha(buildingId,staffIDs);
        return   buildingService.GiaoToaNha(buildingId,staffIDs);
    }
}
