本プロファイルは、患者のアレルギー不耐症とその臨床的な評価を表現するJP_Consentリソースの記録・更新・検索を行う上で、準拠するべき必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## 6.2.1 Scope and Usage
The purpose of this Resource is to be used to express a Consent regarding Healthcare. There are four anticipated uses for the Consent Resource, all of which are written or verbal agreements by a healthcare consumer [grantor] or a personal representative, made to an authorized entity [grantee] concerning authorized or restricted actions with any limitations on purpose of use, and handling instructions to which the authorized entity must comply:

Privacy Consent Directive: Agreement to collect, access, use or disclose (share) information.
Medical Treatment Consent Directive: Consent to undergo a specific treatment (or record of refusal to consent).
Research Consent Directive: Consent to participate in research protocol and information sharing required.
Advance Care Directives: Consent to instructions for potentially needed medical treatment (e.g. DNR).
This resource is scoped to cover all four uses, but at this time, only the privacy use case is modeled. The scope of the resource may change when the other possible scopes are investigated, tested, or profiled.

A FHIR Consent Directive instance is considered the encoded legally binding Consent Directive if it meets requirements of a policy domain requirements for an enforceable contract. In some domains, electronic signatures of one or both of the parties to the content of an encoded representation of a Consent Form is deemed to constitute a legally binding Consent Directive. Some domains accept a notary’s electronic signature over the wet or electronic signature of a party to the Consent Directive as the additional identity proofing required to make an encoded Consent Directive legally binding. Other domains may only accept a wet signature or might not require the parties’ signatures at all.

Whatever the criteria are for making an encoded FHIR Consent Directive legally binding, anything less than a legally binding representation of a Consent Directive must be identified as such, i.e., as a derivative of the legally binding Consent Directive, which has specific usage in Consent Directive workflow management.

このリソースの目的は、ヘルスケアに関する同意を表明するために使用することです。このリソースには4つの用途が想定されており、それらはすべて、医療利用者（付与者）または個人的な代理人が、権限を付与された団体（被付与者）に対して行う許可された行為または制限された行為に関する書面または口頭による同意です。その使用目的には制限があり、権限を付与された団体が従わなければならない取扱いの指示があります：

1. プライバシー同意指令：情報の収集、アクセス、使用、開示（共有）に関する同意、制限、禁止。
2. 医療同意指令：特定の治療を受けることへの同意、または同意拒否の記録。
3. 研究同意指令：研究プロトコルへの参加と情報共有の同意。
4. 事前ケア指示書（Advance Care Directives）：潜在的に必要とされる医療処置（DNRなど）の指示に対する同意。

このリソースは4つの用途をすべてカバーするようにスコープされていますが、現時点ではプライバシーのユースケースのみがモデル化されています。このリソースのスコープは、他の可能なスコープが調査、テスト、またはプロファイリングされたときに変更されるかもしれません。

FHIR同意指示書インスタンスは、それが強制可能な契約に関するポリシードメインの要件を満たす場合、符号化された法的拘束力のある同意指示書とみなされます。ドメインによっては、エンコードされた「同意書」の表現内容に対する当事者の一方または双方の電子署名が、法的拘束力のある「同意の指示」を構成するとみなされます。ドメインによっては、エンコードされた同意指令に法的拘束力を持たせるために必要な追加的な身元証明として、同意指令の当事者のウェット署名または電子署名の上に公証人の電子署名を認めることもあります。他のドメインでは、湿式の署名しか受け付けないか、当事者の署名を全く必要としない場合もあります。

エンコードされたFHIR同意指示書に法的拘束力を持たせるための基準が何であれ、同意指示書の法的拘束力のない表現は、そのようなもの、すなわち、同意指示書のワークフロー管理における特定の用法がある法的拘束力のある同意指示書の派生物として識別されなければなりません。

## 6.2.1.1 Privacy Consent Directive (PCD)
Privacy policies define how Individually Identifiable Health Information (IIHI) is to be collected, accessed, used and disclosed. A Privacy Consent Directive as a legal record of a patient's (e.g. a healthcare consumer) agreement with a party responsible for enforcing the patient's choices, which permits or denies identified actors or roles to perform actions affecting the patient within a given context for specific purposes and periods of time. All consent directives have a policy context, which is any set of organizational or jurisdictional policies which may limit the consumer’s policy choices, and which include a named range of actions allowed. In addition, Privacy Consent Directives provide the ability for a healthcare consumer to delegate authority to a Substitute Decision Maker who may act on behalf of that individual. Alternatively, a consumer may author/publish their privacy preferences as a self-declared Privacy Consent Directive.

The Consent resource on FHIR provides support for alternative representations for expressing interoperable health information privacy consent directives in a standard form for the exchange and enforcement by sending, intermediating, or receiving systems of privacy policies that can be enforced by consuming systems (e.g., scanned documents, of computable structured entries elements, FHIR structures with optional attached, or referenced unstructured representations.) It may be used to represent the Privacy Consent Directive itself, a Consent Statement, which electronically represents a Consent Directive, or Consent Metadata, which is the minimum necessary consent content derived from a Consent Directive for use in workflow management.

プライバシーポリシーは、個人を特定できる健康情報（IIHI）の収集、アクセス、使用、開示の方法を定義します。プライバシー同意指令とは、患者（例えば医療消費者）が、患者の選択を強制する責任を負う当事者と合意した法的記録であり、特定された行為者又は役割が、特定の目的及び期間において、特定された文脈の中で患者に影響を及ぼす行為を許可又は拒否するものです。すべての同意指令は、消費者の方針の選択を制限する可能性があり、許可される行為の範囲を含む、組織又は管轄区域の方針の集合であり、方針の文脈を持っています。さらに、プライバシー同意指示書は、医療利用者が代理決定者に権限を委譲することができるか、あるいは医療利用者が自己宣言したプライバシー同意指示書として、自分のプライバシー嗜好を作成／公表することもできます。

FHIRのConsentリソースは、相互運用可能な医療情報のプライバシー同意指令を標準的な形式で表現するための代替表現をサポートします。これは、プライバシー同意指令そのもの、同意指令を電子的に表現する同意声明、ワークフロー管理で使用するために同意指令から導き出された必要最小限の同意内容である同意メタデータを表現するために使用できます。

## 6.2.2 Boundaries and Relationships
Consent management - particularly privacy consent - is complicated by the fact that consent to share is often itself necessary to protect. The need to protect the privacy of the privacy statement itself competes with the execution of the consent statement. For this reason, it is common to deal with 'consent statements' that are only partial representations of the full consent statement that the patient provided.

For this reason, the consent resource contains two elements that refer back to the source: a master identifier, and a direct reference to content from which this Consent Statement was derived. That reference can be one of several things:

- A reference to another consent resource from which this limited statement was derived
- A reference to a document format for the original source (e.g. PDF or CDA - see the HL7 CDAR2 ConsentDirective Implementation Guide , which incorporated the IHE Basic Patient Privacy Consents (BPPC)  ), either directly, or in a reference
- The source can be included in the consent as an attachment

The consent statements represent a chain that refers back to the original source consent directive. Applications may be able to follow the chain back to the source but should not generally assume that they are authorized to do this.

Consent Directives are executed by verbal acknowledge or by being signed - either on paper, or digitally. Consent Signatures will be found in the Provenance resource (example consent and signature). Implementation Guides will generally make rules about what signatures are required, and how they are to be shared and used.

同意の管理、特にプライバシーの同意は、共有への同意自体がしばしば保護が必要とされるという事実によって複雑になっています。プライバシーを保護する必要性そのものが、同意声明の実行と競合することがあります。そのため、患者が提供した完全な同意声明の部分的な表現である「同意声明」を扱うことが一般的です。

このため、同意リソースには2つの要素、すなわちマスター識別子と、この同意文が由来するコンテンツへの直接参照が含まれています。この参照は、いくつかのものの中で一つであり、以下のようなものが考えられます：

- この限定されたステートメントが派生した別の同意リソースへの参照
- 元のソースの文書フォーマットへの参照（例えば PDF や CDA - IHE 基本患者プライバシー同意書（BPPC）を組み込んだ HL7 CDAR2 ConsentDirective Implementation Guide を参照）。
- ソースは添付ファイルとして同意書に含めることもできます。

同意文は、元のソース同意指令を参照する連鎖を表しています。アプリケーションはソースまで遡って連鎖をたどることができるかもしれませんが、一般的にはこれを行う権限があると仮定すべきではありません。

同意の指示は、口頭による承認、または署名によって実行されます。同意の署名は、プロベナンストリソース（同意と署名の例）に記載されています。実施要項は一般に、どのような署名が必要で、どのように共有され、使用されるかについて規定します。

## 6.2.3 Background and Context
Change to "The Consent resource is structured with a base policy (represented as Consent.policy/Consent.policyRule) which is either opt-in or opt-out, followed by a listing of exceptions to that policy (represented as Consent.provision(s)). The exceptions can be additional positive or negative exceptions upon the base policy. The set of exceptions include a list of data objects, list of authors, list of recipients, list of Organizations, list of purposeOfUse, and Date Range.

The enforcement of the Privacy Consent Directive is not included but is expected that enforcement can be done using a mix of the various Access Control enforcement methodologies (e.g. OAuth, UMA, XACML). This enforcement includes the details of the enforcement meaning of the elements of the Privacy Consent Directive, such as the rules in place when there is an opt-in consent would be specific about which organizational roles have access to what kinds of resources (e.g. RBAC, ABAC). The specification of these details is not in scope for the Consent resource.

Consentリソースは、オプトインまたはオプトアウトの基本ポリシー（Consent.policy/Consent.policyRule）と、そのポリシーに対する例外のリスト（Consent.provision(s)）で構成されています。例外は、基本ポリシーに対する追加的な肯定的または否定的な例外とすることができます。例外のリストには、データオブジェクトのリスト、作成者のリスト、受信者のリスト、Organizationsのリスト、purposeOfUseのリスト、およびDate Rangeが含まれます。

プライバシー同意指令の施行は含まれていませんが、様々なアクセス制御施行方法論（OAuth、UMA、XACMLなど）を組み合わせて施行することが期待されています。この実施には、プライバシー同意指令の要素の実施意味の詳細が含まれます。例えば、オプトインによる同意がある場合のルールは、どの組織の役割がどのような種類のリソースにアクセスできるのか（例えば、RBAC、ABAC）を具体的に示すものであり、このような詳細は「同意」リソースの範囲外です。

## プロファイル定義
