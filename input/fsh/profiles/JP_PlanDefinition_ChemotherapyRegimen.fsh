Profile: JP_PlanDefinition_ChemotherapyRegimen
Parent: PlanDefinition
Id: jp-plandefinition-chemotherapyregimen
Title: "JP Core PlanDefinition ChemotherapyRegimen Profile"
Description: "このプロファイルはPlanDefinitionリソースに対して、化学療法レジメンの定義に関する情報を送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_PlanDefinition_ChemotherapyRegimen"
* ^status = #draft
* ^date = "2023-11-30"
* . ^short = "化学療法レジメンの定義情報"
* . ^definition = "化学療法における抗がん剤（注射薬、内服薬）、分子標的薬、免疫チェックポイント阻害薬、輸液、支持療法（制吐剤など）の組み合わせと、投与スケジュール、治療期間などを示した計画の情報"
* extension contains
    JP_PlanDefinition_ChemotherapyRegimen_RegimenType named regimenType ..1
* contained 1..*
* contained only JP_ActivityDefinition_ChemotherapyRegimen_Injection or JP_ActivityDefinition_ChemotherapyRegimen_Oral
* name 0..0
* title 0..0
* subtitle 0..0
* type
  * ^short = "プラン定義種別（固定値: clinical-protocol）"
  * id 0..0
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/plan-definition-type"
    * code = #clinical-protocol
    * display = "Clinical Protocol"
    * id 0..0
    * version 0..0
    * userSelected 0..0
// * status
* experimental 0..0
* subject[x] 0..0
* date 
  * ^short = "最終変更日"
* publisher
  * ^short = "発行元施設名"
* contact 0..0
* description 0..0
* useContext ^short = "適応疾患（がんの種類）"
* jurisdiction 0..0
* purpose 0..0
* usage 0..0
* copyright 0..0
* approvalDate
  * ^short = "承認日"
* lastReviewDate 0..0
* effectivePeriod
  * ^short = "有効期間"
* topic 0..0
* author
  * ^short = "作成者"
* editor
  * ^short = "編集者"
* reviewer 0..0
* endorser 0..0
* relatedArtifact
  * ^short = "参考文献"
* library 0..0
* goal 0..0

* action
  * extension contains
    JP_PlanDefinition_ChemotherapyRegimen_TimingDaysOfCycle named timingDaysOfCycle ..*
  * prefix 0..0
  * title 0..0
  * description 0..0
  // * textEquivalent
  * priority 0..0
  * code 0..0
  * reason 0..0
  * documentation 0..0
  * goalId 0..0
  * subject[x] 0..0
  * trigger 0..0
  * condition 0..0
  * input 0..0
  * output 0..0
  // * relatedAction
  * timing[x] only Timing
    * ^short = "総サイクル（n日サイクルを n回繰り返す等）"
  * participant 0..0
  * type 0..0
  // * groupingBehavior
  // * selectionBehavior
  // * requiredBehavior
  // * precheckBehavior
  // * cardinalityBehavior
  * definition[x] only Canonical(JP_ActivityDefinition_ChemotherapyRegimen_Injection or JP_ActivityDefinition_ChemotherapyRegimen_Oral)
    * ^short = "医薬品情報のActivityDefinitionを参照する"
  * transform 0..0
  // * dynamicValue

Extension: JP_PlanDefinition_ChemotherapyRegimen_RegimenType
Id: jp-plandefinition-chemotherapyregimen-regimentype
Title: "JP Core PlanDefinition ChemotherapyRegimen RegimenType Extension"
Description: "レジメン種別に関する情報を格納するためのExtension。"
* ^url = $JP_PlanDefinition_ChemotherapyRegimen_RegimenType
* ^status = #draft
* ^date = "2023-11-30"
* ^context.type = #element
* ^context.expression = "PlanDefinition"
* . ^short = "レジメン種別"
* . ^comment = "レジメン種別（e.g.,FOLFOX,FOLFIRI）に関する情報を表現する拡張"
* url = $JP_PlanDefinition_ChemotherapyRegimen_RegimenType (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept from $JP_ChemotherapyRegimen_RegimenType_VS (example)

Extension: JP_PlanDefinition_ChemotherapyRegimen_TimingDaysOfCycle
Id: jp-plandefinition-chemotherapyregimen-timingdaysofcycle
Title: "JP Core PlanDefinition ChemotherapyRegimen TimingDaysOfCycle Extension"
Description: "周期の日数に関する情報を格納するためのExtension。"
* ^url = "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle"
* ^status = #draft
* ^date = "2023-11-30"
* ^context.type = #element
* ^context.expression = "PlanDefinition.action"
* . ^short = "周期の日数"
* . ^comment = "周期の日数に関する情報を表現する拡張"
* url = "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle" (exactly)
* value[x] only integer
