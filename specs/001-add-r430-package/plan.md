# Implementation Plan: FHIR R4.3.0 翻訳パッケージのCI/CDへの追加

**Branch**: `001-add-r430-package` | **Date**: 2026-03-19 | **Spec**: [spec.md](spec.md)
**Input**: Feature specification from `/specs/001-add-r430-package/spec.md`

## Summary

GitHub Actions ワークフロー（develop.yaml, main.yaml）を編集し、プライベートリポジトリ `jami-fhir-jp-wg/fhir430_translation` のリリース1.0.0からFHIR R4.3.0翻訳パッケージをダウンロードして `.fhir/packages/` に展開するステップを追加する。既存の `Legion2/download-release-action` を `token` パラメータ付きで再利用し、既存パッケージ展開パターンに合わせて統合する。

## Technical Context

**Language/Version**: YAML (GitHub Actions workflow syntax)
**Primary Dependencies**: `Legion2/download-release-action@v2.1.0` (既存使用済み)
**Storage**: N/A
**Testing**: GitHub Actions ワークフロー実行による検証
**Target Platform**: GitHub Actions (ubuntu-latest)
**Project Type**: CI/CD configuration
**Performance Goals**: N/A (CI/CD ステップ追加のみ)
**Constraints**: プライベートリポジトリアクセスに PAT（`R430_TRANLATE_PAT`）が必要
**Scale/Scope**: 2ファイル（develop.yaml, main.yaml）の編集

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

| Gate | Status | Notes |
|------|--------|-------|
| FHIR標準準拠 | N/A | CI/CD設定変更のため直接適用外 |
| Must Support方針 | N/A | プロファイル変更なし |
| 命名規約 | PASS | パッケージディレクトリ名 `hl7.fhir.r4.core#4.3.0` はFHIR標準命名に準拠 |
| FSH記述規則 | N/A | FSHファイル変更なし |
| リソース組織化 | N/A | リソースファイル変更なし |
| 日本語化基準 | PASS | ステップ名は日本語・英語混在（既存パターンに合わせる） |
| アーキテクチャ設計原則 | PASS | CI/CDパイプラインの自動化原則に合致。依存関係管理パターンに準拠 |
| Git運用規約 | PASS | featureブランチから develop への PR ワークフローに従う |

**Result**: 全ゲート PASS/N/A。違反なし。

## Project Structure

### Documentation (this feature)

```text
specs/001-add-r430-package/
├── plan.md              # This file
├── research.md          # Phase 0 output
├── quickstart.md        # Phase 1 output
└── tasks.md             # Phase 2 output (/speckit.tasks command)
```

### Source Code (repository root)

```text
.github/workflows/
├── develop.yaml         # 編集対象: R4.3.0パッケージダウンロード・展開ステップ追加
└── main.yaml            # 編集対象: 同上
```

**Structure Decision**: 既存のGitHub Actionsワークフローファイル2つのみを編集する。新規ファイル作成不要。data-model.md および contracts/ はCI/CD設定変更のため不要。

## Implementation Design

### 変更概要

両ワークフローに以下の変更を加える:

#### 1. R4.3.0翻訳パッケージのダウンロードステップ追加

既存の「Download the file」（downloadfile2）ステップの直後に新ステップを追加:

```yaml
- name: Download R4.3.0 Translation Package
  uses: Legion2/download-release-action@v2.1.0
  with:
    repository: jami-fhir-jp-wg/fhir430_translation
    tag: '1.0.0'
    path: .
    file: <アセットファイル名>  # 実装時に確認必要
    token: ${{ secrets.R430_TRANLATE_PAT }}
```

#### 2. パッケージ展開ステップの修正

既存の「Prepare for using all dependent packages」ステップに、R4.3.0パッケージの展開ロジックを追加:

```bash
# R4.3.0翻訳パッケージの展開
mkdir -p /home/runner/.fhir/packages/hl7.fhir.r4.core#4.3.0
mv <アセットファイル名> /home/runner/.fhir/work/
cd /home/runner/.fhir/work
tar xzf <アセットファイル名>
mv /home/runner/.fhir/work/package/* /home/runner/.fhir/packages/hl7.fhir.r4.core#4.3.0/
```

### 注意事項

- アセットファイル名はリリースページで確認が必要（仮名: `hl7.fhir.r4.core-4.3.0.tgz`）
- develop.yaml と main.yaml の両方に同一の変更を適用する
- 既存ステップの環境変数セクションにR4.3.0用の変数を追加する

## Complexity Tracking

> 違反なし。このセクションは不要。
