# Changelog

本项目遵循 [语义化版本](https://semver.org/lang/zh-CN/)：`MAJOR.MINOR.PATCH`。

## [1.1.0] - 2026-09-18

### Added
- **分级 PRD 规范**：按需求规模（小 / 普通 / 复杂）选择展示视图，不再强制所有需求维护两份独立 PRD。
- **Agent 权限分级**（L0 只读 → L1 草稿写 → L2 项目写 → L3 外部执行 → L4 生产操作），默认 L1，L3/L4 需人工授权与审计。
- **证据与置信度规则**：市场数据来源 7 级优先级、"待验证" 标记、用户事实 → 反馈 → 分析 → 假设的链路标注。
- **AI 输出质量门**：任务完成率 / 准确率 / 事实错误率 / 需求遗漏率 / 边界遗漏率 / 人工修改比例 / 工具调用错误率 / 成本 / 延迟，并附 AI 回归测试集。
- **变更管理规则**：正式产品基线的提议 → 评审 → 应用 → 记录流程，历史不删除，仅追加覆盖。
- **AI 产品专项要求**：AI 能力定义（模型 / 输入 / 输出 / 上下文 / 工具 / 权限 / 成本 / 延迟 / 失败 / 降级策略）、内置 Agent 定义、AI 计费规则。
- **多 Agent 协作模式**：单 Agent / 多 Agent 流水线 / Agent 自动执行 + 人工审批的适用边界。
- **版本迭代原则**：版本闭环（目标 → … → 复盘 → 下一版本）与版本末五问。
- **11 篇 references**：context-layers、product-goals-metrics、market-user-research、requirement-analysis、prototype-design、review-decisions、dev-testing、release-feedback、ai-product-rules、multi-agent、version-iteration。
- **8 份 assets/rules**：naming-and-structure、source-of-truth、status-and-gates、product-workflow、agent-permissions、evidence-and-confidence、quality-gates、change-management。
- **assets/templates**：requirement-pool（含需求卡 + P0–P3 图例）、confirmation-summary、dual-prd-skeleton、review-record、decision-log、metrics-definition。

### Changed
- `dual-prd-spec.md` 由"每份 PRD 必须双版"改为"单一结构化需求源 + 多种展示视图"分级制。
- 反模式由 5 条扩展到 13 条（新增：无来源引用市场数据、AI 推测当用户需求、只记结果不记原因、多文件维护同一规则、未授权修改正式规则、需求无成功指标、需求无验收标准、开发变更不同步、发布后无数据验证、为简单任务强上多 Agent、为所有需求强制双版 PRD）。
- `SKILL.md` 核心原则由 3 条扩展为 5 条，人机分工矩阵由 4 行扩展为 14 行细粒度。
- 精简设置由"6 状态 + 4 规则文件"对齐为 v1.1 四目录 + 4 核心规则定义。
- `init-product-project.sh` 升级为 `--minimal` / 完整双模式，完整模式覆盖 v1.1 全目录集与 8 规则文件。

### Fixed
- 修复断链引用：`assets/templates/dual-prd-skeleton.md` 原在 SKILL.md 与 HTML 手册中被引用但不存在，现已补齐。

## [1.0.0] - 2026-09-18

### Added
- 项目初始化脚手架 `scripts/init-product-project.sh`。
- 10 顶层目录结构（00–07、90、99）。
- 4 份核心规则文件（naming-and-structure、source-of-truth、status-and-gates、product-workflow）。
- 需求状态机（candidate → analyzing → defined → approved → released → closed）。
- 5 篇 references（directory-structure、status-machine、dual-prd-spec、decision-checklist、health-check）。
- 阶段闸道协议（Agent 确认摘要 → 人工确认 → 写入永久文件）。
- 三大核心心法（充分背景 / 约束与减法 / 慢下来）。
