# AI Product Workflow（產品經理 + AI Agent 協作手冊）

> 本專案為產品經理提供一套完整的 AI 協作工作流程，讓 AI Agent 不再只是一次性工具，而是能從需求研究、原型設計、雙版 PRD 撰寫、評審、開發同步到測試與營運回饋，全程參與的長期協作夥伴。

## 適用時機

- 初始化供 AI 協作的產品專案
- 讓 Agent 從需求到上線全程參與
- 建立長期可維護的產品上下文

## 核心原則（三大心法）

1. **充分背景（Sufficient Context）**：當結果錯誤時，首先檢查缺少的背景資訊，而非 blame 模型。
2. **約束與減法（Constraint and Subtraction）**：產品經理必須刻意刪減那些不具備複雜度合理性的內容。
3. **慢下來（Slow Down First）**：生成成本趨近於零；思考成本不可為零。先釐清意圖，再加速生成。

## 流程概覽

```
初始化專案空間
  → 市場分析
  → 需求研究
  → 需求分析（AI 加法 — PM 做減法）
  → 原型設計（含設計約束）
  → 雙版 PRD（人可讀 + Agent 可讀）
  → 評審（記錄決策與背景）
  → 開發同步
  → 測試與驗收
  → 營運回饋 → 下一週期
```

每階段結束時執行**階段閘道協議**：Agent 提供簡短確認摘要 → 等待明確的人為確認 → 僅在確認後寫入永久檔案 → 絕不默默覆寫來源真實檔案。

## 專案初始化腳手架

```bash
bash scripts/init-product-project.sh [project-root]
```

目錄結構（編號確保自然排序）：

```
00-rules/                 # 規則與範本
01-inputs/                # 原始輸入
02-product/               # 穩定產品事實
03-planning/              # 跨需求規劃
04-requirement-pool/      # 需求池
05-requirements/          # 個別需求包
06-versions/              # 版本管理
07-reviews/               # 評審與回顧
90-assets/                # 共享資產
99-archive/               # 已關閉材料
```

## 核心規則檔案（00-rules/）

- `naming-and-structure.md` — 目錄職責與命名規範
- `source-of-truth.md` — 單一真實來源原則
- `status-and-gates.md` — 狀態流與閘道規則
- `product-workflow.md` — 整體流程紀律

## 參考指南（references/）

- `directory-structure.md` — 完整目錄職責與命名規範
- `status-machine.md` — 狀態流與閘道
- `dual-prd-spec.md` — 雙版 PRD 規格（人可讀 + Agent 可讀）
- `decision-checklist.md` — 減法問題與決策標準
- `health-check.md` — 健康檢查清單

## 人機分工

| 責任範疇 | 負責方 |
|---|---|
| 取得未書寫資訊（客戶訪談、主管意圖、工程限制、優先順序） | 產品經理 |
| 處理已表達資訊、擴充細節、產出草稿 | Agent |
| 決定什麼值得做、為什麼值得做 | 產品經理 |
| 對最終決策與結果負責 | 產品經理 |

## 反模式（應避免）

- 將 Agent 輸出當作事實，未經來源驗證
- 讓 Agent 擴充需求，但未經人為減法
- 在會議中更改決策，但從未將背景寫回專案
- 在提供設計約束前就產出 PRD 或原型
- 將 Agent 當作純粹的信使

---

本手冊為自包含、可重複使用的技能說明。所有原始作者署名與外部來源引用已移除，以形成全新的說明手冊與技能文件。
