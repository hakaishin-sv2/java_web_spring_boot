package com.javaweb.controller.admin;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.RoleDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.DistrictService;
import com.javaweb.service.RentypeService;
import com.javaweb.service.impl.UserService;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class BuildingController {
    @Autowired
    BuildingService buildingService;
    @Autowired
    UserService userService;
    @Autowired
    DistrictService districtService;
    @Autowired
    RentypeService rentypeService;

    @GetMapping(value = "building-list")
    public ModelAndView homeListBuilding(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/phan-trang");
        //       để đỏ dữ liêu vào
        Map<Long,String> listSTAFF = userService.getIdAndNameStaff();
        mav.addObject("listSTAFF", listSTAFF);
        Map<Long,String> listDistrict = districtService.getDistricts();
        mav.addObject("listDistrict", listDistrict);
        // có thể dùng của bên enum
         //mav.addObject("listDistrict", districtCode.type());
        //
        /*
        Map<String,String> listRentype = rentypeService.getAllRentypesKeyValue();
        mav.addObject("listRentype", listRentype);
        */
        mav.addObject("listRentype", buildingType.type());
        mav.addObject("buildingSearchRequest", buildingSearchRequest);// để giữ lại giá trị đã nhập
        List<BuildingDTO> buildingDTOList;
        if (buildingSearchRequest.isSearchRequestEmpty(buildingSearchRequest)) {
            buildingDTOList = buildingService.getBuildings();
        } else {
            buildingDTOList = buildingService.serBuildingDtos(buildingSearchRequest);
        }

        mav.addObject("buildingList", buildingDTOList);// đổ dữ lệu list ra
        RoleDTO roleDTO = new RoleDTO();
        return mav;
    }

    @GetMapping(value = "building-create")
    public ModelAndView createBuilding(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/create-building");
        Map<Long,String> listDistrict = districtService.getDistricts();
        mav.addObject("listDistrict", listDistrict);
        Map<String,String> map = buildingType.type();
        Map<String,String> listRentype = rentypeService.getAllRentypesKeyValue();
        mav.addObject("listRentype", listRentype);
        return mav;
    }

    @GetMapping(value = "building-edit-{id}")
    public ModelAndView updateBuilding(@PathVariable Long id,HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/edit-building");
        BuildingDTO buildingDTO = buildingService.GetItemBuilding(id);
        mav.addObject("buildingEdit", buildingDTO);
        Map<Long,String> listDistrict = districtService.getDistricts();
        mav.addObject("listDistrict", listDistrict);
        mav.addObject("listRentype", buildingType.type());
        return mav;
    }

}
