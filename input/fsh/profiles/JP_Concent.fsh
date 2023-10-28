// ==============================
//   Profile 定義
// ==============================
Profile: JP_Consent
Parent: Consent
Id: jp-consent
Title: "JP Core Consent Profile"
Description: "Detailed Descriptions for the elements in the Consent resource."
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Consent"
* ^status = #draft
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
* patient 0..1
* patient only Reference(JP_Patient)
* patient ^short = "Who the consent applies to"
* patient ^definition = "The patient/healthcare consumer to whom this consent applies."

* dateTime 0..1
* dateTime ^short = "When this Consent was created or indexed"
* dateTime ^definition = "When this Consent was issued / created / indexed."

* performer 0..*
* performer only Reference(JP_Organization or JP_Patient or JP_Practitioner or RelatedPerson or JP_PractitionerRole)
* performer ^short = "Who is agreeing to the policy and rules"
* performer ^definition = "Either the Grantor, which is the entity responsible for granting the rights listed in a Consent Directive or the Grantee, which is the entity responsible for complying with the Consent Directive, including any obligations or limitations on authorizations and enforcement of prohibitions."

* organization 0..*
* organization only Reference(JP_Organization) 
* organization ^short = "Custodian of the consent"
* organization ^definition = "The organization that manages the consent, and the framework within which it is executed."

* source[x] only Reference(JP_Consent or DocumentReference or Contract or QuestionnaireResponse)
* source[x] ^short = "Source from which this consent is taken"
* source[x] ^definition = "The source on which this consent statement is based. The source might be a scanned original paper form, or a reference to a consent that links back to such a source, a reference to a document repository (e.g. XDS) that stores the original consent document."

* policy 0..*
* policy ^short = "Policies covered by this consent"
* policy ^definition = "The references to the policies that are included in this consent scope. Policies may be organizational, but are often defined jurisdictionally, or in law."

// 未チェック
* verification 0..*
* verification ^short = "Has the instruction been verified"
* verification ^definition = "Whether the instruction is verified."

* verification.verified 1..1
* verification.verified ^short = "Has been verified"
* verification.verified ^definition = "Whether the instruction has been verified."

* verification.verifiedWith 0..1
* verification.verifiedWith only Reference(JP_Patient or RelatedPerson)
* verification.verifiedWith ^short = "Who verified the instruction"
* verification.verifiedWith ^definition = "Who verified the instruction."

* provision 0..1
* provision ^short = "Consent Provisions"
* provision ^definition = "A set of rules under which this content was created or which the content follows."

* provision.type 1..1
* provision.type ^short = "deny | permit"
* provision.type ^definition = "Action stipulated by this rule. The type can be 'permit' or 'deny' to determine if the rule allows or prohibits the specified operations."

* provision.actor 0..*
* provision.actor ^short = "Who the rule applies to"
* provision.actor ^definition = "Who the consent provision rule applies to."

* provision.actor.role from SecurityRoleType (extensible)
* provision.actor.role ^short = "Role using the content"
* provision.actor.role ^definition = "How the individual is involved in the resources content that is described in the exception."

* provision.actor.reference only Reference(Device or Group or CareTeam or JP_Organization or JP_Patient or JP_Practitioner or RelatedPerson or PractitionerRole)
* provision.actor.reference ^short = "Reference to the actor"
* provision.actor.reference ^definition = "The resource that identifies the actor. For example, a patient, practitioner, or organization."

* provision.action 0..*
* provision.action ^short = "Actions controlled by this rule"
* provision.action ^definition = "A list of actions controlled by this rule, which are controlled by this provision."

* provision.period 0..1
* provision.period ^short = "Timeframe for this rule"
* provision.period ^definition = "The timeframe in which the data is controlled by this provision."

* provision.class 0..*
* provision.class ^short = "e.g. Read, Update, Delete"
* provision.class ^definition = "Actions controlled by this provision."

* provision.code 0..*
* provision.code from ConsentContentCodes (example)
* provision.code ^short = "e.g. Read, Update, Delete"
* provision.code ^definition = "If this code is found in an instance, then the rule applies."

* provision.dataPeriod 0..1
* provision.dataPeriod ^short = "Timeframe for data controlled by this rule"
* provision.dataPeriod ^definition = "The timeframe for data controlled by this provision."

* provision.data 0..*
* provision.data ^short = "Data controlled by this rule"
* provision.data ^definition = "The resources controlled by this rule, if specific resources are referenced."
