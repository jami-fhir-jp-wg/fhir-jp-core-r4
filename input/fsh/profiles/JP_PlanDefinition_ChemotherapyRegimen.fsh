Profile: JP_PlanDefinition_ChemotherapyRegimen
Parent: PlanDefinition
Id: jp-plandefinition-chemotherapyregimen
Title: "JP Core PlanDefinition ChemotherapyRegimen Profile"
Description: "このプロファイルはPlanDefinitionリソースに対して、化学療法レジメンの定義に関する情報を送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_PlanDefinition_ChemotherapyRegimen"
* ^status = #draft
* ^date = "2023-11-30"
* . ^short = "TBD"
* . ^definition = "TBD"
* extension contains
    JP_PlanDefinition_ChemotherapyRegimen_RegimenType named regimenType ..1
* useContext ^short = "【仮】対象疾患"
* action.extension contains
    JP_PlanDefinition_ChemotherapyRegimen_TimingDaysOfCycle named timingDaysOfCycle ..*
* action.definition[x] only Canonical(JP_ActivityDefinition_ChemotherapyRegimen_Injection or JP_ActivityDefinition_ChemotherapyRegimen_Oral)
* action.definition[x] ^short = "【仮】医薬品情報のActivityDefinitionを参照する"
* action.timing[x] only Timing
* action.timing[x] ^short = "【仮】総サイクル（n日サイクルを n回繰り返す等）"
* action.timing[x] ^comment = "
例: 14日サイクルを12回繰り返す
timingTiming : {
  repeat : {
    count : 12,
    duration : 14,
    durationUnit : d
  }
}
"

Extension: JP_PlanDefinition_ChemotherapyRegimen_RegimenType
Id: jp-plandefinition-chemotherapyregimen-regimentype
Title: "JP Core PlanDefinition ChemotherapyRegimen RegimenType Extension"
Description: "レジメン種別に関する情報を格納するためのExtension。"
* ^url = $JP_PlanDefinition_ChemotherapyRegimen_RegimenType
* ^status = #draft
* ^date = "2023-11-30"
* ^context.type = #element
* ^context.expression = "PlanDefinition"
* . ^short = "【仮】レジメン種別に関する情報"
* . ^comment = "レジメン種別に関する情報を表現する拡張"
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
* . ^short = "【仮】周期の日数に関する情報"
* . ^comment = "周期の日数に関する情報を表現する拡張"
* url = "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle" (exactly)
* value[x] only integer
