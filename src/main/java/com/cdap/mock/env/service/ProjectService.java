package com.cdap.mock.env.service;

import com.cdap.mock.biz.dao.cdapmysql.mapper.ProjectMapper;
import com.cdap.mock.constants.DataMockConstants;
import com.cdap.mock.vo.ProjectPlusEntity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.List;

/**
 * @author suyh
 * @since 2024-12-16
 */
@RequiredArgsConstructor
@Slf4j
public class ProjectService {
    private final List<ProjectPlusEntity> projectPlusEntities = Arrays.asList(
            DataMockConstants.PROJECT_HY,
            DataMockConstants.PROJECT_INR,
            DataMockConstants.PROJECT_CNY,
            DataMockConstants.PROJECT_BRL,
            DataMockConstants.PROJECT_PKR);

    private final ProjectMapper projectMapper;

    // 初始化项目和渠道，若没有则创建。同时若手动在数据库添加，则自动添加缺少的部分
    public void init() {
        List<ProjectPlusEntity> pnList = projectMapper.selectList();
        if (pnList == null || pnList.isEmpty()) {
            projectMapper.insertBatch(projectPlusEntities);
        }
    }

    public ProjectPlusEntity obtainEntityByPn(@Nullable String pn) {
        // 默认情况下，如果没有pn 时，处理成 hy
        if (!StringUtils.hasText(pn)) {
            return DataMockConstants.PROJECT_HY;
        }

        for (ProjectPlusEntity projectPlusEntity : projectPlusEntities) {
            if (pn.equals(projectPlusEntity.getPn())) {
                return projectPlusEntity;
            }
        }

        return null;
    }

    public List<ProjectPlusEntity> projectEntityList() {
        return projectPlusEntities;
    }

    public ProjectPlusEntity obtainEntityById(Long pnId) {
        if (pnId == null) {
            return null;
        }

        for (ProjectPlusEntity projectPlusEntity : projectPlusEntities) {
            if (pnId.equals(projectPlusEntity.getId())) {
                return projectPlusEntity;
            }
        }

        return null;
    }
}
