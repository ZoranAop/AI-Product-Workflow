# Changelog

本项目遵循 [语义化版本](https://semver.org/lang/zh-CN/)：`MAJOR.MINOR.PATCH`。

## [1.2.0] - 2026-09-18

### Added
- **Product Completeness Check Engine**：`assets/rules/completeness-check.md`，将 checklist 升级为可执行检查：Check Result Model（PASS/FAIL/UNKNOWN/N/A）、12 步执行协议、Check ID 体系（PC-PRODUCT / PC-UX / PC-DATA / PC-TECH / PC-AI / PC-AGENT / PC-BILLING / PC-SECURITY / PC-TEST / PC-RELEASE / PC-METRICS / PC-CONSIST / PC-GATE）、各完整性矩阵、跨文档一致性检查、Stage Gate 机器可判定规则、变更影响分析、回归集约定。
- **六个检查模式**：`references/check-modes.md` 定义 Understand / Advance / Completeness / Consistency / Change Impact / Retrospective 路由；`references/project-understanding.md`（证据标注的项目理解摘要，草案性质）；`references/retrospective-loop.md`（复盘结论走 change-management 闸门 + regression 重跑才修改规则）。
- **统一证据模型升级**：`evidence-and-confidence.md` 由三级（Verified/Assumed/Unverified）升级为四级（VERIFIED / ASSUMED / INFERRED / UNVERIFIED），并新增检查结果判定规则表与“AI 推断 → 正式事实”防火墙规则。
- **Source of Truth 完整映射表**：`source-of-truth.md` 补齐 8 行信息→唯一来源映射（含 Version Scope、Test Evidence、Release Evidence、Raw Inputs），并定义 5 条跨文档一致性不变量（status / scope / decision / acceptance / evidence）。
- **Completeness Report 模板**：`assets/templates/completeness-report.md`，11 节结构 + 人工确认块，未确认仅为草案。
- **AI Regression Cases 模板**：`assets/templates/ai-regression-cases.md`，6 个固定 case（完整需求 / 缺 Billing / PRD 与技术冲突 / AI 无 fallback / 仅 AI 推断证据的 released / 版本范围与状态不符），含预期结果表与运行日志。

### Changed
- `SKILL.md` 新增 §6 Check Modes 与 3 条反模式（理解摘要/报告不得替代事实来源、不得在 PRD/Agent spec 内编辑 status、复盘不得未经决策+回归直接改规则）；原 §6–§9 顺移为 §7–§10。
- `init-product-project.sh` full 模式现在拷贝 `completeness-check.md` 到 `00-rules/`，`ai-regression-cases.md` 与 `completeness-report` 模板到 `03-planning/`。

### Fixed
- 状态机冲突：`reviewing` 不是状态，仅是闸门动作。修正 3 处引用——`assets/rules/status-and-gates.md`、`assets/rules/change-management.md`、`references/status-machine.md`，统一为“重大变更回 `analyzing`，仅复审回 `defined`”，状态机保持 6 态（candidate → analyzing → defined → approved → released → closed）。
- `dual-prd-skeleton.md` 中 Agent spec 的 `status` 字段定位为 derived view（只读展示，唯一维护源为 requirement pool），消除与 source-of-truth 规则的矛盾。
- 双 PRD 规则统一为“单一结构化需求源 + 人工视图 + Agent 视图”，Agent 视图不得成为 status 维护源。

---

## [1.1.1] - 2026-09-18

### Added
- **新品项目 Bootstrap 检查清单**：新增 `references/new-project-bootstrap.md`，为新产品项目提供前 14 天落地清单（minimal 起步、先填 `02-product/`、指标口径、何时切 full、非 AI 产品可跳过的章节）。

---

## [1.1.0] - 2026-09-18

### Added
- **在线 Skill 生态映射**：新增 `references/skill-ecosystem.md`，将 v1.1 工作流 10 个阶段映射到 skills.sh 开放生态中的可辅助 skill（仅参考，不安装）；`assets/templates/skill-integration-plan.md` 记录团队实际采纳哪些 skill 及其落地位置。
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
