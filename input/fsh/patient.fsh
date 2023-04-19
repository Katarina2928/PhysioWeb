
Profile: MyPatient
Parent: Patient
Description: "An example profile of the Patient resource."

// Wie defeniere ich mehr Ids bei Instance?
* identifier 1..* /*SU Identifier "An identifier for this patient."*/

//* active 0..1 ?! SU boolean "Whether this patient's record is in active use" "Whether this patient record is in active use. \nMany systems use this property to mark as non-current patients, such as those that have not been seen for a period of time based on an organization's business rules.\n\nIt is often used to filter patient lists to exclude inactive patients\n\nDeceased patients may also be marked as inactive for the same reasons, but may be active for some time after death."

* active 0..1 ?! SU //boolean "Whether this patient's record is in active use." Warum 'boolean als extraneous input bezeichnet wird?'
* active ^requirements = "Need to be able to mark a patient record as not to be used because it was created in error."
* active ^meaningWhenMissing = "This resource is generally assumed to be active if no value is provided for the active element."
* active ^mustSupport = false


// MS SU oder SU MS, kann man die beide glichzeitig definieren?
* name 1..* MS //SU HumanName "A name associated with the patient." 
* name ^comment = "A patient may have multiple names with different uses or applicable periods, but obligatory at least one."

* telecom 0..* SU //*ContactPoint "A contact detail for the individual."

* gender 1..1 SU //code "male | female | other | unknown"
* gender from http://hl7.org/fhir/ValueSet/administrative-gender|5.0.0 (required)
/* ???
* gender ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* gender ^binding.extension[=].valueString = "AdministrativeGender"
* gender ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* gender ^binding.extension[=].valueBoolean = true
* gender ^binding.description = "The gender of a person used for administrative purposes."
*/

* birthDate 0..1 SU //date

* deceased[x] 0..1 ?! SU //boolean or dateTime

* address 0..* SU //Address

* maritalStatus 0..1 //CodeableConcept "Marital (civil) status of a patient."
* maritalStatus from http://hl7.org/fhir/ValueSet/marital-status (extensible)

* multipleBirth[x] 0..1 //boolean or integer "Whether patient is part of a multiple birth."

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
Source: MyPatient
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
Source: MyPatient
Target: "http://loinc.org"
* birthDate -> "21112-8"

/*
// Slicing the identifier
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.assigner.reference"
* identifier ^slicing.rules = #openAtEnd
* identifier contains svnr 1..1

//define what svnr looks like
* identifier[svnr].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[svnr].type.coding.code = HL7V2#SS (exactly)
* identifier[svnr].type.coding.display = "Social Security Number" (exactly)
* identifier[svnr].system 1..1
* identifier[svnr].system = "urn:oid:1.3.4.5.5.6.7..8" (exactly)
* identifier[svnr].system ^short = "OID for the Social Security Number in Austria"
* identifier[svnr].assigner.display = "Dachverband der Ö SVN" (exactly)
* identifier[svnr].assigner.reference = "https://wwww.gesundhei.gv.at/OID Frontebd/..."
*/

Instance: PatientExample
InstanceOf: MyPatient
Description: "An example of a patient with a license to krill."
* identifier.use = #usual
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier.system = "urn:oid:1.2.36.146.595.217.0.1"
* identifier.value = "12345"
* identifier.period.start = "2001-05-06"
* identifier.assigner.display = "Acme Healthcare"

/*
* identifier[svnr].use = #official
* identifier[svnr].type = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[svnr].system = "urn:oid:1.3.4.5.5.6.7..8"
* identifier[svnr].value = "1234556"
* identifier[svnr].period.start = "2001-05-06"
* identifier[svnr].assigner.display = "Dachverband der Ö SVN"
*/

* name
  * given[0] = "James"
  * family = "Pond"

* telecom[0].use = #home
* telecom[+].system = #phone
* telecom[=].value = "(03) 5555 6473"
* telecom[=].use = #work
* telecom[=].rank = 1
* telecom[+].system = #phone
* telecom[=].value = "(03) 3410 5613"

* gender = #male

* birthDate = "1974-12-25"

* deceasedBoolean = true

* address.use = #home
* address.type = #both
* address.text = "534 Erewhon St PeasantVille, Rainbow, Vic  3999"
* address.line = "534 Erewhon St"
* address.city = "PleasantVille"
* address.district = "Rainbow"
* address.state = "Vic"
* address.postalCode = "3999"
* address.period.start = "1974-12-25"

* managingOrganization = Reference(Organization/1)