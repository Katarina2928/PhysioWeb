Profile: PhysioWebCondition
Parent: Condition
Id: physio-condition
Description: "A clinical condition, problem, diagnosis, or other event, situation, issue, or clinical concept that has risen to a level of concern."

* identifier 0..* SU //Identifier "External Ids for this condition" "Business identifiers assigned to this condition by the performer or other systems which remain constant as the resource is updated and propagates from server to server."
* identifier ^comment = "This is a business identifier, not a resource identifier (see [discussion](resource.html#identifiers)).  It is best practice for the identifier to only appear on a single resource instance, however business practices may occasionally dictate that multiple resource instances with the same identifier can exist - possibly even with different resource types.  For example, multiple Patient and a Person resource instance might share the same social insurance number."
* identifier ^requirements = "Allows identification of the condition as it is known by various participating systems and in a way that remains consistent across servers."
* identifier ^mustSupport = false

* clinicalStatus 1..1 ?! SU //CodeableConcept "active | recurrence | relapse | inactive | remission | resolved | unknown" "The clinical status of the condition."
* clinicalStatus from http://hl7.org/fhir/ValueSet/condition-clinical|5.0.0 (required)
* clinicalStatus ^comment = "The data type is CodeableConcept because clinicalStatus has some clinical judgment involved, such that there might need to be more specificity than the required FHIR value set allows. For example, a SNOMED coding might allow for additional specificity.  clinicalStatus is required since it is a modifier element.  For conditions that are problems list items, the clinicalStatus should not be unknown.  For conditions that are not problem list items, the clinicalStatus may be unknown.  For example, conditions derived from a claim are point in time, so those conditions may have a clinicalStatus of unknown"
* clinicalStatus ^condition[0] = "con-3"
* clinicalStatus ^condition[+] = "con-2"
* clinicalStatus ^mustSupport = false
* clinicalStatus ^isModifierReason = "This element is labeled as a modifier because the status contains codes that mark the condition as no longer active."
* clinicalStatus ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* clinicalStatus ^binding.extension[=].valueString = "ConditionClinicalStatus"
* clinicalStatus ^binding.description = "The clinical status of the condition or diagnosis."

* verificationStatus 0..1 ?! SU //CodeableConcept "unconfirmed | provisional | differential | confirmed | refuted | entered-in-error" "The verification status to support the clinical status of the condition.  The verification status pertains to the condition, itself, not to any specific condition attribute."
* verificationStatus from http://hl7.org/fhir/ValueSet/condition-ver-status|5.0.0 (required)
* verificationStatus ^comment = "verificationStatus is not required.  For example, when a patient has abdominal pain in the ED, there is not likely going to be a verification status.\nThe data type is CodeableConcept because verificationStatus has some clinical judgment involved, such that there might need to be more specificity than the required FHIR value set allows. For example, a SNOMED coding might allow for additional specificity."
* verificationStatus ^mustSupport = false
* verificationStatus ^isModifierReason = "This element is labeled as a modifier because the status contains the code refuted and entered-in-error that mark the Condition as not currently valid."
* verificationStatus ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* verificationStatus ^binding.extension[=].valueString = "ConditionVerificationStatus"
* verificationStatus ^binding.description = "The verification status to support or decline the clinical status of the condition or diagnosis."

* category 1..* //CodeableConcept "problem-list-item | encounter-diagnosis" "A category assigned to the condition."
* category ^comment = "The categorization is often highly contextual and may appear poorly differentiated or not very useful in other contexts."
* category ^condition[0] = "con-2"
* category ^mustSupport = false
* category ^isModifier = false
* category ^isSummary = false
* category ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* category ^binding.extension[=].valueString = "ConditionCategory"
* category ^binding.description = "A category assigned to the condition."

* severity 1..1 //CodeableConcept "Subjective severity of condition" "A subjective assessment of the severity of the condition as evaluated by the clinician."
* severity from http://hl7.org/fhir/ValueSet/condition-severity (preferred)
* severity ^comment = "Coding of the severity with a terminology is preferred, where possible."
* severity ^mustSupport = false
* severity ^isModifier = false
* severity ^isSummary = false
* severity ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* severity ^binding.extension[=].valueString = "ConditionSeverity"
* severity ^binding.description = "A subjective assessment of the severity of the condition as evaluated by the clinician."

* code 1..1 SU //CodeableConcept "Identification of the condition, problem or diagnosis" "Identification of the condition, problem or diagnosis."
* code from http://hl7.org/fhir/ValueSet/condition-code (example)
* code ^requirements = "0..1 to account for primarily narrative only resources."
* code ^alias = "type"
* code ^mustSupport = false
* code ^isModifier = false
* code ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code ^binding.extension[=].valueString = "ConditionKind"
* code ^binding.description = "Identification of the condition or diagnosis."

* bodySite 1..* SU //CodeableConcept "Anatomical location, if relevant" "The anatomical location where this condition manifests itself."
* bodySite from http://hl7.org/fhir/ValueSet/body-site (example)
* bodySite ^comment = "Only used if not implicit in code found in Condition.code. If the use case requires attributes from the BodyStructure resource (e.g. to identify and track separately) then use the standard extension [http://hl7.org/fhir/StructureDefinition/bodySite](http://hl7.org/fhir/extensions/StructureDefinition-bodySite.html).  May be a summary code, or a reference to a very precise definition of the location, or both."
* bodySite ^mustSupport = false
* bodySite ^isModifier = false
* bodySite ^binding.extension[0].url = "http://hl7.org/fhir/tools/StructureDefinition/binding-definition"
* bodySite ^binding.extension[=].valueString = "Codes describing anatomical locations. May include laterality."
* bodySite ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* bodySite ^binding.extension[=].valueString = "BodySite"
* bodySite ^binding.description = "SNOMED CT Body site concepts"

* subject 1..1 SU //Reference(http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/Group) "Who has the condition?" "Indicates the patient or group who the condition record is associated with."
* subject ^requirements = "Group is typically used for veterinary or public health use cases."
* subject ^alias = "patient"
* subject ^mustSupport = false
* subject ^isModifier = false

* encounter 0..1 SU //Reference(http://hl7.org/fhir/StructureDefinition/Encounter) "The Encounter during which this Condition was created" "The Encounter during which this Condition was created or to which the creation of this record is tightly associated."
* encounter ^comment = "This will typically be the encounter the event occurred within, but some activities may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter. This record indicates the encounter this particular record is associated with.  In the case of a \"new\" diagnosis reflecting ongoing/revised information about the condition, this might be distinct from the first encounter in which the underlying condition was first \"known\"."
* encounter ^mustSupport = false
* encounter ^isModifier = false

* onset[x] 0..1 SU //dateTime or Age or Period or Range or string "Estimated or actual date,  date-time, or age" "Estimated or actual date or date-time  the condition began, in the opinion of the clinician."
* onset[x] ^comment = "Age is generally used when the patient reports an age at which the Condition began to occur.  Period is generally used to convey an imprecise onset that occurred within the time period.  For example, Period is not intended to convey the transition period before the chronic bronchitis or COPD condition was diagnosed, but Period can be used to convey an imprecise diagnosis date.  Range is generally used to convey an imprecise age range (e.g. 4 to 6 years old).  Because a Condition.code can represent multiple levels of granularity and can be modified over time, the onset and abatement dates can have ambiguity whether those dates apply to the current Condition.code or an earlier representation of that Condition.code.   For example, if the Condition.code was initially documented as severe asthma, then it is ambiguous whether the onset and abatement dates apply to asthma (overall in that subject's lifetime) or when asthma transitioned to become severe."
* onset[x] ^mustSupport = false
* onset[x] ^isModifier = false

* abatement[x] 0..1 //dateTime or Age or Period or Range or string "When in resolution/remission" "The date or estimated date that the condition resolved or went into remission. This is called \"abatement\" because of the many overloaded connotations associated with \"remission\" or \"resolution\" - Some conditions, such as chronic conditions, are never really resolved, but they can abate."
* abatement[x] ^comment = "There is no explicit distinction between resolution and remission because in many cases the distinction is not clear. Age is generally used when the patient reports an age at which the Condition abated.  If there is no abatement element, it is unknown whether the condition has resolved or entered remission; applications and users should generally assume that the condition is still valid.  When abatementString exists, it implies the condition is abated.\nBecause a Condition.code can represent multiple levels of granularity and can be modified over time, the onset and abatement dates can have ambiguity whether those dates apply to the current Condition.code or an earlier representation of that Condition.code.   For example, if the Condition.code was initially documented as severe asthma, then it is ambiguous whether the onset and abatement dates apply to asthma (overall in that subject's lifetime) or when asthma transitioned to become severe."
* abatement[x] ^condition[0] = "con-3"
* abatement[x] ^mustSupport = false
* abatement[x] ^isModifier = false
* abatement[x] ^isSummary = false

* recordedDate 0..1 SU //dateTime "Date condition was first recorded" "The recordedDate represents when this particular Condition record was created in the system, which is often a system-generated date."
* recordedDate ^comment = "When onset date is unknown, recordedDate can be used to establish if the condition was present on or before a given date.  If the recordedDate is known and provided by a sending system, it is preferred that the receiving system preserve that recordedDate value. If the recordedDate is not provided by the sending system, the receipt timestamp is sometimes used as the recordedDate."
* recordedDate ^mustSupport = false
* recordedDate ^isModifier = false

* stage 0..* TU //BackboneElement "Stage/grade, usually assessed formally" "A simple summary of the stage such as \"Stage 3\" or \"Early Onset\". The determination of the stage is disease-specific, such as cancer, retinopathy of prematurity, kidney diseases, Alzheimer's, or Parkinson disease."
* stage obeys con-1
* stage ^mustSupport = false
* stage ^isModifier = false
* stage ^isSummary = false
* stage.summary 0..1 //CodeableConcept "Simple summary (disease specific)" "A simple summary of the stage such as \"Stage 3\" or \"Early Onset\". The determination of the stage is disease-specific, such as cancer, retinopathy of prematurity, kidney diseases, Alzheimer's, or Parkinson disease."
* stage.summary from http://hl7.org/fhir/ValueSet/condition-stage (example)
* stage.summary ^condition[0] = "con-1"
* stage.summary ^mustSupport = false
* stage.summary ^isModifier = false
* stage.summary ^isSummary = false
* stage.summary ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* stage.summary ^binding.extension[=].valueString = "ConditionStage"
* stage.summary ^binding.description = "Codes describing condition stages (e.g. Cancer stages)."
* stage.assessment 0..* //Reference(http://hl7.org/fhir/StructureDefinition/ClinicalImpression or http://hl7.org/fhir/StructureDefinition/DiagnosticReport or http://hl7.org/fhir/StructureDefinition/Observation) "Formal record of assessment" "Reference to a formal record of the evidence on which the staging assessment is based."
* stage.assessment ^condition[0] = "con-1"
* stage.assessment ^mustSupport = false
* stage.assessment ^isModifier = false
* stage.assessment ^isSummary = false
* stage.type 0..1 //CodeableConcept "Kind of staging" "The kind of staging, such as pathological or clinical staging."
* stage.type from http://hl7.org/fhir/ValueSet/condition-stage-type (example)
* stage.type ^mustSupport = false
* stage.type ^isModifier = false
* stage.type ^isSummary = false
* stage.type ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* stage.type ^binding.extension[=].valueString = "ConditionStageType"
* stage.type ^binding.description = "Codes describing the kind of condition staging (e.g. clinical or pathological)."

* evidence 0..* SU //TU Reference(http://hl7.org/fhir/StructureDefinition/Resource) "Supporting evidence for the verification status" "Supporting evidence / manifestations that are the basis of the Condition's verification status, such as evidence that confirmed or refuted the condition."
* evidence ^comment = "If the condition was confirmed, but subsequently refuted, then the evidence can be cumulative including all evidence over time.  The evidence may be a simple list of coded symptoms/manifestations, or references to observations or formal assessments, or both.  For example, if the Condition.code is pneumonia, then there could be an evidence list where Condition.evidence.concept = fever (CodeableConcept), Condition.evidence.concept = cough (CodeableConcept), and Condition.evidence.reference = bronchitis (reference to Condition). "
* evidence ^mustSupport = false
* evidence ^isModifier = false
* evidence ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* evidence ^binding.extension[=].valueString = "ManifestationOrSymptom"

* note 0..* //Annotation "Additional information about the Condition" "Additional information about the Condition. This is a general notes/comments entry  for description of the Condition, its diagnosis and prognosis."
* note ^mustSupport = false
* note ^isModifier = false
* note ^isSummary = false

Invariant: con-2
Description: "If category is problems list item, the clinicalStatus should not be unknown"
Severity: #warning
Expression: "category.coding.where(system='http://terminology.hl7.org/CodeSystem/condition-category' and code='problem-list-item').exists() implies clinicalStatus.coding.where(system='http://terminology.hl7.org/CodeSystem/condition-clinical' and code='unknown').exists().not()"

Invariant: con-3
Description: "If condition is abated, then clinicalStatus must be either inactive, resolved, or remission."
Severity: #error
Expression: "abatement.exists() implies (clinicalStatus.coding.where(system='http://terminology.hl7.org/CodeSystem/condition-clinical' and (code='inactive' or code='resolved' or code='remission')).exists())"

Invariant: con-1
Description: "Stage SHALL have summary or assessment"
Severity: #error
Expression: "summary.exists() or assessment.exists()"


Mapping: sct-concept
Id: sct-concept
Title: "SNOMED CT Concept Domain Binding"
Source: PhysioWebCondition
Target: "http://snomed.info/conceptdomain"
* -> "< 243796009 |Situation with explicit context| : 246090004 |Associated finding| = ( ( < 404684003 |Clinical finding| MINUS ( << 420134006 |Propensity to adverse reactions| OR << 473010000 |Hypersensitivity condition| OR << 79899007 |Drug interaction| OR << 69449002 |Drug action| OR << 441742003 |Evaluation finding| OR << 307824009 |Administrative status| OR << 385356007 |Tumor stage finding|)) OR < 272379006 |Event|)"
* clinicalStatus -> "< 303105007 |Disease phases|"
* verificationStatus -> "< 410514004 |Finding context value|"
* category -> "< 404684003 |Clinical finding|"
* severity -> "< 272141005 |Severities|"
* code -> "(< 404684003 |Clinical finding| MINUS (\n<< 420134006 |Propensity to adverse reactions| OR \n<< 473010000 |Hypersensitivity condition| OR \n<< 79899007 |Drug interaction| OR\n<< 69449002 |Drug action| OR \n<< 441742003 |Evaluation finding| OR \n<< 307824009 |Administrative status| OR \n<< 385356007 |Tumor stage finding|)) \nOR < 413350009 |Finding with explicit context|\nOR < 272379006 |Event|"
* bodySite -> "< 442083009  |Anatomical or acquired body structure|"
* stage.summary -> "< 254291000 |Staging and scales|"


Mapping: sct-attr
Id: sct-attr
Title: "SNOMED CT Attribute Binding"
Source: PhysioWebCondition
Target: "http://snomed.org/attributebinding"
* verificationStatus -> "408729009"
* severity -> "246112005"
* code -> "246090004"
* bodySite -> "363698007"





Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-ver-status = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: $condition-category = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $sct = http://snomed.info/sct

Instance: ConditionExample
InstanceOf: PhysioWebCondition
Description: "An example of a condition for PhysioWeb."
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category.coding[0] = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.coding[+] = $sct#439401001 "Diagnosis"
* severity = $sct#24484000 "Severe"
* code = $sct#239720000 "Tear of meniscus of knee (disorder)"
* code.text = "Meniscus Tear"
* bodySite = $sct#82169009 "Structure of left knee region (body structure)"
* bodySite.text = "Left knee"
* subject = Reference(Patient/PatientExample)
* onsetDateTime = "2023-03-24"