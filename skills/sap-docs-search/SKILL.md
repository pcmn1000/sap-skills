---
name: sap-docs-search
description: 'SAPコンサルタント向けに SAP Help Portal、SAP Notes、SAP Community、SAP Learning Hub の公式情報を横断検索して回答を構築するスキル。USE FOR: SAP S/4HANA / Fiori / BTP / ABAP / CAP / RAP / Joule / SuccessFactors / Ariba の仕様確認、トランザクションコード調査、SAP Note 検索、エラーメッセージ調査、設定手順の確認、移行ガイド参照、ベストプラクティス調査、ライセンス/モジュール比較。'
---

# SAP Docs Search

## 目的

SAP コンサルタントが顧客対応・設計・実装・トラブルシュートを行う際に、推測ではなく **SAP 公式情報源にグラウンディング** した回答を提供するためのスキル。SAP Joule for Consultant が行っているドキュメント参照ワークフローを、汎用 AI クライアント（VS Code Copilot / Claude など）から再現することを目的とする。

## いつ使うか

以下のキーワードや状況で起動する：

- 「SAP の〜について教えて」「Tコード〜の使い方」「SAP Note〜の内容」
- エラーメッセージ（例: `Dump SAPSQL_ARRAY_INSERT_DUPREC`、`HTTP 500 in CAP`）の調査
- S/4HANA 移行（Brownfield / Greenfield / Selective）の検討
- Fiori Elements / SAPUI5 / RAP / CAP の API 仕様確認
- BTP サービス（CPI、Build Apps、AI Core 等）の構成検討
- 認可オブジェクト・ロール設計の調査
- SAP モジュール（FI / CO / MM / SD / PP / HCM 等）のカスタマイズ手順

## 情報源の優先順位

| 優先度 | ソース | URL パターン |
|--------|--------|--------------|
| 1 | SAP Help Portal | `https://help.sap.com/docs/...` |
| 2 | SAP Notes / KBA | `https://launchpad.support.sap.com/#/notes/...`（要ログイン） |
| 3 | SAP Developer Center | `https://developers.sap.com/` |
| 4 | SAP Community Blog | `https://community.sap.com/t5/...` |
| 5 | SAP Learning | `https://learning.sap.com/` |
| 6 | SAP API Business Hub | `https://api.sap.com/` |

**重要**: SAP Note 本文はログインが必要なため、公開要約のみ参照可能。本文要求時はユーザーに「SAP for Me」ログインを促す。

## 手順

### 1. クエリ分類

ユーザーの質問を以下に分類する：

- **製品仕様** → SAP Help Portal を最優先
- **エラー / バグ** → SAP Notes 番号があればそれを最優先、なければ Community
- **開発 API** → API Business Hub + Developer Center
- **設定手順 (IMG / SPRO)** → Help Portal の Configuration Guide
- **学習 / 概念理解** → SAP Learning + Help Portal の Concepts セクション

### 2. 検索クエリ最適化

- 製品名 + バージョンを必ず含める（例: `S/4HANA 2023`、`SAPUI5 1.120`）
- モジュール略号を活用（例: `FI-AA`、`MM-PUR`、`SD-BIL`）
- 英語クエリを優先（SAP 公式ドキュメントは英語が最新で網羅的）

### 3. 取得と要約

- `fetch_webpage` ツールで公式 URL を取得
- 引用元 URL を **必ず** 回答に明記
- バージョン依存の機能は対象バージョンを明示
- 推測や創作は厳禁。ソースに記載がない場合は「公式情報未確認」と回答

### 4. 回答テンプレート

```markdown
## 回答

[要約・結論]

## 詳細

[手順・仕様の詳細]

## 出典

- [SAP Help: タイトル](URL)
- SAP Note xxxxxxx: タイトル（ログイン必要）
```

## アンチパターン

- **古い情報の混在**: ECC 6.0 と S/4HANA を区別せず回答
- **無出典回答**: 「一般的に〜です」と推測で答える
- **SAP Note 本文の捏造**: 番号だけ知っていて中身を創作する
- **バージョン省略**: 「Fiori では〜」など、リリース番号なしで断定

## 補足リソース

- [情報源リスト](./references/sources.md)
- [モジュール略号一覧](./references/modules.md)
