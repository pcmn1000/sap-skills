# sap-skills

GitHub Copilot / Claude / VS Code Agent 用のカスタム Skill コレクションです。

## 含まれる Skill

| Skill | 用途 |
|-------|------|
| [sap-docs-search](skills/sap-docs-search/SKILL.md) | SAP Help Portal / SAP Notes / SAP Community を横断検索し、コンサル業務での回答を支援 |

## インストール方法

### エージェントにインストールを依頼する例

GitHub Copilot / Claude Code がターミナル実行とファイル操作を許可されている環境では、次のように依頼できます。

```text
https://github.com/pcmn1000/sap-skills をインストールして、この環境でSkillを使えるようにしてください。
```

エージェントはリポジトリをcloneし、GitHub Copilotなら `.copilot/skills`、Claude Codeなら `.claude/skills` に `skills/*` をコピーします。インストール後、クライアントを再起動すると `/sap-docs-search` などが使えるようになります。

### ワークスペース単位で使う

リポジトリをクローンし、対象ワークスペースの `.github/skills/` 配下に該当 Skill フォルダをコピーします。

```powershell
git clone https://github.com/pcmn1000/sap-skills.git
Copy-Item -Recurse sap-skills\skills\sap-docs-search .github\skills\
```

### ユーザープロファイル全体で使う（VS Code）

`%USERPROFILE%\.copilot\skills\` または `%USERPROFILE%\.agents\skills\` に Skill フォルダをコピーします。

Windows:

```powershell
git clone https://github.com/pcmn1000/sap-skills.git
cd sap-skills
.\scripts\install-copilot.ps1
```

macOS/Linux:

```bash
git clone https://github.com/pcmn1000/sap-skills.git
cd sap-skills
bash ./scripts/install-copilot.sh
```

特定の Skill だけ使う場合:

```powershell
Copy-Item -Recurse sap-skills\skills\sap-docs-search $env:USERPROFILE\.copilot\skills\
```

### Claude Code で使う

Claude Code では Skill フォルダを `%USERPROFILE%\.claude\skills\`（Windows）または `~/.claude/skills/`（macOS/Linux）配下に配置します。

Windows:

```powershell
git clone https://github.com/pcmn1000/sap-skills.git
cd sap-skills
.\scripts\install-claude.ps1
```

macOS/Linux:

```bash
git clone https://github.com/pcmn1000/sap-skills.git
cd sap-skills
bash ./scripts/install-claude.sh
```

特定の Skill だけ使う場合:

```powershell
Copy-Item -Recurse sap-skills\skills\sap-docs-search $env:USERPROFILE\.claude\skills\
```

## 使い方

VS Code Copilot Chat / Claude Code などの対応クライアントで、`/` を入力すると Skill 名がスラッシュコマンドとして表示されます。または、関連するキーワード（例: 「SAP のドキュメント探して」）を含む依頼をすると、エージェントが自動的に該当 Skill をロードします。

Claude Code で認識されない場合は、Claude Code を再起動してから再度 `/` を入力してください。

## ライセンス

[MIT License](LICENSE)

## コントリビューション

Issue / Pull Request を歓迎します。新しい Skill を追加する場合は、`skills/<skill-name>/SKILL.md` の形式に従ってください。
