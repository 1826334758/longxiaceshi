# PR-DRAFT-RECOVERED-MASTER.md

## PR 标题

**恢复工作区 Git 仓库，并将 `recovered-master` 设为安全工作分支**

## PR 描述

```markdown
## 概要

`/.openclaw/workspace` 原本的本地 Git 仓库已经无法继续安全使用，核心原因是对象库损坏，导致原历史无法正常读取和延续。本次变更的目标不是强行修补损坏的 `.git`，而是在保住当前工作区真实内容的前提下，重新建立一条可持续使用的 Git 工作线，并将其安全发布到新的远端分支 `recovered-master`。

本次处理同时保留了旧远端 `master` 和 `main`，避免直接覆盖历史，便于后续审计、比对和选择正式主线。

## 问题背景

原本地仓库出现了以下异常现象：

- `git status` 先报 `safe.directory` 相关告警
- 后续出现 `fatal: bad object HEAD`
- `.git/HEAD` 仍指向原有分支引用
- refs 仍然存在，但对象库已经不可用
- `git fsck --full` 检测到大量对象缺失/损坏

这说明问题并非普通的分支错乱或 HEAD 漂移，而是原 `.git` 对象数据库本身已经损坏。  
在这种情况下，继续尝试基于旧对象库做常规修复，风险高且不可控。

## 处理目标

本次恢复遵循以下原则：

1. 保住当前工作区中的真实内容
2. 保留损坏仓库现场，避免证据丢失
3. 尽量重新接回远端已有历史
4. 建立一条清晰、可继续工作的 Git 主线
5. 不直接覆盖旧远端 `master`

## 本次变更做了什么

### 1. 保留损坏现场
- 备份损坏仓库相关内容
- 将原损坏 `.git` 迁移保存，而不是直接覆盖或删除

### 2. 重新建立本地可用仓库
- 基于当前工作区快照重新初始化本地 Git 仓库
- 重新生成可用提交历史
- 保留当前工作成果而不是丢弃工作区状态

### 3. 重新接回远端
- 重新确认 SSH key 与 GitHub 访问链路可用
- 成功抓取远端已有分支
- 与远端 `master` / `main` 建立只读参考关系用于比对

### 4. 安全发布恢复线
- 不覆盖旧远端 `master`
- 将恢复后的当前工作线发布到新分支 `recovered-master`
- 将本地当前工作分支也统一命名为 `recovered-master`

### 5. 清理与文档化
- 清理恢复过程中产生的临时残留文件
- 补充恢复相关 `.gitignore` 规则
- 删除已无实际用途的 `BOOTSTRAP.md`
- 新增恢复说明、分支策略和入口索引文档

## 新增/整理的关键文档

- `RECOVERY-LOG.md`
  - 本次 Git 仓库损坏与恢复全过程记录
  - 包括问题现象、诊断结论、修复步骤与最终状态

- `GIT-RECOVERY-STRATEGY.md`
  - 恢复后的分支策略说明
  - 约定后续默认在 `recovered-master` 上继续工作
  - 说明旧 `master` / `main` 的参考角色

- `README.md`
  - 工作区入口索引
  - 便于后续维护者快速找到恢复相关文档和关键入口文件

## 当前分支策略

### 当前主工作线
- `recovered-master`
  - 当前默认开发分支
  - 对应远端 `origin/recovered-master`

### 历史参考线
- `origin/master`
  - 保留旧历史，不直接覆盖

- `origin/main`
  - 与当前工作线差异较大，暂作参考，不直接合并

- 本地参考分支：
  - `recover-origin-master`
  - `recover-origin-main`

上述参考分支仅用于对比、审计、回看，不用于继续日常开发。

## 验证结果

已完成以下验证：

- 本地仓库已可正常执行 `git status`
- 本地仓库可正常 `commit`
- SSH 已可正常访问 GitHub 远端
- 远端已成功创建并更新 `recovered-master`
- 当前工作区已无未提交改动
- 恢复相关说明文档已写入仓库，可供后续维护与交接使用

## 关键提交参考

与本次恢复直接相关的提交包括：

- `b09d9a8` Rebuild local repository from current workspace snapshot
- `df1a502` Clean recovery artifacts from repository
- `4cb1db0` Remove recovery leftovers before publishing recovered branch
- `0333be4` Document post-recovery Git branch strategy
- `db4c74e` Document Git repository recovery process
- `f4864cd` Add workspace index linking recovery docs
- `d2e93b9` Remove obsolete bootstrap instructions

## 为什么采用这种方案

本次方案优先考虑的是“保住现状、保留历史、降低风险”：

- 不强行在损坏对象库上继续修
- 不直接覆盖旧远端主线
- 不把差异较大的旧 `main` 强行并入当前工作线
- 先建立一条稳定、可工作的恢复分支，再决定未来是否扶正为正式主线

这是更稳妥、也更利于交接和审计的处理方式。

## 后续建议

- 短期内默认在 `recovered-master` 上继续工作
- 暂时不要直接覆盖旧 `master`
- 将 `recover-origin-master` / `recover-origin-main` 作为只读参考线
- 若后续确认恢复线稳定，再通过 PR 或合并策略决定是否将 `recovered-master` 扶正为正式主线
```
