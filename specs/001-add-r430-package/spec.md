# Feature Specification: FHIR R4.3.0 翻訳パッケージのCI/CDへの追加

**Feature Branch**: `001-add-r430-package`
**Created**: 2026-03-19
**Status**: Draft
**Input**: User description: "GitHub Actionを編集し、FHIR R4.3.0翻訳パッケージをダウンロードして.fhirフォルダに展開するステップをCI/CDワークフローに追加する"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - CI/CDビルドでR4.3.0翻訳パッケージが自動取得・展開される (Priority: P1)

開発者がdevelopブランチまたはmainブランチにプッシュ・PRを作成した際、GitHub Actionsワークフローが自動的にFHIR R4.3.0の日本語翻訳パッケージをプライベートリポジトリ（`jami-fhir-jp-wg/fhir430_translation`）のリリースタグ1.0.0からダウンロードし、ビルド環境の`.fhir/packages/`フォルダに展開する。これにより、IG Publisherが翻訳済みのR4.3.0パッケージを参照してビルドできるようになる。

**Why this priority**: R4.3.0翻訳パッケージはIG Publisherビルドに必須であり、既存の`fhir_dotFHIR_packages.tgz`にはR4.3.0が含まれていないため、この取得・展開が実現できなければビルドが不完全になる。

**Independent Test**: develop.yamlまたはmain.yamlのワークフローを手動実行し、ビルドログで(1)R4.3.0翻訳パッケージのダウンロード成功、(2)`.fhir/packages/`への展開成功、(3)IG Publisherビルドの正常完了を確認する。

**Acceptance Scenarios**:

1. **Given** develop.yamlワークフローが実行される, **When** パッケージダウンロードステップに到達する, **Then** `jami-fhir-jp-wg/fhir430_translation`リポジトリのリリース1.0.0からパッケージアセットがダウンロードされる
2. **Given** main.yamlワークフローが実行される, **When** パッケージダウンロードステップに到達する, **Then** 同様にR4.3.0翻訳パッケージがダウンロードされる
3. **Given** パッケージがダウンロードされた, **When** 展開ステップが実行される, **Then** `hl7.fhir.r4.core#4.3.0`パッケージが`.fhir/packages/`配下に正しく配置される
4. **Given** R4.3.0パッケージが展開済み, **When** IG Publisherが実行される, **Then** ビルドがR4.3.0パッケージを認識し正常完了する

---

### User Story 2 - 認証付きプライベートリポジトリからの安全なダウンロード (Priority: P1)

翻訳パッケージはプライベートリポジトリに格納されているため、GitHub Secretsに登録済みのPAT（`R430_TRANLATE_PAT`）を使用して認証付きダウンロードを行う。PATはワークフローログに露出しない。

**Why this priority**: 認証なしではプライベートリポジトリからのダウンロードが失敗するため、パッケージ取得と同等に重要。

**Independent Test**: ワークフロー実行時に認証エラーが発生せず、パッケージが正常にダウンロードされることをビルドログで確認する。

**Acceptance Scenarios**:

1. **Given** `R430_TRANLATE_PAT`シークレットが設定されている, **When** ダウンロードステップが実行される, **Then** プライベートリポジトリへの認証が成功しパッケージがダウンロードされる
2. **Given** `R430_TRANLATE_PAT`シークレットが未設定, **When** ダウンロードステップが実行される, **Then** ワークフローが明確なエラーで失敗する

---

### Edge Cases

- リリースタグ1.0.0のアセットが削除・変更された場合、ワークフローが失敗し明確なエラーメッセージが表示される
- ネットワークタイムアウトが発生した場合、GitHub Actionsの標準的なリトライ・タイムアウト処理に従う
- 既存の`fhir_dotFHIR_packages.tgz`（hl7.fhir.r4.core#4.0.1含む）と新たなR4.3.0パッケージが`.fhir/packages/`内で競合せず共存できる
- develop.yamlとmain.yamlの両方で同一のダウンロード・展開ロジックが一貫して動作する

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: develop.yamlワークフローは、`jami-fhir-jp-wg/fhir430_translation`リポジトリのリリースタグ`1.0.0`からFHIR R4.3.0翻訳パッケージをダウンロードするステップを含むこと
- **FR-002**: main.yamlワークフローは、同様のダウンロードステップを含むこと
- **FR-003**: ダウンロード時にGitHub Secret `R430_TRANLATE_PAT`を認証トークンとして使用すること
- **FR-004**: ダウンロードしたパッケージをビルド環境の`.fhir/packages/`配下の適切なディレクトリに展開すること
- **FR-005**: 既存のパッケージ準備ステップ（hl7.fhir.r4.core#4.0.1、jpfhir-terminology等）と競合せず共存できること
- **FR-006**: パッケージ展開はIG Publisher実行ステップより前に完了すること

### Key Entities

- **R4.3.0翻訳パッケージ**: `jami-fhir-jp-wg/fhir430_translation`リポジトリのリリース1.0.0に含まれるアセット。`hl7.fhir.r4.core#4.3.0`の日本語翻訳版パッケージ
- **`.fhir/packages/`ディレクトリ**: IG Publisherが参照するFHIRパッケージキャッシュ
- **R430_TRANLATE_PAT**: プライベートリポジトリアクセス用のPersonal Access Token（GitHub Secretsに登録済み）
- **develop.yaml / main.yaml**: 編集対象のGitHub Actionsワークフロー定義ファイル

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: develop.yamlとmain.yamlの両ワークフローが、R4.3.0翻訳パッケージのダウンロード・展開を含めて正常に完了する
- **SC-002**: IG Publisherのビルドログで`hl7.fhir.r4.core#4.3.0`パッケージが認識・使用されていることが確認できる
- **SC-003**: 既存のビルドプロセス（R4.0.1パッケージ、用語集パッケージのダウンロード・展開・IG Publisherビルド）に影響を与えない
- **SC-004**: 両ワークフローのダウンロード・展開ステップが一貫した手順で実装されている

## Assumptions

- リリースタグ`1.0.0`のアセットはtgz形式であり、標準的なFHIRパッケージ構造（`package/`ディレクトリ含む）を持つ
- `R430_TRANLATE_PAT`シークレットは両ワークフローの実行環境で利用可能である
- パッケージの展開先ディレクトリ名は`hl7.fhir.r4.core#4.3.0`である
- develop.yamlとmain.yamlの両方に同等の変更を適用する
