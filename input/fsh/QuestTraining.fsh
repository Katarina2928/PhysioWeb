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
* item[=].item[=].definition = "http://loinc.org/rdf"
* item[=].item[=].code = #28978002
* item[=].item[=].text = "Post-exercise state"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/goodbad"

* item[=].item[+].linkId = "1.2"
* item[=].item[=].text = "Comments on the progress of the exercises/description of sensation"
* item[=].item[=].type = #text

/*
* item[+].linkId = "2"
* item[=].definition = "http://snomed.info/sct"
* item[=].code = #LG41761-4
* item[=].text = "Exercise/Activity" 
* item[=].type = #group
*/

// 2. Übung
* item[=].item[+].linkId = "2.1"
* item[=].item[=].definition = "http://loinc.org/rdf"
* item[=].item[=].code = #28978002
* item[=].item[=].text = "Post-exercise state"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/goodbad"

* item[=].item[+].linkId = "2.2"
* item[=].item[=].text = "Comments on the progress of the exercises/description of sensation"
* item[=].item[=].type = #text


// 3. Übung
* item[=].item[+].linkId = "3.1"
* item[=].item[=].definition = "http://loinc.org/rdf"
* item[=].item[=].code = #28978002
* item[=].item[=].text = "Post-exercise state"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/goodbad"

* item[=].item[+].linkId = "3.2"
* item[=].item[=].text = "Comments on the progress of the exercises/description of sensation"
* item[=].item[=].type = #text





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



/*
Instance: QuestResponseTraining
InstanceOf: QuestionnaireResponse
* contained[0] = PatientExample
* contained[+] = PractitionerExample
* questionnaire = "urn:uuid:95eaedf7-8a24-478a-8300-39acc44c749c"
* status = #completed

* item.answer.item[0].linkId = "1"
* item.answer.item[=].answer.valueCoding = http://hl7.org/fhir/AnswerList/goodbad#LA8967-7
* item.answer.item[+].linkId = "2"
* item.answer.item[=].answer.value = "Bla bls ls"
*/


