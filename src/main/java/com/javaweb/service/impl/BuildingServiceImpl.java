package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.DistrictEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;

import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.hibernate.property.access.spi.PropertyAccessBuildingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private  BuildingRepository  buildingRepository;
    @Autowired
    private  UserRepository  userRepository;
    @Autowired
    private BuildingConverter buildingConverter;

    @Override
    public Page<BuildingDTO> serBuildingDtos(BuildingSearchRequest searchRequest, Pageable pageable) {
        Page<BuildingEntity> buildingEntitiesPage = buildingRepository.searchBuildings(searchRequest, pageable);
        List<BuildingEntity> buildingEntities = buildingEntitiesPage.getContent();
        return buildingEntitiesPage.map(buildingConverter::convertToDto);
    }

    @Override
    public Page<BuildingDTO> getBuildings(Pageable pageable) {
        Page<BuildingEntity> buildingEntitiesPage = buildingRepository.findAll(pageable);
        return buildingEntitiesPage.map(buildingConverter::convertToDto);
    }

    @Override
    public  ResponseDTO CreateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        return null;
    }
    @Override
    public  BuildingEntity UpdateBuilding(Long id ,BuildingDTO buildingDTO) {
//        Optional<BuildingEntity> buildingOptional = buildingRepository.findById(id);
//        if (buildingOptional.isPresent()) {
//            BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
//            if(buildingDTO.getTypeCode()!=null){
//                buildingRentypeRepository.deleteById(id);
//
//            }
//            return buildingRepository.save(buildingEntity);
//        } else {
//            // Xử lý trường hợp không tìm thấy
//            return null;
//        }
        return  null;
    }

    @Override
    public BuildingDTO GetItemBuilding(Long id) {
        Optional<BuildingEntity> buildingOptional = buildingRepository.findById(id);
        if (buildingOptional.isPresent()) {
            BuildingDTO buildingDTO = buildingConverter.convertToDto(buildingOptional.get());
            return buildingDTO;
        }
        return null;
    }

    @Override
    public ResponseDTO listStaff(Long buildingId) {
        // Lấy danh sách nhân viên với trạng thái là 1 và vai trò là STAFF
        List<UserEntity> listStaff = userRepository.findByStatusAndRoles_Code(1, "STAFF");

        // Lấy thông tin tòa nhà từ buildingId
        Optional<BuildingEntity> buildingOptional = buildingRepository.findById(buildingId);

        // Kiểm tra nếu tòa nhà tồn tại
        if (!buildingOptional.isPresent()) {
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage("Building not found");
            return responseDTO;
        }

        BuildingEntity building = buildingOptional.get();

        // Lấy danh sách nhân viên đã được gán cho tòa nhà
        List<UserEntity> assignedStaff = building.getStaffs();

        // Tạo danh sách DTO để trả về
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();

        for (UserEntity userEntity : listStaff) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(userEntity.getFullName());
            staffResponseDTO.setStaffId(userEntity.getId());

            // Kiểm tra nếu nhân viên đã được gán cho tòa nhà
            if (assignedStaff.contains(userEntity)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }

            staffResponseDTOS.add(staffResponseDTO);
        }

        // Sắp xếp danh sách staffResponseDTOS sao cho những phần tử có thuộc tính checked lên đầu
        Collections.sort(staffResponseDTOS, new Comparator<StaffResponseDTO>() {
            @Override
            public int compare(StaffResponseDTO o1, StaffResponseDTO o2) {
                return o2.getChecked().compareTo(o1.getChecked());
            }
        });

        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("Success");
        return responseDTO;
    }


    @Override
    @Transactional
    public ResponseDTO GiaoToaNha(Long buildingId, List<Long> staffIds) {
        try {
            BuildingEntity building = buildingRepository.findById(buildingId).orElseThrow(() -> new RuntimeException("Building not found"));
            List<UserEntity> staffList = new ArrayList<>();
            for (Long staffId : staffIds) {
                UserEntity staff = userRepository.findById(staffId).orElseThrow(() -> new RuntimeException("Staff not found"));
                staffList.add(staff);
            }
            building.setStaffs(staffList);
            buildingRepository.save(building);
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage("Success");
            return responseDTO;
        } catch (Exception e) {
            throw new RuntimeException("Error assigning building", e);
        }
    }

    @Override
    @Transactional
    public ResponseDTO DeleteBuilding(List<Long> buildingIds) {
        if (buildingIds == null || buildingIds.isEmpty()) {
            throw new RuntimeException("The building ID list must not be null or empty");
        }
        buildingRepository.deleteByIdIn(buildingIds);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Buildings deleted successfully");
        return responseDTO;
    }

}
