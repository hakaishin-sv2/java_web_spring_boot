//package com.javaweb.repository;
//
//import com.javaweb.entity.AssignmentBuildingEntity;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.List;
//
//public interface AssignmentBuildingRepository extends JpaRepository<AssignmentBuildingEntity, Long> {
//    @Query("SELECT ab.staff.id FROM AssignmentBuildingEntity ab WHERE ab.building.id = :buildingId")
//    List<Long> findStaffIdsByBuildingId(@Param("buildingId") Long buildingId);
//    @Transactional
//    void deleteByBuildingId(Long buildingId);
//}
