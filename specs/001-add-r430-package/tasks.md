# Tasks: FHIR R4.3.0 翻訳パッケージのCI/CDへの追加

**Input**: Design documents from `/specs/001-add-r430-package/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md

**Tests**: Not requested in specification. No test tasks included.

**Organization**: Tasks are grouped by user story. US1 and US2 are both P1 and tightly coupled (authentication is integral to the download), so they are combined in a single phase.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2)
- Include exact file paths in descriptions

## Path Conventions

- **CI/CD config**: `.github/workflows/` at repository root

---

## Phase 1: Setup

**Purpose**: Confirm prerequisites before making changes

- [x] T001 Confirm asset filename by checking release at `jami-fhir-jp-wg/fhir430_translation` tag 1.0.0
- [x] T002 Confirm `R430_TRANLATE_PAT` secret is available in the repository's `SSH_PORT_JPFHIR` environment

**Checkpoint**: Asset filename known, secret availability confirmed

---

## Phase 2: User Story 1+2 - R4.3.0翻訳パッケージの自動取得・展開と認証 (Priority: P1)

**Goal**: develop.yaml と main.yaml に、PAT認証付きでR4.3.0翻訳パッケージをダウンロードし `.fhir/packages/` に展開するステップを追加する

**Independent Test**: ワークフローを実行し、ビルドログでR4.3.0パッケージのダウンロード成功・展開成功・IG Publisherビルド正常完了を確認する

### Implementation

- [x] T003 [P] [US1] Add R4.3.0 translation package download step using `Legion2/download-release-action@v2.1.0` with `token: ${{ secrets.R430_TRANLATE_PAT }}` in `.github/workflows/develop.yaml` (insert after downloadfile2 step, before "Prepare" step)
- [x] T004 [P] [US1] Add R4.3.0 translation package download step using `Legion2/download-release-action@v2.1.0` with `token: ${{ secrets.R430_TRANLATE_PAT }}` in `.github/workflows/main.yaml` (insert after downloadfile2 step, before "Prepare" step)
- [x] T005 [US1] Add R4.3.0 package extraction logic to "Prepare for using all dependent packages" step in `.github/workflows/develop.yaml` (add env var for R4.3.0 tgz filename, extract to `/home/runner/.fhir/packages/hl7.fhir.r4.core#4.3.0/`)
- [x] T006 [US1] Add R4.3.0 package extraction logic to "Prepare for using all dependent packages" step in `.github/workflows/main.yaml` (same extraction logic as develop.yaml)

**Checkpoint**: Both workflow files updated with download and extraction steps

---

## Phase 3: Polish & Cross-Cutting Concerns

**Purpose**: Verify consistency between both workflow files

- [x] T007 Verify develop.yaml and main.yaml have identical R4.3.0 download and extraction logic (compare added sections)
- [x] T008 Run quickstart.md validation - confirm all steps documented in `specs/001-add-r430-package/quickstart.md` are addressed

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - must complete first to determine asset filename
- **User Story 1+2 (Phase 2)**: Depends on Phase 1 (asset filename needed for `file:` parameter)
- **Polish (Phase 3)**: Depends on Phase 2 completion

### Within Phase 2

- T003 and T004 can run in **parallel** (different files)
- T005 depends on T003 (same file, develop.yaml)
- T006 depends on T004 (same file, main.yaml)
- T005 and T006 can run in **parallel** (different files)

### Parallel Opportunities

```
Phase 2 parallel execution:

Stream A (develop.yaml):        Stream B (main.yaml):
  T003 → T005                     T004 → T006
```

---

## Implementation Strategy

### MVP First

1. Complete Phase 1: Confirm asset filename
2. Complete Phase 2: Edit both workflow files
3. **STOP and VALIDATE**: Push to branch, create PR to develop, verify GitHub Actions build
4. Complete Phase 3: Final verification

### Single Developer Flow

1. T001 → T002 (confirm prerequisites)
2. T003 → T005 (develop.yaml complete)
3. T004 → T006 (main.yaml complete)
4. T007 → T008 (verification)

---

## Notes

- T003/T004 are marked [P] because they edit different files
- Asset filename in T003-T006 must be replaced with actual filename confirmed in T001
- Both files must have identical R4.3.0 logic to satisfy SC-004 (consistency requirement)
- Existing download/extraction steps must not be modified (SC-003 - no impact on existing process)
