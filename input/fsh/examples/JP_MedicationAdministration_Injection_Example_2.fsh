Instance: jp-medicationadministration-injection-example-2
InstanceOf: MedicationAdministration
Title: "JP MedicationAdministration Injection 点滴注射（実施）"
Description: "点滴注射（実施）"
Usage: #example
* contained[0] = jp-medicationadministration-injection-medication-example-2
* contained[+] = jp-medicationadministration-injection-bodystructure-example-2
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment"
* extension[=].valueCodeableConcept = urn:oid:1.2.392.100495.20.2.51#01 "内科"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester"
* extension[=].valueReference = Reference(Practitioner/jp-practionner-example-female-1) "東京 春子"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn"
* extension[=].valueDateTime = "2016-07-01T00:00:00+09:00"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location"
* extension[=].valueReference = Reference(Location/jp-location-example-ward) "09A病棟 021病室 4ベッド"
* identifier[0].system = "http://www.example.com/fhir/order-number"
* identifier[=].value = "123456789012345"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #completed
* category = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* medicationReference = Reference(Medication/jp-medicationadministration-injection-medication-example-2)
* subject = Reference(Patient/jp-patient-example-1)
* effectivePeriod.start = "2016-07-01T08:05:21+09:00"
* effectivePeriod.end = "2016-07-01T13:05:43+09:00"
* performer.function = http://terminology.hl7.org/CodeSystem/med-admin-perform-function#performer "Performer"
* performer.actor = Reference(Practitioner/jp-practionner-example-female-1) "神奈川 花子"
* request = Reference(MedicationRequest/jp-medicationrequest-injection-example-2)
* dosage.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line"
* dosage.extension.valueCodeableConcept = http://jpfhir.jp/medication/99ILL#01 "主管"
* dosage.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosage.site.extension.valueReference = Reference(BodyStructure/jp-medicationadministration-injection-bodystructure-example-2) "左腕"
* dosage.route = http://terminology.hl7.org/CodeSystem/v2-0162#IV "Intravenous"
* dosage.method = http://terminology.hl7.org/CodeSystem/v2-0165#IVP "IV Push"
* dosage.dose = 510 'mL' "mL"
* dosage.rateRatio.numerator = 102 'mL' "mL"
* dosage.rateRatio.denominator = 1 'h' "h"