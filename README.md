# AI Product Workflow

> **产品经理 + AI Agent：项目理解、检查、推进与迭代的完整框架**
>
> 让 AI Agent 不仅是工作流执行者，更能作为一把可复用的“产品检查标尺”：读懂任意项目、检查其完整性与一致性、判断阶段门槛、追踪变更影响、并在复盘中反哺体系本身。

**版本：** v1.2.0
**状态：** 正式发布（stable）
**许可：** MIT（见 `LICENSE`）

---

## 简介

v1.2.0 将完整工作流与可执行检查层合并为一个版本，包含两大块能力：

### 1. 产品工作流（核心）
面向产品经理 + AI Agent 的标准化端到端工作流：项目初始化 → 产品目标与指标 → 市场与用户研究 → 需求分析与优先级 → 技术可行性 → 原型与交互设计 → 分级 PRD（小 / 普通 / 复杂三级）→ 评审与决策记录 → 开发同步 → 测试验收 → 发布与运营反馈 → 复盘迭代。配套能力：Agent 权限分级（L0–L4）、AI 输出质量门、变更管理规则、AI 产品专项规则（AI 能力 / Agent / 计费）、多 Agent 协作模式、版本迭代原则、在线 Skill 生态映射（仅参考，不安装）、新品项目 14 天 Bootstrap 清单。

### 2. 产品检查层（可执行检查引擎）
在原有工作流、规则、模板之上，补齐“可执行检查”：完整性矩阵（PC-* 检查项，13 类）、跨文档一致性检查（5 条不变量）、统一证据判定（VERIFIED / ASSUMED / INFERRED / UNVERIFIED）、Stage Gate 机器可判定规则、检查报告与回归集。对应 6 个检查模式（Understand / Advance / Completeness / Consistency / Change Impact / Retrospective），路由见 `references/check-modes.md`。

### 六个检查模式

| 模式 | 核心问题 |
|------|----------|
| Project Understanding | 这个项目是什么？ |
| Product Workflow | 这个项目应该怎么推进？ |
| Product Completeness | 这个项目/需求完整吗？ |
| Product Consistency | 项目内部有没有冲突？ |
| Product Change Impact | 修改一个地方会影响什么？ |
| Product Retrospective | 做完以后如何反哺体系？ |

形成“双向闭环”：检查输出 → 决策/变更 → 开发/测试/发布 → 实际结果 → 复盘 → 规则优化 → 下一轮检查更精确。

核心理念：维护持久、准确的项目上下文，使 Agent 能从市场分析一路工作到发布与反馈，无需反复重新解释；同时每一轮检查都能让体系本身变得更准。

## 目录

- `SKILL.md` — 技能主文档（Agent 可读取的工作流总纲）
- `scripts/init-product-project.sh` — 一键脚手架（支持 `--minimal` 与完整两种模式）
- `references/` — 各阶段深度参考指南（14 篇，含 check-modes / project-understanding / retrospective-loop）
- `assets/rules/` — 可复制的核心规则模板（9 份，含 completeness-check）
- `assets/templates/` — 需求池 / 确认摘要 / 分级 PRD 骨架 / 评审记录 / 决策日志 / 指标定义 / 完整性报告 / AI 回归用例等模板

## 快速开始

```bash
# 完整初始化（默认，v1.2 目录集 + 9 规则文件 + 完整性检查层）
bash scripts/init-product-project.sh [project-root]

# 精简初始化（00-rules/ 01-inputs/ 02-product/ 05-requirements/ + 4 核心规则）
bash scripts/init-product-project.sh --minimal [project-root]
```

初始化后：

1. 将现有产品材料放入 `01-inputs/` 并登记到 `source-register.md`。
2. 将稳定产品事实填入 `02-product/`。
3. 审阅并适配 `00-rules/` 中的核心规则文件。
4. 开始在需求池中登记候选需求。

## 五大核心原则

1. **充分背景** — 结果出错先查缺失背景，而非归咎模型。
2. **约束与减法** — AI 天然扩张，产品经理负责删减不具复杂度合理性的内容。
3. **慢下来** — 生成成本趋近于零，思考成本不可为零。
4. **单一事实来源** — 每类产品信息只维护一个正式来源，其他文件仅引用。
5. **未确认不成为正式事实** — 草稿可自动记录，但必须区分"记录"与"确认"。

## 版本历史

见 `CHANGELOG.md`。

## 许可

MIT License。见 `LICENSE`。
