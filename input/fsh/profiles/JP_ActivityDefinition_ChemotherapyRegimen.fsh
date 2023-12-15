Profile: JP_ActivityDefinition_ChemotherapyRegimen_Injection
Parent: ActivityDefinition
Id: jp-activitydefinition-chemotherapyregimen-injection
Title: "JP Core ActivityDefinition ChemotherapyRegimen Injection Profile"
Description: "このプロファイルはActivityDefinitionリソースに対して、化学療法レジメンの定義に関する情報を送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ActivityDefinition_ChemotherapyRegimen_Injection"
* ^status = #draft
* ^date = "2023-11-30"
* . ^short = "TBD"
* . ^definition = "TBD"
* product[x] only Reference(Medication)
* productReference only Reference(JP_Medication)
* productReference ^short = "医薬品"
* dosage only JP_MedicationDosage_Injection
* dosage ^short = "医薬品の服用方法等"

Profile: JP_ActivityDefinition_ChemotherapyRegimen_Oral
Parent: ActivityDefinition
Id: jp-activitydefinition-chemotherapyregimen-oral
Title: "JP Core ActivityDefinition ChemotherapyRegimen Oral Profile"
Description: "このプロファイルはActivityDefinitionリソースに対して、化学療法レジメンの定義に関する情報を送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ActivityDefinition_ChemotherapyRegimen_Oral"
* ^status = #draft
* ^date = "2023-11-30"
* . ^short = "TBD"
* . ^definition = "TBD"
* product[x] only CodeableConcept
* productCodeableConcept from $JP_MedicationCode_VS (preferred)
* productCodeableConcept ^binding.description = "医薬品コード"
* dosage only JP_MedicationDosage
