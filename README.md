# AI Product Workflow

> **产品经理 + AI Agent：项目理解、检查、推进与迭代的完整框架**
>
> AI Product Workflow 是一套面向产品项目的标准化工作框架。
> 它以项目实际材料、产品文档和执行结果为输入，通过统一的 Rules、References、Templates 和 Check Cases，对项目进行**理解、推进、完整性检查、一致性检查、变更影响分析和复盘迭代**。
>
> 它不仅用于“生成产品文档”，更是一把可以反复复用的 **AI 产品检查标尺**。

**版本：** v1.2.0
**状态：** Stable
**许可：** MIT

---

## 核心定位

AI Product Workflow 不替代具体项目的产品方案，而是提供一套统一的**工作标准和检查标准**。

可以理解为：

```text
项目材料
需求 / PRD / 原型 / 技术方案 / 测试 / 发布记录 / 用户反馈
                         ↓
                AI Product Workflow
                         ↓
              对照 Rules / References
                         ↓
        ┌────────────────────────────────┐
        │ 理解项目                        │
        │ 推进产品工作流                  │
        │ 检查完整性                      │
        │ 检查文档一致性                  │
        │ 分析变更影响                    │
        │ 复盘实际结果                    │
        └────────────────────────────────┘
                         ↓
                 输出问题 / 决策 / 行动
                         ↓
                 开发 / 测试 / 发布
                         ↓
                  实际结果 / 反馈
                         ↓
                    复盘与迭代
```

**项目材料提供实际内容，Workflow 提供判断标准，AI 负责对照、分析和推进。**

---

## 六种工作模式

整个系统保持 **一个 Skill**，内部通过六种模式覆盖不同任务，不拆分成多个独立 Skill。

| Mode              | 核心问题      | 主要作用                                     |
| ----------------- | --------- | ---------------------------------------- |
| **Understand**    | 这个项目是什么？  | 读取项目上下文，提炼产品定位、用户、场景、业务和技术模式             |
| **Advance**       | 下一步应该做什么？ | 按产品工作流和 Stage Gate 推进当前项目                |
| **Completeness**  | 缺什么？      | 检查产品、UX、数据、技术、AI、计费、测试、发布等内容是否完整         |
| **Consistency**   | 哪里冲突？     | 检查 PRD、技术方案、原型、测试、版本和决策之间是否存在矛盾          |
| **Change Impact** | 改动会影响什么？  | 分析需求变更对产品、技术、数据、测试、版本和运营的影响              |
| **Retrospective** | 结果如何反哺？   | 根据实际数据和反馈复盘，并通过 Change Management 控制规则演进 |

其中 **Understand 是入口动作**，用于建立可靠的项目上下文；其他模式在此基础上执行。

---

## 工作方式

### 1. 读取项目实际材料

AI 优先使用项目已有材料作为事实来源：

* 产品方案
* PRD
* 原型与交互
* 用户研究
* 会议记录
* 技术方案
* API / 数据结构
* 测试用例与结果
* 发布记录
* 数据指标
* 用户反馈
* 历史决策

不会脱离项目上下文凭空生成结论。

### 2. 对照标准执行

AI 根据仓库中的：

* `SKILL.md`
* `assets/rules/`
* `references/`
* `assets/templates/`
* Check Cases
* Regression Cases

判断当前项目处于什么阶段、已经完成什么、还缺什么，以及下一步需要做什么。

### 3. 区分事实与推断

项目理解和检查结果必须区分证据等级：

* **VERIFIED** — 已有可靠证据确认
* **ASSUMED** — 当前作为假设使用
* **INFERRED** — AI 根据已有信息推导
* **UNVERIFIED** — 尚未验证

AI 推断不能自动成为正式产品事实。

### 4. 输出检查结果

检查结果统一使用：

* **PASS** — 已满足
* **FAIL** — 存在明确问题或冲突
* **UNKNOWN** — 缺少足够信息，无法确认
* **N/A** — 明确不适用

其中：

> **Completeness 重点发现 UNKNOWN，Consistency 重点发现 FAIL。**

---

## 产品工作流

标准生命周期：

```text
项目初始化
   ↓
产品目标与指标
   ↓
市场与用户研究
   ↓
需求分析与优先级
   ↓
技术可行性
   ↓
原型与交互
   ↓
PRD / Agent Spec
   ↓
评审与决策
   ↓
开发同步
   ↓
测试与验收
   ↓
发布验证
   ↓
数据与用户反馈
   ↓
复盘
   ↓
下一轮迭代
```

单个需求通过状态机进行管理：

```text
candidate
   ↓
analyzing
   ↓
defined
   ↓
approved
   ↓
released
   ↓
closed
```

每个阶段都有相应的进入条件和质量门槛。

---

## 检查范围

完整性检查覆盖产品项目的主要维度：

```text
Product
User / UX
Data
Technical
AI
Agent
Billing
Security / Privacy / Compliance
Testing
Release
Metrics / Analytics
Consistency
Stage Gates
```

检查不仅针对单个需求，也可以用于：

* 单个功能
* 一个版本
* 一个产品模块
* 一个完整产品
* 一个已有项目
* 一组历史产品材料

因此，即使一个项目没有按照本框架建立文档，也可以将现有材料作为输入进行**反向检查**。

---

## 单个需求闭环

一个最小需求可以独立完成：

```text
Raw Input
   ↓
Requirement Pool
   ↓
Analysis
   ↓
Definition
   ↓
Human Review
   ↓
Approval
   ↓
Development
   ↓
Acceptance
   ↓
Release Verification
   ↓
Feedback
   ↓
Retrospective
```

因此，Workflow 既可以：

> **正向指导一个需求如何完成**

也可以：

> **反向检查一个已经存在的需求是否完整。**

---

## 项目级反向检查

对于已有项目，可以直接将项目材料作为输入：

```text
已有项目材料
      ↓
Understand
      ↓
建立项目理解摘要
      ↓
Completeness
      ↓
Consistency
      ↓
Change Impact
      ↓
形成项目检查结果
```

AI 可以进一步提炼：

* 产品定位
* 目标用户
* 核心问题
* 核心场景
* 产品模式
* 商业模式
* 核心业务流程
* 技术模式
* AI / Agent 模式
* 当前项目阶段
* 已完成内容
* 缺失内容
* 文档冲突
* 潜在影响
* 待确认事项

因此，该框架也可以作为**陌生项目的快速理解与产品体检工具**。

---

## 复盘与体系演进

复盘不仅用于项目本身，也可以用于改进 Workflow。

```text
实际结果
   ↓
Retrospective
   ↓
发现重复问题
   ↓
提出 Rules / References 修改建议
   ↓
Change Management
   ↓
Human Confirmation
   ↓
更新正式基线
   ↓
Regression Set
   ↓
验证
   ↓
下一轮使用
```

任何对正式 Rules、References 或工作流基线的修改，都必须经过变更管理和回归验证，避免 AI 在没有确认的情况下改变整个工作体系。

---

## 核心原则

### 1. 充分背景

结果出错时优先检查上下文是否缺失，而不是直接归因于模型。

### 2. 约束与减法

AI 负责扩展可能性，产品经理负责收敛范围、做取舍。

### 3. 慢下来

生成成本趋近于零，但产品决策和验证成本不能被忽略。

### 4. 单一事实来源

同一类产品信息只维护一个正式来源，其他文件仅作为引用或派生视图。

### 5. 未确认不成为正式事实

AI 可以产生草稿和推断，但未经确认的信息不能自动成为正式产品事实。

---

## Repository Structure

```text
AI-Product-Workflow/
│
├── SKILL.md
│
├── assets/
│   ├── rules/
│   └── templates/
│
├── references/
│
├── scripts/
│
├── CHANGELOG.md
└── README.md
```

### `SKILL.md`

AI Agent 的统一入口，定义工作方式、六种 Mode、路由和核心行为。

### `assets/rules/`

核心规则和检查规则的维护位置。

### `references/`

各阶段、检查模式和专项能力的详细执行规范。

### `assets/templates/`

需求池、PRD、评审、检查报告、回归用例等标准模板。

### `scripts/`

项目初始化与基础目录生成工具。

---

## Quick Start

### 初始化项目

```bash
# 完整初始化
bash scripts/init-product-project.sh [project-root]

# 精简初始化
bash scripts/init-product-project.sh --minimal [project-root]
```

### 已有项目

不需要重建项目。

可以直接将已有：

```text
PRD
产品方案
原型
技术方案
测试资料
发布记录
会议记录
用户反馈
```

作为项目上下文输入，然后从：

```text
Understand
```

开始建立项目理解，再根据目标进入：

```text
Advance
Completeness
Consistency
Change Impact
Retrospective
```

---

## 定位

AI Product Workflow 的目标不是提供一套固定的产品答案，而是提供一套**可以持续复用和持续优化的产品判断标准**。

最终形成：

```text
理解项目
   ↓
对照标准
   ↓
发现问题
   ↓
推进决策
   ↓
执行验证
   ↓
获得真实结果
   ↓
复盘
   ↓
优化标准
   ↓
再次检查
```

> **项目不断变化，产品标准持续沉淀，AI 的检查能力随之提升。**

---

## License

MIT License。见 `LICENSE`。
