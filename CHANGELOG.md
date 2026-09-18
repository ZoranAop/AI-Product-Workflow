# Changelog

本项目遵循 [语义化版本](https://semver.org/lang/zh-CN/)：`MAJOR.MINOR.PATCH`。

## [1.2.0] - 2026-09-18

### Added
- **产品完整性检查层（可执行检查引擎）**：新增 `assets/rules/completeness-check.md`，将 checklist 升级为可执行检查：Check Result Model（PASS / FAIL / UNKNOWN / N/A）、12 步执行协议、Check ID 体系（PC-PRODUCT / PC-UX / PC-DATA / PC-TECH / PC-AI / PC-AGENT / PC-BILLING / PC-SECURITY / PC-TEST / PC-RELEASE / PC-METRICS / PC-CONSIST / PC-GATE）、13 类完整性矩阵、跨文档一致性检查、Stage Gate 机器可判定规则、变更影响分析、回归集绑定约定。
- **六个检查模式**：`references/check-modes.md` 定义 Understand / Advance / Completeness / Consistency / Change Impact / Retrospective 的路由规则与输出纪律；`references/project-understanding.md`（证据标注的项目理解摘要，未确认仅为草案）；`references/retrospective-loop.md`（复盘结论须走 change-management 闸门 + regression 重跑才能修改规则，含防膨胀与重复缺陷强制规则）。
- **统一证据模型升级**：`evidence-and-confidence.md` 由三级（Verified / Assumed / Unverified）升级为四级（VERIFIED / ASSUMED / INFERRED / UNVERIFIED），并新增检查结果判定规则表与“AI 推断 → 正式事实”防火墙规则（推断写入正式文件必须先经人工确认转为 VERIFIED 或 ASSUMED）。
- **Source of Truth 完整映射表**：`source-of-truth.md` 补齐 8 行信息→唯一来源映射（含 Version Scope、Test Evidence、Release Evidence、Raw Inputs），并定义 5 条跨文档一致性不变量（status / scope / decision / acceptance / evidence），冲突时单一来源始终胜出。
- **完整性报告模板**：`assets/templates/completeness-report.md`，11 节结构（总结 / 已证实事实 / 假设与推断 / 缺失 / 矛盾 / 检查结果 / 风险 / 行动项 / 一致性 / 阶段闸门 / 人工确认块），未确认仅为草案。
- **AI 回归用例模板**：`assets/templates/ai-regression-cases.md`，6 个固定 case（完整需求 / 缺 Billing / PRD 与技术冲突 / AI 无 fallback / 仅 AI 推断证据的 released / 版本范围与状态不符），含预期结果表与运行日志。
- **在线 Skill 生态映射**：新增 `references/skill-ecosystem.md`，将 10 个阶段映射到 skills.sh 开放生态中的可辅助 skill（仅参考，不安装）；`assets/templates/skill-integration-plan.md` 记录团队实际采纳哪些 skill 及其落地位置。
- **新品项目 Bootstrap 检查清单**：`references/new-project-bootstrap.md`，为新产品项目提供前 14 天落地清单（minimal 起步、先填 `02-product/`、指标口径、何时切 full、非 AI 产品可跳过的章节）。
- **分级 PRD 规范**：按需求规模（小 / 普通 / 复杂）选择展示视图，不再强制所有需求维护两份独立 PRD。
- **Agent 权限分级**：L0 只读 → L1 草稿写 → L2 项目写 → L3 外部执行 → L4 生产操作，默认 L1，L3/L4 需人工授权与审计（`assets/rules/agent-permissions.md`）。
- **AI 输出质量门**：任务完成率 / 准确率 / 事实错误率 / 需求遗漏率 / 边界遗漏率 / 人工修改比例 / 工具调用错误率 / 成本 / 延迟，并附 AI 回归测试集（`assets/rules/quality-gates.md`）。
- **变更管理规则**：正式产品基线的提议 → 评审 → 应用 → 记录流程，历史不删除，仅追加覆盖（`assets/rules/change-management.md`）。
- **AI 产品专项要求**：AI 能力定义（模型 / 输入 / 输出 / 上下文 / 工具 / 权限 / 成本 / 延迟 / 失败 / 降级策略）、内置 Agent 定义、AI 计费规则（`references/ai-product-rules.md`）。
- **多 Agent 协作模式**：单 Agent / 多 Agent 流水线 / Agent 自动执行 + 人工审批的适用边界（`references/multi-agent.md`）。
- **版本迭代原则**：版本闭环（目标 → … → 复盘 → 下一版本）与版本末五问（`references/version-iteration.md`）。
- **21 份 references**：context-layers、product-goals-metrics、market-user-research、requirement-analysis、prototype-design、review-decisions、dev-testing、release-feedback、ai-product-rules、multi-agent、version-iteration、skill-ecosystem、new-project-bootstrap、check-modes / project-understanding / retrospective-loop。
- **9 份 assets/rules**：naming-and-structure、source-of-truth、status-and-gates、product-workflow、agent-permissions、evidence-and-confidence、quality-gates、change-management、completeness-check。
- **assets/templates**：requirement-pool（含需求卡 + P0–P3 图例）、confirmation-summary、dual-prd-skeleton、review-record、decision-log、metrics-definition、skill-integration-plan、completeness-report、ai-regression-cases。

### Changed
- `SKILL.md` 新增 §6 Check Modes（六模式路由）与 3 条反模式（理解摘要/报告不得替代事实来源、不得在 PRD/Agent spec 内编辑 status、复盘不得未经决策+回归直接改规则）；原 §6–§9 顺移为 §7–§10。
- `init-product-project.sh` full 模式现在拷贝 `completeness-check.md` 到 `00-rules/`，`ai-regression-cases.md` 与 completeness-report 模板到 `03-planning/`。
- 双 PRD 规则统一为“单一结构化需求源 + 人工视图 + Agent 视图”；Agent 视图中的 `status` 定位为 derived view（只读展示，唯一维护源为 requirement pool）。
- 反模式由 5 条扩展到 16 条。

### Fixed
- 状态机冲突：`reviewing` 不是状态，仅是闸门动作。修正 3 处引用——`assets/rules/status-and-gates.md`、`assets/rules/change-management.md`、`references/status-machine.md`，统一为“重大变更回 `analyzing`，仅复审回 `defined`”，状态机保持 6 态（candidate → analyzing → defined → approved → released → closed）。
- `dual-prd-skeleton.md` 中 Agent spec 的 `status` 字段定位为 derived view，消除与 source-of-truth 规则的矛盾。
- 修复断链引用：`assets/templates/dual-prd-skeleton.md` 原在 SKILL.md 中被引用但不存在，现已补齐。

---

## [1.0.0] - 2026-09-18

### Added
- 项目初始化脚手架 `scripts/init-product-project.sh`。
- 10 顶层目录结构（00–07、90、99）。
- 4 份核心规则文件（naming-and-structure、source-of-truth、status-and-gates、product-workflow）。
- 需求状态机（candidate → analyzing → defined → approved → released → closed）。
- 5 篇 references（directory-structure、status-machine、dual-prd-spec、decision-checklist、health-check）。
- 阶段闸道协议（Agent 确认摘要 → 人工确认 → 写入永久文件）。
- 三大核心心法（充分背景 / 约束与减法 / 慢下来）。
