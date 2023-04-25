
Profile: PhysioWebPatient
Parent: Patient
Id: physio-patient
Description: "Profile for Patient in PhysioWeb Project."

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


* name 1..* MS 
* name ^comment = "A patient may have multiple names with different uses or applicable periods, but obligatory at least one."

* telecom 0..* SU 

* gender 1..1 MS //"male | female | other | unknown"
* gender from http://hl7.org/fhir/ValueSet/administrative-gender|5.0.0 (required)

* birthDate 0..1 SU //date

* deceased[x] 0..1 ?! SU //boolean or dateTime

* address 0..* SU //Address 

* maritalStatus 0..1 //CodeableConcept "Marital (civil) status of a patient."
* maritalStatus from http://hl7.org/fhir/ValueSet/marital-status (extensible)

* photo 0..* //Attachment "Image of the patient."

// Brauchen contact Element?

* communication 0..* // BackboneElement "A language which may be used to communicate with the patient about his or her health."
* communication ^comment = "If no language is specified, this *implies* that the default local language is spoken."
* communication.language 1..1 //CodeableConcept "The language which can be used to communicate with the patient about his or her health."
* communication.language from http://hl7.org/fhir/ValueSet/all-languages|5.0.0 (required)

* generalPractitioner 0..* //Reference(http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole) "Patient's nominated primary care provider."
* generalPractitioner ^alias = "careProvider"

* managingOrganization 0..1 SU //Reference(http://hl7.org/fhir/StructureDefinition/Organization) "Organization that is the custodian of the patient record."

* link 0..* ?! SU //BackboneElement "Link to a Patient or RelatedPerson resource that concerns the same actual individual."
* link ^comment = "There is no assumption that linked patient records have mutual links."
* link.other 1..1 SU //Reference(http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/RelatedPerson)
* link.other ^comment = "Referencing a RelatedPerson here removes the need to use a Person record to associate a Patient and RelatedPerson as the same individual."
* link.other ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* link.other ^type.extension.valueBoolean = false
* link.type 1..1 SU //code "replaced-by | replaces | refer | seealso" "The type of link between this patient resource and another patient resource."
* link.type from http://hl7.org/fhir/ValueSet/link-type|5.0.0 (required)
* link.type ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* link.type ^binding.extension[=].valueString = "LinkType"
* link.type ^binding.description = "The type of link between this patient resource and another Patient resource, or Patient/RelatedPerson when using the `seealso` code"

Invariant: pat-1
Description: "SHALL at least contain a contact's details or a reference to an organization"
Severity: #error
Expression: "name.exists() or telecom.exists() or address.exists() or organization.exists()"


Mapping: interface
Id: interface
Title: "Interface Pattern"
Source: PhysioWebPatient
Target: "http://hl7.org/fhir/interface"
* -> "ParticipantLiving"
* identifier -> "Participant.identifier"
* active -> "Participant.active"
* name -> "Participant.name"
* telecom -> "ParticipantContactable.telecom"
* gender -> "ParticipantLiving.gender"
* birthDate -> "ParticipantLiving.birthDate"
* address -> "ParticipantContactable.address"
* photo -> "ParticipantLiving.photo"
* communication -> "ParticipantLiving.communication"

Mapping: loinc
Id: loinc
Title: "LOINC code for the element"
Source: PhysioWebPatient
Target: "http://loinc.org"
* birthDate -> "21112-8"


Instance: PatientExample
InstanceOf: PhysioWebPatient
Description: "An example of a patient from PhysioWebPatient."

* identifier[socialSecurityNumber].use = #usual
* identifier[socialSecurityNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203" (exactly)
* identifier[socialSecurityNumber].type.coding.code = #SS (exactly) //Resolved value "HL7V2" is not a valid URI.
* identifier[socialSecurityNumber].type.coding.display = "Social Security Number" (exactly)
//* identifier[socialSecurityNumber].system = "urn:oid:1.2.36.146.595.217.0.1"
* identifier[socialSecurityNumber].value = "894523"
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
  * given[0] = "Peter"
  * family = "Broli"

* telecom[0].use = #home
* telecom[+].system = #phone
* telecom[=].value = "(03) 5555 6473"
* telecom[=].use = #mobile
* telecom[=].rank = 1
* telecom[+].system = #phone
* telecom[=].value = "(03) 3410 5613"
* telecom[=].use = #work
* telecom[=].rank = 2

* gender = #male

* birthDate = "1974-12-25"

* deceasedBoolean = true

* address.use = #home
* address.type = #both
* address.text = "Tuchlauben 18, Vienna, Vienna 1010"
* address.line = "Tuchlauben 18"
* address.city = "Vienna"
* address.district = "Austria"
* address.state = "Vienna"
* address.postalCode = "1010"
* address.period.start = "1974-12-25"

* maritalStatus.coding.system = "https://www.hl7.org/fhir/r4/valueset-marital-status.html"
* maritalStatus.coding.code = #M
* maritalStatus.coding.display = "Married"

* communication.language.coding.system = "urn:ietf:bcp:47"
* communication.language.coding.code = #de-AT
* communication.language.coding.display = "German (Austria)"

* generalPractitioner = Reference(PractitionerExample) 

* managingOrganization = Reference(Organization/1)