
## 更新履歴

### v1.1

v1.0 → v1.1に変更するあたり、開発環境(simplefier→ Sushi & IG Publisher)を変更しているため、特に見た目や動作等が変更されている。
それ以外に大きな変更について下記に纏めている。

* 全般
    * 開発環境をSushi & IG Publisherに変更した。
    * 全てのリソースに対して、idを割り振った。
    * name,title,url等は命名規則に合わせるように見直しを行なった。
    * 説明文書について、「である調」に合わせた。
    * Terminlogy BindingおよびConstrantsに関する記述はは、IG Publisherによる自動生成記述に変更した。
    * リソースの被参照、参照先の記載を削除した。
    * slice名称を先頭小文字に統一した。
    * FHIR Baseの説明に一部機械翻訳を用いた。
    * Capablity StatementをJP Core派生の際の必要条件ではなく、派生先の実装のための参考例として役割の記載を変更した。
    * Referenceとして定義される参照先リソースについてJP Coreで定義しているリソースは、JP Coreリソースを参照先とするように付け直した。
    * サンプルファイル(Example)をリソースファイルとして定義をした。
    
* ガイダンス
    * 文字検索等の説明を追加した。
    * JP Coreで定義してしていない用語の扱いについて説明を行なった。
    
* Administration関連
    * JP_HumanNameにてtext欄の名前の区切り文字に、半角空白であることを明示した。
    * JP_Patient.nameをSlicingを利用せずに、参照先をJP_HumanNameとするように定義した。
    * JP_Practitioner.nameをSlicingを利用せずに、参照先をJP_HumanNameとするように定義した。
    * JP_Practitioner.qualificationの定義を詳細化した。

* Medication関連
    * JP_Immunizationプロファイルを追加した。
    * Extensionにて参照される型を厳密化した。
    * リソースのdescriptionとpurposeが同一の場合にpurposeの記述を削除した。

* Diagnostics関連
    * Observation関連
    * ImagingStudy関連
    * DiagnosticReport関連
    
* Clinical関連
    * JP_CarePlanリソースを追加した。
    * JP_Procedureリソースにてcode,peformer.function, bodySite, complication, followUp, focalDevice.action, usedCode等のTerminology Bindingを定義した。

* Search Parameter
    * [Search Parameter Registry](http://hl7.org/fhir/R4/searchparameter-registry.html)に記載されているSeach ParameterはJP Coreでは新たに定義する必用ないと判断し削除した。
    * Coverageの被保険証関連Extension([JP_Coverage_InsuredPersonNumber], [JP_Coverage_InsuredPersonSubNumber], [JP_Coverage_InsuredPersonSymbolExtension])に対する検索パラメータを追加した
    * Organizationの施設関連Extension([JP_Organization_InsuranceOrganizationCategory], [JP_Organization_InsuranceOrganizationNo], [JP_Organization_PrefectureNo])に対する検索パラメータの追加した。
    * Patientのカナソート用の検索パラメータを追加した。

* Terminology


* Security
    * 医療情報システムの安全管理に関するガイドライン第5.2版の改版に合わせセキュリティの見直しを行なった。

### ver1.0

* 新規作成