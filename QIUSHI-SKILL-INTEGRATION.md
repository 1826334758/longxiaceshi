# QIUSHI-SKILL-INTEGRATION.md

## 结论

`qiushi-skill` 值得用，但不建议整包默认接入。更合适的做法是：

- 先接入最稳、最通用的核心 skill
- 复杂任务再启用分析/验证类 skill
- 大任务再使用完整 workflows

## 接入建议表

| Skill | 建议级别 | 什么时候用 | 备注 |
|---|---|---|---|
| `investigation-first` | 高 | 信息不足、陌生任务、排障前期 | 最稳，优先接入 |
| `concentrate-forces` | 高 | 多任务争资源、需要定主攻方向 | 很适合项目推进 |
| `contradiction-analysis` | 中 | 复杂问题、主次不清、trade-off | 只在复杂任务用 |
| `practice-cognition` | 中 | 需要验证、试错、迭代优化 | 不适合一次性小任务 |
| `workflows` | 低 | 大任务、专题攻坚、完整流程编排 | 容易变重，谨慎用 |

## 推荐使用策略

### 默认接入
- `investigation-first`
- `concentrate-forces`

### 条件触发
- `contradiction-analysis`
- `practice-cognition`

### 大任务专用
- `workflows`

## 一句话建议

如果现在开始真正使用 `qiushi-skill`，最建议先把下面两条作为默认工作方法：

1. 先调查再判断（`investigation-first`）
2. 先定主攻方向再铺开（`concentrate-forces`）

这样收益最大，也最不容易把任务流程搞得过重。
