Instance: jp-allergyintolerance-example-1
InstanceOf: JP_AllergyIntolerance
Title: "JP Core AllergyIntolerance Basic Example"
Description: "JP_AllergyIntoleranceリソースの1例"
Usage: #example
* clinicalStatus
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
    * code = #active
* verificationStatus
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
    * code = #confirmed
* type = #allergy 
* category = #food
* criticality = #high
* code
  * coding
    * system = $JP_JfagyFoodAllergenCodes_CS
    * code = #J9F692300006
    * display = "小麦粉"
  * text = "こむぎこ"
* patient
  * reference = "JP_Patient/jp-patient-example-1"
  * display = "山田 太郎"
* onsetDateTime = "2022-08-01"
* recordedDate = "2022-08-03" 
* reaction
  * manifestation
    * text = "じん麻疹"
  * severity = #moderate
