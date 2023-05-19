
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
* entry[+].fullUrl = "http://hl7.org/fhir/ValueSet/vs2NS" 
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

// 1. Subskala Symptome
* item[=].item[0].linkId = "1.1"
* item[=].item[=].definition = "http://loinc.org/rdf#64750-3"
* item[=].item[=].text = "Severity of symptoms"
* item[=].item[=].type = #group
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



// 2. Subskala Schmerz
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



// 3. Subskala Aktivitäten des alltäglichen Lebens
* item[=].item[+].linkId = "1.3"
* item[=].item[=].definition = "http://loinc.org/rdf#72095-3"
* item[=].item[=].text = "Activities of daily living score"
* item[=].item[=].type = #group

// 1&2 Schwierigkeiten bei Treppen hinaufsteigen und hinunterstiegen?
* item[=].item[=].item[0].linkId = "1.3.1"
* item[=].item[=].item[=].text = "Difficulties climbing up and down stairs?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs3KG"

// 5 Sich bücken/einen Gegenstand vom Boden aufheben?
* item[=].item[=].item[+].linkId = "1.3.2"
* item[=].item[=].item[=].text = "Difficulty bending down/picking up an object from the floor?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs3KG"

// 13 Einsteigen in die Badewanne – Aussteigen aus der Badewanne?
* item[=].item[=].item[+].linkId = "1.3.3"
* item[=].item[=].item[=].text = "Difficulties getting into the bathtub - getting out of the bathtub?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs3KG"

// 17 Leichte Hausarbeit verrichteten (Kochen, Staub wischen...)?
* item[=].item[=].item[+].linkId = "1.3.4"
* item[=].item[=].item[=].text = "Difficulty doing light housework (cooking, dusting...)?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs3KG"

// 16 Schwere Hausarbeit verrichteten (Kisten tragen, Böden schrubben...)?
* item[=].item[=].item[+].linkId = "1.3.5"
* item[=].item[=].item[=].text = "Difficulty doing heavy housework (carrying boxes, scrubbing floors...)?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs3KG"

// Einkaufen (im Supermarkt/Einkaufszentrum)? 
* item[=].item[=].item[+].linkId = "1.3.6"
* item[=].item[=].item[=].text = "Difficulties with shopping (in the supermarket/shopping centre)?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/vs3KG"



// nie-immer
Instance: vs1NI
InstanceOf: ValueSet
Usage: #inline
* url = "http://hl7.org/fhir/ValueSet/vs1NI"
* name = "Frequency"
* status = #active
* compose.include.system = "http://loinc.org"

* compose.include.concept[0].code = #LA6270-8
* compose.include.concept[=].display = "Never"
* compose.include.concept[+].code = #LA10066-1
* compose.include.concept[=].display = "Rarely"
* compose.include.concept[+].code = #LA10082-8
* compose.include.concept[=].display = "Sometimes"
* compose.include.concept[+].code = #LA10044-8
* compose.include.concept[=].display = "Often"
* compose.include.concept[+].code = #LA9933-8
* compose.include.concept[=].display = "Always" 



// gar nicht-sehr stark
Instance: vs2NS
InstanceOf: ValueSet
Usage: #inline
* url = "http://hl7.org/fhir/ValueSet/vs2NS"
* name = "Level of strength"
* status = #active
* compose.include.system = "http://loinc.org"

* compose.include.concept[0].code = #LA6568-5
* compose.include.concept[=].display = "Not at all"
* compose.include.concept[+].code = #LA13940-4
* compose.include.concept[=].display = "A little"
* compose.include.concept[+].code = #LA28439-0
* compose.include.concept[=].display = "Rather"
* compose.include.concept[+].code = #LA15550-9
* compose.include.concept[=].display = "Much"
* compose.include.concept[+].code = #LA28441-6
* compose.include.concept[=].display = "Very strong"



// keine-sehr große
Instance: vs3KG
InstanceOf: ValueSet
Usage: #inline
* url = "http://hl7.org/fhir/ValueSet/vs3KG"
* name = "Level of severity"
* status = #active
* compose.include.system = "http://loinc.org"

* compose.include.concept[0].code = #LA137-2
* compose.include.concept[=].display = "None"
* compose.include.concept[+].code = #LA6752-5
* compose.include.concept[=].display = "Mild"
* compose.include.concept[+].code = #LA6751-7
* compose.include.concept[=].display = "Moderate"
* compose.include.concept[+].code = #LA6750-9
* compose.include.concept[=].display = "Severe"
* compose.include.concept[+].code = #LA13958-6
* compose.include.concept[=].display = "Very severe"