package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public Page<BuildingEntity> searchBuildings(BuildingSearchRequest searchRequest, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT b FROM BuildingEntity b ");

        if (searchRequest.getStaffId() != null) {
            sql.append(" JOIN b.staffs s ");
        }
        if (searchRequest.getTypeCode() != null && !searchRequest.getTypeCode().isEmpty()) {
            sql.append(" JOIN b.renttypes r ");
        }

        sql.append(" WHERE 1=1 ");

        if (searchRequest.getStaffId() != null) {
            sql.append(" AND s.id = :staffId");
        }
        if (searchRequest.getTypeCode() != null && !searchRequest.getTypeCode().isEmpty()) {
            sql.append(" AND r.code IN (:typeCode) ");
        }
        if (StringUtils.hasText(searchRequest.getName())) {
            sql.append(" AND b.name LIKE :name");
        }
        if (searchRequest.getFloorArea() != null) {
            sql.append(" AND b.floorArea = :floorArea");
        }
        if (searchRequest.getDistrictid() != null) {
            sql.append(" AND b.district.id = :districtId");
        }
        if (StringUtils.hasText(searchRequest.getWard())) {
            sql.append(" AND b.ward LIKE :ward");
        }
        if (StringUtils.hasText(searchRequest.getStreet())) {
            sql.append(" AND b.street LIKE :street");
        }
        if (searchRequest.getNumberOfBasement() != null) {
            sql.append(" AND b.numberOfBasement = :numberOfBasement");
        }
        if (StringUtils.hasText(searchRequest.getDirection())) {
            sql.append(" AND b.direction LIKE :direction");
        }
        if (searchRequest.getLevel() != null) {
            sql.append(" AND b.level = :level");
        }
        if (searchRequest.getAreaFrom() != null) {
            sql.append(" AND b.floorArea >= :areaFrom");
        }
        if (searchRequest.getAreaTo() != null) {
            sql.append(" AND b.floorArea <= :areaTo");
        }
        if (searchRequest.getRentPriceFrom() != null) {
            sql.append(" AND b.rentPrice >= :rentPriceFrom");
        }
        if (searchRequest.getRentPriceTo() != null) {
            sql.append(" AND b.rentPrice <= :rentPriceTo");
        }
        if (StringUtils.hasText(searchRequest.getManagerName())) {
            sql.append(" AND b.managerName LIKE :managerName");
        }
        if (StringUtils.hasText(searchRequest.getManagerPhone())) {
            sql.append(" AND b.managerPhone LIKE :managerPhone");
        }

        Query query = entityManager.createQuery(sql.toString(), BuildingEntity.class);

        if (searchRequest.getStaffId() != null) {
            query.setParameter("staffId", searchRequest.getStaffId());
        }
        if (StringUtils.hasText(searchRequest.getName())) {
            query.setParameter("name", "%" + searchRequest.getName() + "%");
        }
        if (searchRequest.getFloorArea() != null) {
            query.setParameter("floorArea", searchRequest.getFloorArea());
        }
        if (searchRequest.getDistrictid() != null) {
            query.setParameter("districtId", searchRequest.getDistrictid());
        }
        if (StringUtils.hasText(searchRequest.getWard())) {
            query.setParameter("ward", "%" + searchRequest.getWard() + "%");
        }
        if (StringUtils.hasText(searchRequest.getStreet())) {
            query.setParameter("street", "%" + searchRequest.getStreet() + "%");
        }
        if (searchRequest.getNumberOfBasement() != null) {
            query.setParameter("numberOfBasement", searchRequest.getNumberOfBasement());
        }
        if (StringUtils.hasText(searchRequest.getDirection())) {
            query.setParameter("direction", "%" + searchRequest.getDirection() + "%");
        }
        if (searchRequest.getLevel() != null) {
            query.setParameter("level", searchRequest.getLevel());
        }
        if (searchRequest.getAreaFrom() != null) {
            query.setParameter("areaFrom", searchRequest.getAreaFrom());
        }
        if (searchRequest.getAreaTo() != null) {
            query.setParameter("areaTo", searchRequest.getAreaTo());
        }
        if (searchRequest.getRentPriceFrom() != null) {
            query.setParameter("rentPriceFrom", searchRequest.getRentPriceFrom());
        }
        if (searchRequest.getRentPriceTo() != null) {
            query.setParameter("rentPriceTo", searchRequest.getRentPriceTo());
        }
        if (StringUtils.hasText(searchRequest.getManagerName())) {
            query.setParameter("managerName", "%" + searchRequest.getManagerName() + "%");
        }
        if (StringUtils.hasText(searchRequest.getManagerPhone())) {
            query.setParameter("managerPhone", "%" + searchRequest.getManagerPhone() + "%");
        }
        if (searchRequest.getTypeCode() != null && !searchRequest.getTypeCode().isEmpty()) {
            query.setParameter("typeCode", searchRequest.getTypeCode());
        }

        // Phân trang
        int total = query.getResultList().size();
        List<BuildingEntity> results = query.setFirstResult((int) pageable.getOffset())
                .setMaxResults(pageable.getPageSize())
                .getResultList();

        return new PageImpl<>(results, pageable, total);
    }






//    @Override
//    public List<UserEntity> findUsersByRole(Long role) {
//        // JPQL
//        String queryStr = "SELECT u FROM UserEntity u JOIN UserRoleEntity ur ON u.id = ur.users.id WHERE ur.roles.id = :role";
//        TypedQuery<UserEntity> query = entityManager.createQuery(queryStr, UserEntity.class);
//        query.setParameter("role", role);
//        return query.getResultList();
//    }
}
