# WORKSPACE-STRUCTURE.md

## 目的

这个文件用于说明工作区顶层目录和关键文件的职责边界，减少“正式区 / 候选区 / 写作区 / 历史残留区”混在一起造成的理解成本。

---

## 顶层目录说明

### 正式使用区

- `skills/`
  - 当前正式启用的技能目录
  - 默认应把这里视为工作区主技能区

- `memory/`
  - 日常记忆与长期上下文记录
  - 包括按日期记录的 daily memory

- `writing/`
  - 写作项目区 / 写作工作台区
  - 适合放长期写作项目、工作流目录、项目化写作资料

### 方法论与外部独立仓库

- `qiushi-skill/`
  - 独立 skill 仓库
  - 当前定位为方法论参考与按需调用来源
  - 不是当前工作区标准 `skills/` 直接挂载项

### 候选 / 实验区

- `candidate-skills/`
  - 候选技能区
  - 只应存放未定稿、待评估、待决定是否纳入正式区的技能
  - 不应长期保留与 `skills/` 完全重复的正式内容

- `candidate-heartbeat/`
  - heartbeat 相关候选方案 / 试验目录

- `candidate-proactive-full/`
  - proactive / heartbeat / agent task 相关候选方案区

### 单作品 / 草稿区

- `novel/`
  - 更适合作为单个作品、单文件草稿或较轻量写作内容存放区
  - 不建议与 `writing/` 混用同一种项目结构

### 状态 / 运行辅助区

- `state/`
  - 状态文件、临时产物、运行辅助信息
  - 不应承担正式文档或正式项目内容

### 历史残留 / 备份区

- `.git.broken-20260410-094339/`
  - Git 恢复时留下的损坏仓库残留目录
  - 当前已忽略，不参与版本控制
  - 后续应考虑归档或移出工作区顶层，减少噪音

---

## 顶层关键文件说明

- `README.md`
  - 工作区索引入口
  - 用于快速找到关键说明文件

- `SKILL-SYSTEM.md`
  - 技能体系分层、调用优先级、典型工作流说明

- `QIUSHI-SKILL-INTEGRATION.md`
  - `qiushi-skill` 的接入建议与最小使用策略

- `WORKSPACE-STRUCTURE-AUDIT.md`
  - 对当前工作区结构问题的审计结果

- `GIT-RECOVERY-STRATEGY.md`
  - Git 恢复后的分支使用建议

- `RECOVERY-LOG.md`
  - Git 恢复过程记录

- `AGENTS.md`
  - 工作区运行规则与约定

- `SOUL.md`
  - 助手人格与行为风格定义

- `USER.md`
  - 用户偏好与称呼等信息

- `TOOLS.md`
  - 本地工具与环境备注

- `HEARTBEAT.md`
  - heartbeat 轮询任务入口

---

## 当前推荐理解方式

### 技能相关
- `skills/` = 正式技能区
- `candidate-skills/` = 候选技能区
- `qiushi-skill/` = 独立方法论仓库

### 写作相关
- `writing/` = 项目化写作区
- `novel/` = 单作品 / 草稿区

### 维护相关
- `memory/` = 记忆区
- `state/` = 状态与临时产物区
- `.git.broken-*` = 历史恢复残留，不作为当前工作内容的一部分

---

## 后续整理建议

1. 优先清理 `candidate-skills/` 与 `skills/` 的重复项
2. 固化写作四大 skill 的角色边界
3. 后续处理 `.git.broken-*` 历史残留目录
4. 在需要时继续补充顶层目录说明，保持这个文件为工作区结构真相来源
