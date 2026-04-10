# candidate-skills/README.md

## 目的

这个目录用于存放：

1. 尚未正式纳入 `skills/` 的候选 skill
2. 已有正式 skill 对应项，但仍保留附属材料、包装文件、脚本、提示词或历史整理资料的候选目录

**默认原则：**
- `skills/` 是正式技能区
- `candidate-skills/` 是候选 / 过渡 / 附属材料区
- 当 `candidate-skills/<name>/SKILL.md` 与 `skills/<name>/SKILL.md` 同时存在时，**以 `skills/` 中的版本为正式生效版本**

---

## 当前状态

### 真正唯一候选

- `inkos`
  - 当前仅存在于 `candidate-skills/`
  - 属于真正待评估、待决定是否纳入正式技能区的候选项

### 已有正式版本、但候选目录仍保留附属材料

以下目录的 `SKILL.md` 已与 `skills/` 中的正式版本重复，当前保留该候选目录的主要原因不是 skill 主文件本身，而是目录中仍包含额外材料：

- `novel-writer-structure`
  - 附属材料示例：`references/state-tracking-template.md`

- `novel-writing`
  - 附属材料示例：`references/style-guide.md`、`scripts/novel.py`

- `open-novel-writing`
  - 附属材料示例：
    - `references/novel_template.md`
    - `references/review_criteria.md`
    - `references/writing_principles.md`
    - `scripts/auto_write.py`
    - `scripts/check_quality.py`

- `writers-room-story-engine`
  - 附属材料示例：
    - `README.md`
    - `CHANGELOG.md`
    - `MEGA-SKILL.md`
    - `SOURCES.md`
    - `TEST-PROMPTS.md`
    - `prompts/*`
    - `story-suite/*`

---

## 当前使用规则

### 正式 skill 生效规则

如果一个 skill 同时出现在：
- `skills/<name>/`
- `candidate-skills/<name>/`

则默认视为：

- `skills/<name>/SKILL.md` = 正式生效版本
- `candidate-skills/<name>/` = 候选包装 / 附属材料 / 迁移中目录

### 维护规则

- 不要默认把 `candidate-skills/` 当正式技能入口
- 不要在不检查附属材料的情况下直接删除重复目录
- 后续如要清理重复项，应先迁移或整理其中的 `references/`、`scripts/`、`prompts/`、`README`、`CHANGELOG` 等材料

---

## 后续整理建议

1. 继续以 `skills/` 作为唯一正式技能区
2. 对重复候选目录逐步迁移附属材料
3. 在附属材料迁移完成后，再删除纯重复候选目录
4. 保留 `inkos` 作为真正候选 skill 继续评估
