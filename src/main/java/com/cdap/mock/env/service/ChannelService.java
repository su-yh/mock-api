package com.cdap.mock.env.service;

import com.cdap.mock.platform.dao.cdapmysql.entity.ChannelEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.FissileChannelEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.ProjectEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.SubChannelEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.plus.SubChannelPlusEntity;
import com.cdap.mock.platform.dao.cdapmysql.mapper.ChannelMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.FissileChannelMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.SubChannelMapper;
import com.cdap.mock.platform.task.common.EnvLocalThread;
import com.cdap.mock.vo.ProjectPlusEntity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author suyh
 * @since 2024-12-16
 */
@RequiredArgsConstructor
@Slf4j
public class ChannelService {
    private List<ChannelEntity> channelEntities;
    private List<SubChannelPlusEntity> subChannelEntities;
    private List<FissileChannelEntity> fissileChannelEntities = new ArrayList<>();
    // 保证每个随机生成的 subChannel 不重复
    private final Set<Integer> subChannelSet = new HashSet<>();

    private final Random random = new Random();

    private final ChannelMapper channelMapper;
    private final SubChannelMapper subChannelMapper;
    private FissileChannelMapper fissileChannelMapper;  // TODO: suyh - 待裂变渠道处理好了之后，再打开 final

    private final ProjectService projectService;

    public synchronized void init() {
        List<ProjectPlusEntity> projectPlusEntities = projectService.projectEntityList();
        if (projectPlusEntities == null || projectPlusEntities.isEmpty()) {
            log.error("projectEntities is empty.");
            return;
        }

        mockChannel(projectPlusEntities);
        if (fissileChannelMapper != null) {
            // TODO: suyh - 待裂变渠道处理好了之后，再打开
            mockFissileChannel(projectPlusEntities);
        }

        this.channelEntities = channelMapper.selectList();
        this.subChannelEntities = subChannelMapper.selectList();
        for (SubChannelPlusEntity subChannelEntity : subChannelEntities) {
            String pn = null;
            for (ChannelEntity channelEntity : channelEntities) {
                if (subChannelEntity.getChannelId().equals(channelEntity.getId())) {
                    Long projectId = channelEntity.getProjectId();
                    ProjectPlusEntity projectPlusEntity = projectService.obtainEntityById(projectId);
                    pn = projectPlusEntity.getPn();
                    break;
                }
            }

            if (!StringUtils.hasText(pn)) {
                throw new RuntimeException("pn is empty. sub channel entity id: " + subChannelEntity.getId());
            }

            subChannelEntity.setPn(pn);
        }

        if (fissileChannelMapper != null) {
            // TODO: suyh - 待裂变渠道处理好了之后，再打开
            this.fissileChannelEntities = fissileChannelMapper.selectList();
        }
    }

    private void mockChannel(List<ProjectPlusEntity> projectPlusEntities) {
        for (ProjectPlusEntity projectPlusEntity : projectPlusEntities) {
            doMockChannel(projectPlusEntity);
        }
    }

    private void doMockChannel(ProjectPlusEntity p) {
        if (!StringUtils.hasText(p.getPn())) {
            log.error("pn is empty, project entity id: {}", p.getId());
            return;
        }

        List<ChannelEntity> channelEntities = channelMapper.selectListByProjectId(p.getId());
        if (channelEntities == null || channelEntities.isEmpty()) {
            initSingleChannel(p);
            channelEntities = channelMapper.selectListByProjectId(p.getId());
            if (channelEntities == null || channelEntities.isEmpty()) {
                throw new RuntimeException("init channel failed, project id: " + p.getId());
            }
        }

        for (ChannelEntity ce : channelEntities) {
            List<SubChannelPlusEntity> subChannelList = subChannelMapper.selectByChannelId(ce.getId());
            if (subChannelList == null || subChannelList.isEmpty()) {
                initSubChannelList(ce, p.getPn());
            }
        }
    }

    private void mockFissileChannel(List<ProjectPlusEntity> projectPlusEntities) {
        for (ProjectPlusEntity projectPlusEntity : projectPlusEntities) {
            doMockFissileChannel(projectPlusEntity);
        }
    }

    private void doMockFissileChannel(ProjectPlusEntity p) {
        List<ChannelEntity> channelEntities = channelMapper.selectListByProjectId(p.getId());
        List<Integer> ceIds = channelEntities.stream().filter(Objects::nonNull).map(ChannelEntity::getId)
                .filter(Objects::nonNull).collect(Collectors.toList());

        List<FissileChannelEntity> fissileChannelEntities = fissileChannelMapper.selectByPn(p.getPn());
        if (fissileChannelEntities == null || fissileChannelEntities.isEmpty()) {
            List<SubChannelPlusEntity> subChannelEntities = subChannelMapper.selectByChannelIds(ceIds);
            if (subChannelEntities != null && !subChannelEntities.isEmpty()) {
                // 使用map 主要是去重，如果随到相同的subChannel
                Set<Integer> subChannelIdSet = new HashSet<>();
                // 一个项目最多有 1/5 数量的裂变渠道
                int pnFissileCount = subChannelEntities.size() / 5;
                for (int i = 0; i < pnFissileCount; i++) {
                    int idx = random.nextInt(subChannelEntities.size());
                    SubChannelPlusEntity subChannelEntity = subChannelEntities.get(idx);
                    if (!subChannelIdSet.add(subChannelEntity.getId())) {
                        continue;
                    }

                    FissileChannelEntity fissileChannelEntity = new FissileChannelEntity();
                    fissileChannelEntity.setChannel(subChannelEntity.getChannelCode()).setEnable(1).setPn(p.getPn());
                    fissileChannelMapper.insert(fissileChannelEntity);
                }
            }
        }
    }

    private void initSingleChannel(ProjectEntity p) {
        ChannelEntity ce = new ChannelEntity();
        ce.setChannelName("CHANNEL_NAME_MOCK_" + p.getPn());
        ce.setProportion(BigDecimal.valueOf(0.10));
        ce.setStartCode(1);
        ce.setEndCode(10000);
        ce.setProjectId(p.getId());
        channelMapper.insert(ce);

        log.info("------初始化 single channel, owner pn: {} ---", p.getPn());
    }

    // 每个channel 下生成对应数量的subChannel
    private void initSubChannelList(ChannelEntity ce, String ownerPn) {
        Integer subChannelCount = EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.get().getSubChannelCount();

        List<SubChannelPlusEntity> subChannelEntities = new ArrayList<>();
        for (int i = 0; i < subChannelCount; i++) {
            // 最多随机100W 次，如果都没随机到，那就直接报错退出。
            Integer channelCodeNumber = null;
            for (int j = 0; j < 1_000_000; j++) {
                int chRdm = random.nextInt(990_000) + 1_000 + 1_000_000;
                if (subChannelSet.add(chRdm)) {
                    channelCodeNumber = chRdm;
                    break;
                }
            }
            if (channelCodeNumber == null) {
                throw new RuntimeException("channel code random failed.");
            }

            SubChannelPlusEntity sce = new SubChannelPlusEntity();
            sce.setChannelCode(ownerPn + "_subch_" + channelCodeNumber);
            sce.setPackageName("pkgName_" + channelCodeNumber);
            sce.setChannelId(ce.getId());
            subChannelEntities.add(sce);
        }
        subChannelMapper.insertBatch(subChannelEntities);

        log.info("---------初始化 subChannel size: {}, owner pn: {}, owner channel: {} ---",
                subChannelEntities.size(), ownerPn, ce.getChannelName());
    }

    public List<ChannelEntity> selectListByProjectId(Long pnId) {
        List<ChannelEntity> entities = new ArrayList<>();

        for (ChannelEntity channelEntity : channelEntities) {
            if (pnId.equals(channelEntity.getProjectId())) {
                entities.add(channelEntity);
            }
        }

        return entities;
    }

    public List<SubChannelEntity> selectByChannelId(Integer channelId) {
        List<SubChannelEntity> entities = new ArrayList<>();
        for (SubChannelEntity subChannelEntity : subChannelEntities) {
            if (channelId.equals(subChannelEntity.getChannelId())) {
                entities.add(subChannelEntity);
            }
        }
        return entities;
    }

    public boolean isFissileChannel(String channel) {
        for (FissileChannelEntity fissileChannelEntity : fissileChannelEntities) {
            if (channel.equals(fissileChannelEntity.getChannel())) {
                return true;
            }
        }

        return false;
    }

    public SubChannelPlusEntity obtainRandomEntity() {
        int ind = random.nextInt(subChannelEntities.size());
        return subChannelEntities.get(ind);
    }
}
