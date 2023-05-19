Instance: QuestTraining
InstanceOf: Questionnaire
* name = "QuestionnrieAfterEachExerciseSession"
* title = "Questionnrie After Each Exercise Session"
* status = #active
* subjectType = #Patient

* item[0].linkId = "1"
* item[=].definition = "http://snomed.info/sct"
* item[=].code = #LG41761-4
* item[=].text = "Exercise/Activity" 
* item[=].type = #group

// 1. Übung
* item[=].item[0].linkId = "1.1"
* item[=].item[=].definition = "http://snomed.info/sct"
* item[=].item[=].code = #9251003
* item[=].item[=].text = "Jumping"
* item[=].item[=].type = #display

* item[=].item[+].linkId = "1.2"
* item[=].item[=].definition = "http://loinc.org/rdf"
* item[=].item[=].code = #28978002
* item[=].item[=].text = "Post-exercise state"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "https://fhir.loinc.org/ValueSet/?url=http://loinc.org/vs/LL1012-5"

* item[=].item[+].linkId = "1.3"
* item[=].item[=].text = "Comments on the progress of the exercises/description of sensation"
* item[=].item[=].type = #text


// 2. Übung
* item[=].item[+].linkId = "2.1"
* item[=].item[=].definition = "http://snomed.info/sct"
* item[=].item[=].code = #282961006
* item[=].item[=].text = "Squats"
* item[=].item[=].type = #display

* item[=].item[+].linkId = "2.2"
* item[=].item[=].definition = "http://loinc.org/rdf"
* item[=].item[=].code = #28978002
* item[=].item[=].text = "Post-exercise state"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "https://fhir.loinc.org/ValueSet/?url=http://loinc.org/vs/LL1012-5"

* item[=].item[+].linkId = "2.3"
* item[=].item[=].text = "Comments on the progress of the exercises/description of sensation"
* item[=].item[=].type = #text


// 3. Übung
* item[=].item[+].linkId = "3.1"
* item[=].item[=].definition = "http://snomed.info/sct"
* item[=].item[=].code = #300648001
* item[=].item[=].text = "Rides a bike"
* item[=].item[=].type = #display

* item[=].item[+].linkId = "3.2"
* item[=].item[=].definition = "http://loinc.org/rdf"
* item[=].item[=].code = #28978002
* item[=].item[=].text = "Post-exercise state"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "https://fhir.loinc.org/ValueSet/?url=http://loinc.org/vs/LL1012-5"

* item[=].item[+].linkId = "3.3"
* item[=].item[=].text = "Comments on the progress of the exercises/description of sensation"
* item[=].item[=].type = #text

/*
Note: Es gibt 2 Möglichkeiten bei ValueSet:
- Nutzung des offiziellen Links von Loinc: https://fhir.loinc.org/ValueSet/?url=http://loinc.org/vs/LL1012-5
- Definition eigens ValueSet mit code von Loinc: http://hl7.org/fhir/ValueSet/goodbad
*/


/*
Instance: goodbad
InstanceOf: ValueSet
* url = "http://hl7.org/fhir/AnswerList/goodbad"
* status = #active
* compose.include.system = "http://loinc.org"

* compose.include.concept[0].code = #LA9206-9
* compose.include.concept[=].display = "Excellent"

* compose.include.concept[+].code = #LA13913-1
* compose.include.concept[=].display = "Very Good"

* compose.include.concept[+].code = #LA8967-7
* compose.include.concept[=].display = "Good"

* compose.include.concept[+].code = #LA8968-5
* compose.include.concept[=].display = "Fair"

* compose.include.concept[+].code = #LA8969-3
* compose.include.concept[=].display = "Poor"
*/



Instance: QuestResponseTraining
InstanceOf: QuestionnaireResponse
* contained[0] = PatientExample
* contained[+] = PractitionerExample
* questionnaire = "urn:uuid:95eaedf7-8a24-478a-8300-39acc44c749c"
* status = #completed

* item[0].linkId = "1"
* item[=].item[0].linkId = "1.1"
* item[=].item[=].text = "Jumping"
* item[=].item[+].linkId = "1.2"
* item[=].item[=].text = "Post-exercise state"
* item[=].item[=].answer.valueCoding.system = "https://fhir.loinc.org/ValueSet/?url=http://loinc.org/vs/LL1012-5"
* item[=].item[=].answer.valueCoding.code = #LA8967-7
* item[=].item[=].answer.valueCoding.display = "Good"
* item[=].item[+].linkId = "1.3"
* item[=].item[=].text = "Übung war okey."

* item[=].item[+].linkId = "2.1"
* item[=].item[=].text = "Squats"
* item[=].item[+].linkId = "2.2"
* item[=].item[=].text = "Post-exercise state"
* item[=].item[=].answer.valueCoding.system = "https://fhir.loinc.org/ValueSet/?url=http://loinc.org/vs/LL1012-5"
* item[=].item[=].answer.valueCoding.code = #LA8969-3
* item[=].item[=].answer.valueCoding.display = "Poor"
* item[=].item[+].linkId = "2.3"
* item[=].item[=].text = "Habe Schmerzen gehabt."

* item[=].item[+].linkId = "3.1"
* item[=].item[=].text = "Rides a bike"
* item[=].item[+].linkId = "3.2"
* item[=].item[=].text = "Post-exercise state"
* item[=].item[=].answer.valueCoding.system = "https://fhir.loinc.org/ValueSet/?url=http://loinc.org/vs/LL1012-5"
* item[=].item[=].answer.valueCoding.code = #LA9206-9
* item[=].item[=].answer.valueCoding.display = "Excellent"
* item[=].item[+].linkId = "3.3"
* item[=].item[=].text = "Es ist sehr gut gelaufen."