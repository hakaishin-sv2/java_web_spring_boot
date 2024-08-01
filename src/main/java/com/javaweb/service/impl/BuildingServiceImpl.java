package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.DistrictEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRentypeRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.hibernate.property.access.spi.PropertyAccessBuildingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private  BuildingRepository  buildingRepository;
    @Autowired
    private  UserRepository  userRepository;
    @Autowired
    private BuildingRentypeRepository buildingRentypeRepository;
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    private BuildingConverter buildingConverter;

    @Override
    public List<BuildingDTO> serBuildingDtos(BuildingSearchRequest searchRequest) {
        List<BuildingEntity> buildingEntities = buildingRepository.searchBuildings(searchRequest);
        List<BuildingDTO> buildingDTOS = new ArrayList<>();
        for (BuildingEntity buildingEntity : buildingEntities) {
            BuildingDTO buildingDTO = new BuildingDTO();
            buildingDTO=      buildingConverter.convertToDto(buildingEntity);
            buildingDTOS.add(buildingDTO);
        }
        return buildingDTOS;
    }

    @Override
    public List<BuildingDTO> getBuildings() {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll();
        List<BuildingDTO> buildingDTOS = new ArrayList<>();
        for (BuildingEntity buildingEntity : buildingEntities) {
            BuildingDTO buildingDTO = buildingConverter.convertToDto(buildingEntity);
            buildingDTOS.add(buildingDTO);
        }
        return buildingDTOS;
    }

    @Override
    public  BuildingEntity CreateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        return buildingRepository.save(buildingEntity);
    }
    @Override
    public  BuildingEntity UpdateBuilding(Long id ,BuildingDTO buildingDTO) {
        Optional<BuildingEntity> buildingOptional = buildingRepository.findById(id);
        if (buildingOptional.isPresent()) {
            BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
            if(buildingDTO.getTypeCode()!=null){
                buildingRentypeRepository.deleteById(id);

            }
            return buildingRepository.save(buildingEntity);
        } else {
            // Xử lý trường hợp không tìm thấy
            return null;
        }
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
    public ResponseDTO listStaff(Long buildingid) {
       List<UserEntity> listStaff = userRepository.findByStatusAndRoles_Code(1,"STAFF");
       Optional<BuildingEntity> buildingEntities =buildingRepository.findById(buildingid);
       List<Long> arrayIdStaff_ByBuildingID =  assignmentBuildingRepository.findStaffIdsByBuildingId(buildingid);
       List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
       for(UserEntity userEntity : listStaff){
           StaffResponseDTO staffResponseDTO= new StaffResponseDTO();
           staffResponseDTO.setFullName(userEntity.getFullName());
           staffResponseDTO.setStaffId(userEntity.getId());
           if(arrayIdStaff_ByBuildingID.contains(userEntity.getId())){
               staffResponseDTO.setChecked("checked");
           }else {
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
       return  responseDTO;
    }

    @Override
    @Transactional
    public ResponseDTO GiaoToaNha(Long buildingId, List<Long> staffIds) {
        assignmentBuildingRepository.deleteByBuildingId(buildingId);
        BuildingEntity building = buildingRepository.findById(buildingId).orElse(null);
        if (building == null) {
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage("Building not found");
            return responseDTO;
        }
        for (Long staffId : staffIds) {
            UserEntity staff = userRepository.findById(staffId).orElse(null);
            if (staff != null) {
                AssignmentBuildingEntity assignmentBuilding = new AssignmentBuildingEntity();
                assignmentBuilding.setBuilding(building);
                assignmentBuilding.setStaff(staff);
                assignmentBuildingRepository.save(assignmentBuilding);
            }
        }
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Success");
        return responseDTO;
    }

//    @Override
//    public List<UserEntity> findUsersByRole(Long role) {
//       List<UserEntity> list = buildingRepository.findUsersByRole(role);
//       return list;
//    }

}
