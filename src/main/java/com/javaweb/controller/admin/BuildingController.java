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
import com.javaweb.utils.DisplayTagUtils;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

        // Cung cấp dữ liệu cho JSP
        Map<Long, String> listSTAFF = userService.getIdAndNameStaff();
        mav.addObject("listSTAFF", listSTAFF);
        Map<Long, String> listDistrict = districtService.getDistricts();
        mav.addObject("listDistrict", listDistrict);
        mav.addObject("listRentype", buildingType.type());
        mav.addObject("buildingSearchRequest", buildingSearchRequest); // Để giữ lại giá trị đã nhập

        int page = buildingSearchRequest.getPage() - 1; // Điều chỉnh số trang để bắt đầu từ 0
        int size = buildingSearchRequest.getMaxPageItems();
        PageRequest pageRequest = PageRequest.of(page, size);
        Page<BuildingDTO> buildingPage;
        if (buildingSearchRequest.isSearchRequestEmpty(buildingSearchRequest)) {
            buildingPage = buildingService.getBuildings(pageRequest);
        } else {
            buildingPage = buildingService.serBuildingDtos(buildingSearchRequest, pageRequest);
        }

        // Cung cấp dữ liệu phân trang cho JSP
        mav.addObject("buildingList", buildingPage.getContent());
        mav.addObject("totalPages", buildingPage.getTotalPages());
        mav.addObject("currentPage", buildingPage.getNumber() + 1);
        mav.addObject("pageSize", size);
        mav.addObject("totalItems", buildingPage.getTotalElements());

        // Trả về ModelAndView
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
