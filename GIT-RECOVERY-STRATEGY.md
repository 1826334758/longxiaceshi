# GIT-RECOVERY-STRATEGY.md

当前仓库经过本地重建与远端重新接线后，采用以下 Git 策略。

## 当前分支角色

- `recovered-master`
  - 当前主工作线
  - 本地默认开发分支
  - 跟踪远端 `origin/recovered-master`

- `recover-origin-master`
  - 旧远端 `master` 的只读参考分支
  - 用于回看、比对、审计
  - 不在此分支上继续开发

- `recover-origin-main`
  - 旧远端 `main` 的只读参考分支
  - 与当前工作线差异较大
  - 暂不直接合并，保留作参考

## 当前推荐工作方式

以后默认在 `recovered-master` 上工作：

```bash
git status
git add -A
git commit -m "你的说明"
git push
```

如果需要先拉取再提交，优先用：

```bash
git pull --rebase
```

## 暂时不要做的事

- 不要直接覆盖远端 `master`
- 不要 force push 到旧主线
- 不要在 `recover-origin-master` 或 `recover-origin-main` 上继续日常开发
- 不要急着把 `origin/main` 合并到当前工作线

## 这三个远端分支的定位

- `origin/recovered-master`
  - 当前真实主工作线

- `origin/master`
  - 旧历史保留线

- `origin/main`
  - 另一条差异较大的历史线

## 日常检查建议

每次提交前至少看一眼：

```bash
git status
git diff --stat
```

避免把以下内容误提交：
- `state/` 里的测试文件
- 恢复备份产物
- 临时脚本或无关缓存

## 常用对比命令

查看当前工作线与旧 `master` 的差异：

```bash
git diff --stat recover-origin-master..recovered-master
```

查看当前分支跟踪关系：

```bash
git branch -vv
```

查看整体提交图：

```bash
git log --oneline --graph --decorate --all -n 20
```

## 后续建议

短期内：
- 持续在 `recovered-master` 上工作即可
- 先不要动旧 `master/main`

后续如果确认恢复线稳定，再决定是否：
- 长期保留 `recovered-master` 为主线
- 或通过 PR/合并策略把它扶正

## 备注

该策略形成背景：
- 原工作区 `.git` 对象库损坏，已无法直接恢复本地历史
- 已重新初始化本地仓库并保留当前工作区内容
- 已成功通过 SSH 接回远端仓库
- 已将当前恢复后的工作线安全推送到 `origin/recovered-master`
