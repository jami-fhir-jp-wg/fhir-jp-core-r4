本プロファイルは、患者のアレルギー不耐症とその臨床的な評価を表現するJP_Consentリソースの記録・更新・検索を行う上で、準拠するべき必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## スコープ
- The purpose of this Resource is to be used to express a Consent regarding Healthcare. There are four anticipated uses for the Consent Resource, all of which are written or verbal agreements by a healthcare consumer [grantor] or a personal representative, made to an authorized entity [grantee] concerning authorized or restricted actions with any limitations on purpose of use, and handling instructions to which the authorized entity must comply:

- Privacy Consent Directive: Agreement to collect, access, use or disclose (share) information.
Medical Treatment Consent Directive: Consent to undergo a specific treatment (or record of refusal to consent).
Research Consent Directive: Consent to participate in research protocol and information sharing required.
Advance Care Directives: Consent to instructions for potentially needed medical treatment (e.g. DNR).
This resource is scoped to cover all four uses, but at this time, only the privacy use case is modeled. The scope of the resource may change when the other possible scopes are investigated, tested, or profiled.

- A FHIR Consent Directive instance is considered the encoded legally binding Consent Directive if it meets requirements of a policy domain requirements for an enforceable contract. In some domains, electronic signatures of one or both of the parties to the content of an encoded representation of a Consent Form is deemed to constitute a legally binding Consent Directive. Some domains accept a notary’s electronic signature over the wet or electronic signature of a party to the Consent Directive as the additional identity proofing required to make an encoded Consent Directive legally binding. Other domains may only accept a wet signature or might not require the parties’ signatures at all.

- Whatever the criteria are for making an encoded FHIR Consent Directive legally binding, anything less than a legally binding representation of a Consent Directive must be identified as such, i.e., as a derivative of the legally binding Consent Directive, which has specific usage in Consent Directive workflow management.

## 想定シナリオ

本プロファイルは、以下のようなユースケースを想定する。

- JP_Consentリソースの記録・更新・検索

## プロファイル定義
