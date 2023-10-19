// ==============================
//   Profile 定義
// ==============================
Profile: JP_Consent
Parent: Consent
Id: jp-consent
Title: "JP Core Consent Profile"
Description: "Detailed Descriptions for the elements in the Consent resource."
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Consent"
* ^status = #inactive
* ^date = "2023-10-20"
* . ^short = "A healthcare consumer's or third party's choices to permit or deny recipients or roles to perform actions for specific purposes and periods of time"
* . ^definition = "A record of a healthcare consumer’s choices or choices made on their behalf by a third party, which permits or denies identified recipient(s) or recipient role(s) to perform one or more actions within a given policy context, for specific purposes and periods of time."
* status ^short = "draft | proposed | active | rejected | inactive | entered-in-error"
* status ^definition = "Indicates the current state of this consent."
* scope from ConsentScopeCodes (extensible)
* scope ^short = "	Which of the four areas this resource covers (extensible)"
* scope ^definition = "A selector of the type of consent being presented: ADR, Privacy, Treatment, Research. This list is now extensible."
* category from ConsentCategoryCodes (extensible)
* category ^short = "Classification of the consent statement - for indexing/retrieval"
* category ^definition = "A classification of the type of consents found in the statement. This element supports indexing and retrieval of consent statements."
