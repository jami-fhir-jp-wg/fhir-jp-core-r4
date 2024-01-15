### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- status : 本リソースのステータス (draft | active | retired | unknown)

### Extensions定義

本プロファイルで定義された拡張は次の通りである。

|拡張|説明|定義|値型|
|:----|:----|:----|:----|

### 用語定義
TBD

<!-- |分類|用語集|CS名|URI|
|-----|----|----|---------------------------|
|レジメン種別|TBD|TBD|TBD| -->

### 制約一覧
本プロファイルで追加定義された制約はない。

### 項目の追加
本プロファイルで追加された項目は以下の通りである。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

<!-- | コンフォーマンス    | パラメータ                   | 型         | 例                                                                                 |
| ---------------- | -------------------------- |  --------- | ---------------------------------------------------------------------------------- |
| SHALL            | identifier                 | token      | GET [base]/PlanDefinition?identifier=http://myhospital.com/fhir/PlanDefinition\|123 |
| SHOULD           | patient                    | reference  | GET [base]/PlanDefinition?patient=Patient/123                                        |
| MAY              | patient,onset-date         | reference,date | GET [base]/PlanDefinition?patient=Patient/123&onset-date=ge2021-08-24             |
| MAY              | patient,clinical-status     | reference,code | GET [base]/PlanDefinition?patient=Patient/123&clinical-status=active              |
| MAY              | patient,verification-status | reference,code | GET [base]/PlanDefinition?patient=Patient/123&verification-status=confirmed       |
| MAY              | patient,category           | reference,code | GET [base]/PlanDefinition??patient=Patient/123&category=problem-list-item    | -->

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）

1. 検索パラメータidentifierを指定し、レコードIDなどの識別子によりActivityDefinitionを検索

   ```
   GET [base]/ActivityDefinition?identifier={system|}[code]
   ```
   例：
   ```
   GET [base]/ActivityDefinition?identifier=http://myhospital.com/fhir/ActivityDefinition|123
   ```
   
   指定された識別子に一致するActivityDefinitionリソースを含むBundleを検索する。

##### 推奨検索パラメータ

 TBD

##### オプション検索パラメータ 

 本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

<!-- * [**病名（過敏性大腸炎の初期疾患）**][jp-condition-diagnosis-example-1] -->
TBD

## 注意事項

### 記述の単位について
JP_MedicationRequest_Injectionプロファイルと同等の粒度になるようにするため、複数の薬剤をまとめたMedicationリソースのインスタンスをcontained属性に内包した上で参照する。

### 投与薬剤、投与量(基準投与量)の記述方法
1回の投与薬剤と投与量(基準投与量)は、RP内の薬剤が単独薬剤の場合も、複数の薬剤を混注する場合も、すべての薬剤を記述したMedicationリソースをActivityDefinition.contained属性に内包し、そのActivityDefinitionリソースを一意に識別可能なidをPlanDefinition.action.definitionCanonicalに記録する。Medicationリソースのingredient.itemCodeableConcept要素にCodeableConcept型で各薬剤の識別情報を記述し、ingredient.strength.numerator要素に1回あたりの含有量を記述する。薬剤を識別するコードについては、医療機関の具体的な採用薬を用いて記述する場合はHOT7、HOT9、YJコードを推奨し、成分名のみを用いて記述する場合はATCコードを推奨する。

「オキサリプラチン」と「５％ブドウ糖液」を混注する場合のサンプルインスタンスを示す。

<font color="red">TODO<br>
- MERIT-9の単位の中に「mg/㎡」や「mg/body」などがない（UCUMに「mg/m2」は存在する）<br>
- 案1: numeratorに「mg」、denominator「㎡」を記述する（MERIT-9に「㎡」が定義されていない）<br>
- 案2: numeratorにUCUM「mg/m2」を記述する（denominatorには何を記述するか）<br>
</font>

```json
"contained": [
  {
    "resourceType": "Medication",
    "id": "#medication",
    "ingredient": [
      {
        "itemCodeableConcept": {
          "coding": [
            {
              "code": "TBD",
              "display": "オキサリプラチン",
              "system": "TBD"
            }
          ]
        },
        "strength": {
          "numerator": {
            "value": 85,
            "unit": "mg/m2",
            "system": "http://unitsofmeasure.org",
            "code": "mg/m2"
          },
          "denominator": {
            "value": 1,
            "unit": "回",
            "system": "urn:oid:1.2.392.100495.20.2.101",
            "code": "TIME"
          }
        }
      }, 
      {
        "itemCodeableConcept": {
          "coding": [
            {
              "code": "TBD",
              "display": "５％ブドウ糖液",
              "system": "TBD"
            }
          ]
        },
        "strength": {
          "numerator": {
            "value": 250,
            "unit": "ｍＬ",
            "system": "urn:oid:1.2.392.100495.20.2.101",
            "code": "ML"
          },
          "denominator": {
            "value": 1,
            "unit": "回",
            "system": "urn:oid:1.2.392.100495.20.2.101",
            "code": "TIME"
          }
        }
      }
    ]
  }
]
```

### 投与総量(投与基準総量)、投与速度、投与速度コメントの記述方法
投与総量（混注する場合は混注後の総量）をdosage.doseQuantity要素に記述し、投与速度はdosage.doseAndRate.rateRatioに記述する。単位はUCUM(“http://unitsofmeasure.org”)を使用する。
また投与速度を表現するコメントを記述する場合は、dosage.doseAndRate.rateRatioに対して定義した拡張「JP_MedicationDosage_RateComment」を使用し、CodeableConcept型またはString型を使用して記録する。

投与総量「267mL」、投与速度「134mL/h (2時間かけて)」を記述したインスタンス例を示す。

<font color="red">TODO<br>
100mg20mL → 85mg17mL<br>
オキサリプラチン:17mL + ５％ブドウ糖液:250mL = 267mL<br>
2hで投与する場合 = 133.5mL/h (四捨五入: 134mL)<br>
</font>

```json
"dosage": [
  {
    "doseQuantity": {
      "value": 267,
      "unit": "mL",
      "system": "http://unitsofmeasure.org",
      "code": "mL"
    },
    "doseAndRate": [
      {
        "rateRatio": {
          "extension": [
            {
              "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_RateComment",
              "valueString": "２時間で"
            }
          ],
          "numerator": {
            "value": 134,
            "unit": "mL",
            "system": "http://unitsofmeasure.org",
            "code": "mL"
          },
          "denominator": {
            "value": 1,
            "unit": "時間",
            "system": "http://unitsofmeasure.org",
            "code": "h"
          }
        }
      }
    ]
  }
]
```

### 投与経路、投与手技の記述方法
「静脈内」「眼内」などの投与経路は、dosageInstruction.route 要素にコードまたは文字列で指定する。使用するコード表はHL7 V2の使用者定義表0162 投薬経路を推奨し、その場合識別するURIとして、”http://jpfhir.jp/fhir/core/CodeSystem/route-codes”を使用する。

「0:静脈注射」、「1:中心静脈注射」などJAMI標準用法コードにて用法詳細区分として表現される区分（注射では「投与手技」とも呼ばれる）は、dosageInstruction.method 要素にコードまたは文字列で指定する。 用法詳細区分を識別するURIとして、”urn:oid:1.2.392.200250.2.2.20.30”を使用する。HL7 V2の使用者定義表0165(“http://terminology.hl7.org/CodeSystem/v2-0165”)やJAHIS注射データ交換規約のJHSI表0003 精密持続点滴(“http://jpfhir.jp/fhir/core/CodeSystem/JHSI0003)を使用してもよい。

```json
"dosage": [
  {
    "route" : {
      "coding" : [
        {
          "system" : "http://jpfhir.jp/fhir/core/CodeSystem/route-codes",
          "code" : "IV",
          "display" : "静脈内"
        }
      ]
    },
    "method" : {
      "coding" : [
        {
          "system" : "urn:oid:1.2.392.200250.2.2.20.40",
          "code" : "30",
          "display" : "静脈注射"
        }
      ]
    }
  }
]
```

### 補足指示
補足指示がある場合は、dosage.additionalInstructionに記載する。コード化されていない場合は、text要素にフリーテキストで記載する。

```json
"dosage": [
  {
    "additionalInstruction": [
      {
        "text": "レボホリナートと同時に"
      }
    ]
  }
]
```

## その他、参考文献・リンク等
TBD

{% include markdown-link-references.md %}