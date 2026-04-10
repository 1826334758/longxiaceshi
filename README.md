# Workspace Index

这个工作区当前的关键入口文件如下。

## Git 恢复相关

- `GIT-RECOVERY-STRATEGY.md`
  - 恢复后的 Git 分支策略
  - 说明当前主工作线、参考分支和日常推荐操作

- `RECOVERY-LOG.md`
  - 本次 Git 仓库损坏与恢复的完整过程记录
  - 包括问题现象、诊断、修复步骤与最终状态

## 身份与协作

- `SOUL.md`
  - 助手人格、风格与行为边界

- `USER.md`
  - 用户偏好与称呼等信息

- `IDENTITY.md`
  - 助手身份设定

## 工作区规则

- `AGENTS.md`
  - 工作区总规则与运行约定

- `TOOLS.md`
  - 本地环境/工具备注

- `HEARTBEAT.md`
  - 心跳轮询任务入口

## 工作区结构

- `WORKSPACE-STRUCTURE.md`
  - 顶层目录与关键文件的职责边界说明
  - 用于区分正式区、候选区、写作区与历史残留区

- `WORKSPACE-STRUCTURE-AUDIT.md`
  - 当前工作区结构问题的审计结果与整理优先级

## 技能系统

- `SKILL-SYSTEM.md`
  - 技能系统相关说明

## 当前 Git 主线

当前建议默认在以下分支上工作：

- `recovered-master`

如需回看恢复背景，优先先读：

1. `RECOVERY-LOG.md`
2. `GIT-RECOVERY-STRATEGY.md`
