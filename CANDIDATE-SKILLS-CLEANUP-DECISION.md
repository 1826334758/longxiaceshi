# CANDIDATE-SKILLS-CLEANUP-DECISION.md

## 结论

当前 `candidate-skills/` 中，以下 4 个写作相关目录已可视为**纯重复副本**，可以进入清理名单：

- `candidate-skills/novel-writer-structure`
- `candidate-skills/novel-writing`
- `candidate-skills/open-novel-writing`
- `candidate-skills/writers-room-story-engine`

保留项：

- `candidate-skills/inkos`

---

## 为什么这 4 个目录可以进入清理名单

我已逐步核对以下内容：

- `SKILL.md`
- `references/`
- `prompts/`
- `story-suite/`
- `scripts/`
- `README.md`
- `CHANGELOG.md`
- `PACKAGE-DESCRIPTION.md`
- `SOURCES.md`
- `CREATOR.md`
- `MEGA-SKILL.md`
- `TEST-PROMPTS.md`

核对结果：

这些目录中的主要文件，均已在正式 `skills/` 对应目录中存在，并且内容一致。

这说明它们当前已经不再承担“唯一候选材料”或“唯一附属资源”的作用，更接近历史残留的重复副本。

---

## 为什么 `inkos` 要保留

- `inkos` 当前只存在于 `candidate-skills/`
- 在 `skills/` 中没有正式对应项
- 它仍然属于真正待评估、待决定是否纳入正式区的候选 skill

因此，`inkos` 不在本轮清理名单中。

---

## 当前建议动作

### 第一阶段：文档层定性
已经完成：
- 为 `candidate-skills/` 增加了目录说明
- 为重复候选项制定了迁移计划
- 最终核实这些重复项已基本全部进入正式区

### 第二阶段：执行层清理
后续如果决定真正清理，建议直接删除以下 4 个目录：

- `candidate-skills/novel-writer-structure`
- `candidate-skills/novel-writing`
- `candidate-skills/open-novel-writing`
- `candidate-skills/writers-room-story-engine`

保留：
- `candidate-skills/inkos`
- `candidate-skills/README.md`

---

## 清理后的状态会更清楚

清理完成后，`candidate-skills/` 的含义会变得简单：

- 真正候选：`inkos`
- 目录说明：`README.md`

不再混入已经进入正式区的重复副本。

---

## 一句话判断

这 4 个写作候选目录已经完成了它们的历史过渡作用，继续留在 `candidate-skills/` 中只会增加噪音，不再提供新的独立价值。
