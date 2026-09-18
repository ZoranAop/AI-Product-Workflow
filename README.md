# AI Product Workflow

> **产品经理 + AI Agent：从市场分析到产品发布与反馈闭环的端到端协作规范**
>
> 让 AI Agent 不再是单次工具，而是能全程参与的长期协作伙伴。

**版本：** v1.1.0
**状态：** 正式发布（stable）
**许可：** MIT（见 `LICENSE`）

---

## 简介

本项目提供一套面向产品经理 + AI Agent 的标准化工作流，覆盖：

项目初始化 → 产品目标与指标 → 市场与用户研究 → 需求分析与优先级 → 技术可行性 → 原型与交互设计 → 分级 PRD → 评审与决策记录 → 开发同步 → 测试验收 → 发布与运营反馈 → 复盘迭代。

核心理念：维护持久、准确的项目上下文，使 Agent 能从市场分析一路工作到发布与反馈，无需反复重新解释。

## 目录

- `SKILL.md` — 技能主文档（Agent 可读取的工作流总纲）
- `scripts/init-product-project.sh` — 一键脚手架（支持 `--minimal` 与完整两种模式）
- `references/` — 各阶段深度参考指南（11 篇）
- `assets/rules/` — 可复制的核心规则模板（8 份）
- `assets/templates/` — 需求池 / 确认摘要 / 分级 PRD 骨架 / 评审记录 / 决策日志 / 指标定义等模板

## 快速开始

```bash
# 完整初始化（默认，v1.1 目录集 + 8 规则文件）
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
