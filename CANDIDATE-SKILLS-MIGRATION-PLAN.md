# CANDIDATE-SKILLS-MIGRATION-PLAN.md

## 结论

`candidate-skills/` 中那 4 个与正式区重复的写作 skill，不适合直接整目录删除。

原因不是 `SKILL.md` 本身，而是目录里还带着额外材料。更稳的做法是：

1. 先把附属材料分类
2. 能迁的先迁参考材料
3. 脚本先不动
4. 包装说明类文档先保留在候选区

---

## 涉及的重复候选目录

- `candidate-skills/novel-writer-structure`
- `candidate-skills/novel-writing`
- `candidate-skills/open-novel-writing`
- `candidate-skills/writers-room-story-engine`

这些目录中的 `SKILL.md` 已与 `skills/` 中正式版本重复。

---

## 分类原则

### 一、可迁入正式区的参考材料

这类文件主要用于：
- 辅助正式 skill 使用
- 补充模板、参考规范、提示顺序
- 作为写作/路由参考材料

优先考虑后续迁入正式 skill 目录或其 references 子目录。

### 二、暂不迁移的脚本文件

这类文件可能存在：
- 运行依赖
- 调用约定
- 适用范围不明确

在没有单独验证前，先不要迁移，以免把候选区脚本误当正式运行组件。

### 三、保留在候选区的包装说明材料

这类文件主要是：
- README
- CHANGELOG
- SOURCES
- PACKAGE 说明
- TEST 提示词

它们更像候选 skill 的包装、来源、发布材料，而不是正式 skill 运行必需内容。

---

## 分类结果

### 1. `novel-writer-structure`

#### 可迁参考材料
- `references/state-tracking-template.md`

#### 暂不迁
- 无

#### 保留候选区
- 其余包装文件维持现状

---

### 2. `novel-writing`

#### 可迁参考材料
- `references/style-guide.md`

#### 暂不迁
- `scripts/novel.py`

#### 保留候选区
- 其余包装文件维持现状

---

### 3. `open-novel-writing`

#### 可迁参考材料
- `references/novel_template.md`
- `references/review_criteria.md`
- `references/writing_principles.md`

#### 暂不迁
- `scripts/auto_write.py`
- `scripts/check_quality.py`

#### 保留候选区
- 其余包装文件维持现状

---

### 4. `writers-room-story-engine`

#### 可迁参考材料
- `prompts/system-prompt-writers-room-story-engine.md`
- `prompts/workflow-order.md`
- `story-suite/building-storyworlds.md`
- `story-suite/creating-story-foundations.md`
- `story-suite/designing-stories.md`
- `story-suite/revising-stories.md`
- `story-suite/writing-story-scenes.md`

#### 暂不迁
- 无脚本

#### 保留候选区包装材料
- `README.md`
- `CHANGELOG.md`
- `CREATOR.md`
- `MEGA-SKILL.md`
- `PACKAGE-DESCRIPTION.md`
- `SOURCES.md`
- `TEST-PROMPTS.md`

---

## 推荐迁移顺序

### 第一批（最稳）
先迁参考材料：
- `references/`
- `prompts/`
- `story-suite/`

### 第二批（后评估）
再看是否需要处理脚本：
- `scripts/novel.py`
- `scripts/auto_write.py`
- `scripts/check_quality.py`

### 第三批（最后处理）
等附属材料迁移完成后，再考虑是否删除重复候选目录中的纯重复部分。

---

## 一句话建议

先把“能直接帮助正式 skill 的参考材料”迁过去，脚本先别碰，包装说明先保留。这样最稳，不容易误删或误接线。
