Profile: PhysioWebPractitioner
Parent: Practitioner
Id: physio-practitioner
Description: "Profile for Practitioner in PhysioWeb Project."

* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.ordered = false 
* identifier contains socialSecurityNumber 0..1 and localPatientId 0..1
//SVN
* identifier[socialSecurityNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203" (exactly)
* identifier[socialSecurityNumber].type.coding.code = #SS (exactly) //Resolved value "HL7V2" is not a valid URI.
* identifier[socialSecurityNumber].type.coding.display = "Social Security Number" (exactly)
* identifier[socialSecurityNumber].system 1..1
* identifier[socialSecurityNumber].system = "urn:oid:1.2.40.0.10.1.4.3.1" (exactly)
* identifier[socialSecurityNumber].system ^short = "OID for the Social Security Number in Austria"
* identifier[socialSecurityNumber].assigner.display = "Dachverband der österreichischen Sozialversicherungsträger" (exactly)
//Application Identifier
* identifier[localPatientId].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203" (exactly)
* identifier[localPatientId].type.coding.code = #CAAI (exactly)
* identifier[localPatientId].type.coding.display = "Consumer Application Account Identifier" (exactly)
* identifier[localPatientId].system 0..1 //1..1?
* identifier[localPatientId].system ^short = "Application Identifier."


* active 0..1 ?! SU //boolean "Whether this patient's record is in active use." Warum 'boolean als extraneous input bezeichnet wird?'
* active ^requirements = "Need to be able to mark a patient record as not to be used because it was created in error."
* active ^meaningWhenMissing = "This resource is generally assumed to be active if no value is provided for the active element."
* active ^mustSupport = false

* name 1..*

* telecom 0..* SU

* gender 1..1 MS //"male | female | other | unknown"
* gender from http://hl7.org/fhir/ValueSet/administrative-gender|5.0.0 (required)

* birthDate 0..1 SU //date

* address 0..* SU //Address

* photo 0..* //Attachment "Image of the patient."

* qualification 0..* //Certification, licenses, or training pertaining to the provision of care" "The official certifications, training, and licenses that authorize or otherwise pertain to the provision of care by the practitioner.  For example, a medical license issued by a medical board authorizing the practitioner to practice medicine within a certian locality.
* qualification.identifier 0..* //An identifier for this qualification for the practitioner" "An identifier that applies to this person's qualification in this role.
* qualification.identifier ^requirements = "Often, specific identities are assigned for the qualification."
* qualification.code 1..1 //Coded representation of the qualification" "Coded representation of the qualification.
* qualification.code from http://terminology.hl7.org/ValueSet/v2-2.7-0360 (example)
* qualification.code ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* qualification.code ^binding.extension[=].valueString = "Qualification"
* qualification.code ^binding.description = "Specific qualification the practitioner has to provide a service."
* qualification.period 0..1 //Period during which the qualification is valid" "Period during which the qualification is valid.
* qualification.period ^requirements = "Qualifications are often for a limited period of time, and can be revoked."
* qualification.issuer 0..1 //Reference(http://hl7.org/fhir/StructureDefinition/Organization) 

* communication 0..* //A language the practitioner can use in patient communication" "A language the practitioner can use in patient communication.
* communication from http://hl7.org/fhir/ValueSet/languages (preferred)
* communication ^comment = "The structure aa-BB with this exact casing is one the most widely used notations for locale. However not all systems code this but instead have it as free text. Hence CodeableConcept instead of code as the data type."
* communication ^requirements = "Knowing which language a practitioner speaks can help in facilitating communication with patients."
* communication ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-maxValueSet"
* communication ^binding.extension[=].valueCanonical = "http://hl7.org/fhir/ValueSet/all-languages"
* communication ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* communication ^binding.extension[=].valueString = "Language"
* communication ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* communication ^binding.extension[=].valueBoolean = true
* communication ^binding.description = "A human language."

Mapping: rim
Id: rim
Title: "RIM Mapping"
Source: PhysioWebPractitioner
Target: "http://hl7.org/v3"
* -> "Role"
* identifier -> "./id"
* active -> "./statusCode"
* name -> "./name"
* telecom -> "./telecom"
* address -> "./addr"
* gender -> "./administrativeGender"
* birthDate -> "./birthTime"
* photo -> "./subjectOf/ObservationEvent[code=\"photo\"]/value"
* qualification -> ".playingEntity.playingRole[classCode=QUAL].code"
* qualification.identifier -> ".playingEntity.playingRole[classCode=QUAL].id"
* qualification.code -> ".playingEntity.playingRole[classCode=QUAL].code"
* qualification.period -> ".playingEntity.playingRole[classCode=QUAL].effectiveTime"
* qualification.issuer -> ".playingEntity.playingRole[classCode=QUAL].scoper"
* communication -> "./languageCommunication"




Instance: PractitionerExample
InstanceOf: PhysioWebPractitioner
Description: "An example of a practitioner from PhysioWebPatient."

* identifier[socialSecurityNumber].use = #usual
* identifier[socialSecurityNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203" (exactly)
* identifier[socialSecurityNumber].type.coding.code = #SS (exactly) //Resolved value "HL7V2" is not a valid URI.
* identifier[socialSecurityNumber].type.coding.display = "Social Security Number" (exactly)
//* identifier[socialSecurityNumber].system = "urn:oid:1.2.36.146.595.217.0.1"
* identifier[socialSecurityNumber].value = "784512"
* identifier[socialSecurityNumber].period.start = "2001-05-06"
* identifier[socialSecurityNumber].assigner.display = "Dachverband der österreichischen Sozialversicherungsträger"


* identifier[localPatientId].use = #secondary
* identifier[localPatientId].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203" (exactly)
* identifier[localPatientId].type.coding.code = #CAAI (exactly)
* identifier[localPatientId].type.coding.display = "Consumer Application Account Identifier" (exactly)
//* identifier[localPatientId].system = "urn:oid:1.3.4.5.5.6.7..8"
* identifier[localPatientId].value = "1"
* identifier[localPatientId].period.start = "2001-05-06"
* identifier[localPatientId].assigner.display = "Application Identifier."

* active = true

* name
  * given[0] = "Maria"
  * family = "Lorens"

* telecom[0].use = #home
* telecom[+].system = #phone
* telecom[=].value = "(03) 5555 6473"
* telecom[=].use = #mobile
* telecom[=].rank = 1
* telecom[+].system = #phone
* telecom[=].value = "(03) 3410 5613"
* telecom[=].use = #work
* telecom[=].rank = 2

* gender = #female

* birthDate = "1995-12-25"

* address.use = #home
* address.type = #both
* address.text = "Linzer Str. 222, Vienna, Vienna 1140"
* address.line = "Linzer Str. 222"
* address.city = "Vienna"
* address.district = "Austria"
* address.state = "Vienna"
* address.postalCode = "1140"
* address.period.start = "2006-12-25"

* qualification.identifier.system = "http://uni.org/UniversityIdentifier"
* qualification.identifier.value = "649732"
* qualification.code.coding.system = "http://snomed.info/sct"
* qualification.code.coding.code = #36682004
* qualification.code.coding.display = "Physiotherapist"
* qualification.issuer.display = "FH Joanneum Graz"

* communication.coding.system = "urn:ietf:bcp:47"
* communication.coding.code = #de-AT
* communication.coding.display = "German (Austria)"

