Instance: quest-allg-zustand // Profile?
InstanceOf: Bundle // Parent?
* type = #transaction
* entry[0].fullUrl = "http://hl7.org/fhir/Questionnaire/235689"
* entry[=].resource = Inline-Instance-for-quest-allg-zustand
* entry[=].request.method = #PUT
* entry[=].request.url = "http://hl7.org/fhir/Questionnaire/235689"

// nie-immer
* entry[+].fullUrl = "http://hl7.org/fhir/ValueSet/vs1NI" 
* entry[=].resource = vs1NI
* entry[=].request.method = #PUT
* entry[=].request.url = "http://hl7.org/fhir/ValueSet/vs1NI"

// gar nicht-sehr stark
* entry[+].fullUrl = "http://hl7.org/fhirc/ValueSet/vs2NS" 
* entry[=].resource = vs2NS
* entry[=].request.method = #PUT
* entry[=].request.url = "http://hl7.org/fhir/ValueSet/vs2NS"

// keine-sehr große
* entry[+].fullUrl = "http://hl7.org/fhir/ValueSet/vs3KG" 
* entry[=].resource = vs3KG
* entry[=].request.method = #PUT
* entry[=].request.url = "http://hl7.org/fhir/ValueSet/vs3KG"


Instance: Inline-Instance-for-quest-allg-zustand // Profile?
InstanceOf: Questionnaire //Parent?
Usage: #inline
* id = "235689"
* url = "http://hl7.org/fhir/us/sdc/Questionnaire/235689"
* identifier.system = "http://example.org/panel-id"
* identifier.value = "235689"
* title = "Questionnaire lower extremity"
* status = #active
// * experimental = true
* subjectType = #Patient
// * date = "2023"
* purpose = "Summarizes the general condition of the patient"
* code = http://loinc.org#73789-0 "General physical condition [NSRAS]" //?

* item[0].linkId = "0"
* item[=].type = #group
* item[=].item[0].linkId = "0.1"
* item[=].item[=].text = "Date Done"
* item[=].item[=].type = #date
* item[=].item[+].linkId = "0.2"
* item[=].item[=].text = "Time Done"
* item[=].item[=].type = #time
* item[=].item[+].linkId = "0.3"
* item[=].item[=].text = "Where Done"
* item[=].item[=].type = #string
* item[=].item[+].linkId = "0.4"
* item[=].item[=].text = "Comment"
* item[=].item[=].type = #string

* item[+].linkId = "1"
* item[=].definition = "http://loinc.org/rdf#54126-8"
* item[=].text = "Your health information"
* item[=].type = #group
* item[=].required = true

// Subskala Symptome
* item[=].item[0].linkId = "1.1"
* item[=].definition = "http://loinc.org/rdf#64750-3"
* item[=].text = "Severity of symptoms"
* item[=].type = #group
// * item[=].required = true

// 1 Spüren Sie ein Reiben, hören Sie ein Klicken, Knirschen, Knacken oder ein anderes Geräusch im Gelenk?
* item[=].item[=].item[0].linkId = "1.1.1"
* item[=].item[=].item[=].text = "Do you feel any rubbing, hear any clicking, crunching, cracking or other noise in the joint?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs1NI"

// 2 Haben Sie Schwierigkeiten, die Beine zu spreizen?
* item[=].item[=].item[+].linkId = "1.1.2"
* item[=].item[=].item[=].text = "Do you have difficulty spreading your legs?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs3KG"

// 3 Haben Sie Schwierigkeiten, beim Gehen große Schritte zu machen?
* item[=].item[=].item[+].linkId = "1.1.3"
* item[=].item[=].item[=].text = "Do you have difficulty taking large steps when walking?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs3KG"

// 4 Wie ausgeprägt ist die Steifigkeit im Gelenk, wenn Sie morgens aufwachen?
* item[=].item[=].item[+].linkId = "1.1.4"
* item[=].item[=].item[=].text = "How pronounced is the stiffness in the joint when you wake up in the morning?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs2NS"

// 5 Wie ausgeprägt ist die Steifigkeit im Gelenk nach dem Sitzen, Liegen oder Ausruhen im Verlauf des Tages?
* item[=].item[=].item[+].linkId = "1.1.5"
* item[=].item[=].item[=].text = "How pronounced is the stiffness in the joint after sitting, lying down or resting during the day?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs1NI"



// Subskala Schmerz
* item[=].item[+].linkId = "1.2"
* item[=].item[=].definition = "http://loinc.org/rdf#80316-3"
* item[=].item[=].text = "Pain scale"
* item[=].item[=].type = #group

// 1 Wie oft haben Sie Schmerzen im Gelenk?
* item[=].item[=].item[0].linkId = "1.2.1"
* item[=].item[=].item[=].text = "How often do you have pain in the joint?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs1NI"

// 2 Spüren Sie Schmerzen bie vollständiges Strecken des Gelenkes  (Aufrichten)?
* item[=].item[=].item[+].linkId = "1.2.2"
* item[=].item[=].item[=].text = "Do you feel pain when the joint is fully extended (straightened)?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs3KG"

// 3 Spüren Sie Schmerzen bie maximales Beugen des Gelenkes?
* item[=].item[=].item[+].linkId = "1.2.3"
* item[=].item[=].item[=].text = "Do you feel pain when bending the joint to the maximum?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs2NS"

// 5 Spüren Sie Schmerzen bei Treppen hinauf- oder hinuntersteigen?
* item[=].item[=].item[+].linkId = "1.2.4"
* item[=].item[=].item[=].text = "Do you feel pain when going up or down stairs?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs2NS"

// 9 Spüren Sie Schmerzen bei Gehen auf hartem Boden?
* item[=].item[=].item[+].linkId = "1.2.5"
* item[=].item[=].item[=].text = "Do you feel pain when walking on hard ground?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs2NS"



// Subskala Aktivitäten des alltäglichen Lebens


// nie-immer
Instance: vs1NI
InstanceOf: ValueSet
Usage: #inline
* url = "http://hl7.org/fhir/AnswerList/vs1NI"
* name = "Frequency"
* status = #active
* immutable = true  // Indicates whether or not any change to the content logical definition may occur
* compose.include.concept[0] = #vs1NI-1 "Never"
* compose.include.concept[+] = #vs1NI-2 "Rarely"
* compose.include.concept[+] = #vs1NI-3 "Sometimes"
* compose.include.concept[+] = #vs1NI-4 "Often"
* compose.include.concept[+] = #vs1NI-5 "Always"