# Quickstart: FHIR R4.3.0 翻訳パッケージのCI/CDへの追加

## 前提条件

- GitHub Secret `R430_TRANLATE_PAT` が設定済みであること
- `jami-fhir-jp-wg/fhir430_translation` リポジトリのリリースタグ `1.0.0` にパッケージアセットが存在すること

## 実装手順

### Step 1: アセットファイル名の確認

`jami-fhir-jp-wg/fhir430_translation` リポジトリのリリース 1.0.0 ページにアクセスし、ダウンロード対象のアセットファイル名を確認する。

### Step 2: develop.yaml の編集

1. 既存の「Download the file」（downloadfile2）ステップの直後に、R4.3.0翻訳パッケージのダウンロードステップを追加
2. 「Prepare for using all dependent packages」ステップに、R4.3.0パッケージの展開ロジックを追加

### Step 3: main.yaml の編集

develop.yaml と同一の変更を適用する。

### Step 4: 動作確認

1. featureブランチにプッシュしてdevelop向けPRを作成
2. GitHub Actionsのビルドログで以下を確認:
   - R4.3.0パッケージのダウンロード成功
   - `.fhir/packages/hl7.fhir.r4.core#4.3.0/` への展開成功
   - IG Publisherビルドの正常完了

## 編集対象ファイル

| ファイル | 変更内容 |
|----------|----------|
| `.github/workflows/develop.yaml` | ダウンロードステップ追加 + 展開ロジック追加 |
| `.github/workflows/main.yaml` | 同上 |
