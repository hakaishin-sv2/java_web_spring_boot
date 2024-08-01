package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.BuildingRenttypeEntity;
import com.javaweb.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BuildingRentypeRepository extends JpaRepository<BuildingRenttypeEntity,Long> {


}
