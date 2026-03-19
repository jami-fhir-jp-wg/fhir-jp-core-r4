# Research: FHIR R4.3.0 翻訳パッケージのCI/CDへの追加

**Date**: 2026-03-19
**Branch**: `001-add-r430-package`

## Decision 1: GitHub Release からのダウンロード方法

**Decision**: `Legion2/download-release-action@v2.1.0` を使用する

**Rationale**:
- 既にワークフロー内でIG Publisherのダウンロードに使用されている
- `token` パラメータによりプライベートリポジトリからのダウンロードをサポートしている
- `repository`, `tag`, `file`, `token` パラメータで必要な機能が揃っている

**Alternatives considered**:
- `suisei-cn/actions-download-file`: 現在パッケージダウンロードに使用されているが、`token`パラメータ非対応のためプライベートリポジトリに使用不可
- `gh release download` CLIコマンド: 動作するが、既存のアクション利用パターンと一貫性がない
- `curl` with Authorization header: 低レベルすぎる。GitHub APIのURL構造に依存する

## Decision 2: パッケージ展開先ディレクトリ

**Decision**: `/home/runner/.fhir/packages/hl7.fhir.r4.core#4.3.0/` に展開する

**Rationale**:
- 既存の用語集パッケージ（`jpfhir-terminology#1.4.0`）と同じパターン
- FHIR パッケージキャッシュの標準ディレクトリ命名規則（`{package-id}#{version}`）に準拠
- IG Publisherがこのパスでパッケージを検索する

**Alternatives considered**:
- `fhir_dotFHIR_packages.tgz` に統合: 既存パッケージの再構築が必要で複雑
- 別のキャッシュパス: IG Publisherの標準パス外では認識されない

## Decision 3: ワークフロー内のステップ配置

**Decision**: 既存の「Download the file」ステップ群の直後、「Prepare for using all dependent packages」ステップの前に配置する

**Rationale**:
- ダウンロードと展開を論理的なフェーズで分離する既存パターンに従う
- 展開ステップでR4.3.0パッケージも一緒に処理できる

**Alternatives considered**:
- 「Prepare」ステップ内でダウンロードと展開を一括処理: 可能だが既存パターンと異なる
- 完全に別の新ステップとして独立: 既存の「Prepare」ステップに展開ロジックを追加する方が一貫性がある

## Decision 4: リリースアセットのファイル名

**Decision**: リリースアセットのファイル名は実際のリリースページで確認が必要。計画では仮名 `hl7.fhir.r4.core-4.3.0.tgz` を使用する

**Rationale**:
- プライベートリポジトリのため、事前にアセット名を確認できない
- FHIR パッケージの一般的な命名規則に基づく仮名を設定
- 実装時に `Legion2/download-release-action` の `file` パラメータで正確なファイル名を指定する

**Alternatives considered**:
- ワイルドカードでダウンロード: `Legion2/download-release-action` はワイルドカード非対応
