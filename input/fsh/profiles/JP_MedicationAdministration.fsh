// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationAdministration
Parent: JP_MedicationAdministrationBase
Id: jp-medicationadministration
Title: "JP Core MedicationAdministration Profile"
Description: "このプロファイルはMedicationAdministrationリソースに対して、内服・外用薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration"
* ^status = #draft
* ^date = "2022-03-16"
* medicationReference ..0
