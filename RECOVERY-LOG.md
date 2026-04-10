# RECOVERY-LOG.md

本文档记录本次 `/.openclaw/workspace` Git 仓库损坏后的恢复过程，包括问题现象、诊断结论、执行步骤与最终状态。

## 一、问题背景

工作区原本存在 Git 仓库，但在检查时出现以下异常：

- `git status` 报错 `fatal: detected dubious ownership in repository at '/.openclaw/workspace'`
- 在补充 `safe.directory` 后，又出现：`fatal: bad object HEAD`
- `.git/HEAD` 仍指向 `refs/heads/master`
- refs 文件仍在，但对象库异常
- `git fsck --full` 报大量对象损坏/缺失
- `.git/objects` 实际几乎为空，无法支持原历史继续使用

## 二、核心诊断结论

这不是普通的分支错乱，而是：

## 原本地仓库对象库已经损坏，导致历史无法在原 `.git` 上继续正常运转。

具体表现为：
- HEAD 引用仍存在
- refs 仍存在
- 但 commit/tree/blob 对象缺失
- 因此无法依靠常规 `reset`、`checkout`、`reflog` 等方式恢复仓库

## 三、恢复目标

恢复时采用的目标不是“强行修补损坏 `.git`”，而是：

1. 保住当前工作区文件内容
2. 备份损坏仓库现场
3. 尽量重新接回远端历史
4. 建立一个可继续使用的本地 Git 仓库
5. 避免覆盖远端旧主线

## 四、执行过程

### 1. 处理 safe.directory

由于仓库目录所有权与当前 Git 视角不一致，先在不同 HOME 上下文补充安全目录：

- root 视角补过一次
- `/home/openclaw` 视角又补过一次

目的是让后续使用 `/home/openclaw` 的 SSH 配置访问 GitHub 时，不再被 safe.directory 拦住。

## 2. 备份损坏仓库

先保留损坏现场，避免误操作后无法回看：

- 备份压缩包：`state/git-backups/git-broken-20260410-094140.tar.gz`
- 原 `.git` 目录改名为：`.git.broken-20260410-094339`

这样即使后面重建仓库，也仍然保留了原始损坏证据。

## 3. 优先尝试接回远端

按“先试远端恢复”的思路，先验证远端是否可达。

一开始失败原因为：
- 默认 SSH 身份没有正确带上
- 直接访问 `git@github.com` 返回 `Permission denied (publickey)`

后续确认本机其实存在可用 SSH key：
- 私钥：`/home/openclaw/.ssh/id_ed25519`
- 配置：`/home/openclaw/.ssh/config`

配置中对 GitHub 做了如下特殊设置：
- `Host github.com`
- `HostName ssh.github.com`
- `Port 443`
- `User git`
- `IdentityFile ~/.ssh/id_ed25519`
- `IdentitiesOnly yes`

验证结果：
- GitHub 22 端口公钥认证成功
- GitHub 443 端口公钥认证成功
- `git ls-remote git@github.com:1826334758/longxiaceshi.git` 成功

说明：
## 远端仓库本身没有问题，问题主要在本地损坏仓库与 SSH 调用上下文。

## 4. 重建本地仓库

由于原对象库已经无法修复到可用状态，最终采用：

- 将损坏 `.git` 迁走保存
- `git init` 重新初始化本地仓库
- 以当前工作区文件为基础重新提交

设置的身份信息：
- `user.name = 智脑`
- `user.email = 2657665@qq.com`

重建后形成两次关键提交：
- `b09d9a8 Rebuild local repository from current workspace snapshot`
- `df1a502 Clean recovery artifacts from repository`

## 5. 清理恢复过程产物

恢复时产生了一些不适合长期纳入仓库的文件，因此补充了忽略规则：

```gitignore
.git.broken-*/
state/git-backups/
state/perm_test.txt
```

其中恢复期的两个典型残留：
- `state/git-backups/git-broken-20260410-094140.tar.gz`
- `state/perm_test.txt`

后续又专门删除并提交了一次：
- `4cb1db0 Remove recovery leftovers before publishing recovered branch`

## 6. 重新接回远端并抓取远端分支

在正确设置：
- `HOME=/home/openclaw`
- `GIT_SSH_COMMAND="ssh -F /home/openclaw/.ssh/config -i /home/openclaw/.ssh/id_ed25519 -o IdentitiesOnly=yes"`

后，成功完成：
- 添加/确认远端 `origin = git@github.com:1826334758/longxiaceshi.git`
- `git fetch origin`

抓取到的远端分支：
- `origin/main` -> `446d6f27b695adcda5446ff93bf40e5e8528968b`
- `origin/master` -> `808632d9eb9bf5398065a4af60b51df2f3d207f2`

## 7. 建立参考分支并比对

为了不改动当前工作线，建立了两个本地参考分支：

- `recover-origin-master` -> 跟踪 `origin/master`
- `recover-origin-main` -> 跟踪 `origin/main`

对比结果：
- 本地恢复线与 `origin/master` 关系较近
- 与 `origin/main` 差异较大

本地恢复线相较 `origin/master` 的主要差异：
- `.gitignore` 增加恢复期忽略规则
- `writing/` 下存在大量实际工作内容
- 恢复期残留文件后续已删除

## 8. 推送安全恢复分支

为了避免覆盖旧远端主线，没有直接推到 `origin/master`，而是新建远端分支：

- `origin/recovered-master`

推送前清理掉恢复残留文件后，成功推送。

随后又将本地当前分支名称从 `master` 统一整理为：
- `recovered-master`

并设置本地跟踪关系：
- `recovered-master` -> `origin/recovered-master`

## 9. 写入后续策略文档

为了防止后续遗忘，又增加：
- `GIT-RECOVERY-STRATEGY.md`

用于说明：
- 当前主工作线是谁
- 旧 `master/main` 的角色
- 日后推荐如何提交、pull、push

## 五、最终状态

当前分支角色如下：

- `recovered-master`
  - 当前主工作线
  - 跟踪 `origin/recovered-master`

- `recover-origin-master`
  - 旧远端 `master` 参考线

- `recover-origin-main`
  - 旧远端 `main` 参考线

远端当前主要分支：
- `origin/recovered-master`
- `origin/master`
- `origin/main`

## 六、结论

本次恢复的关键不是“修好原 `.git`”，而是：

## 在确认原对象库已损坏的前提下，保住工作区内容，保留损坏证据，重新建立一条可持续使用的 Git 主线，并安全接回远端。

这一目标已经完成。

## 七、后续建议

1. 以后默认在 `recovered-master` 上继续开发
2. 暂时不要覆盖旧远端 `master`
3. 把 `recover-origin-master` / `recover-origin-main` 当作只读参考线
4. 提交前优先检查：

```bash
git status
git diff --stat
```

5. 若未来确认恢复线稳定，再决定是否通过 PR 或合并方式把 `recovered-master` 扶正为正式主线
