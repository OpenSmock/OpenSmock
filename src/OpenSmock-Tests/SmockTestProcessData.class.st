"
Process Data for GFLModel Tests
"
Class {
	#name : #SmockTestProcessData,
	#superclass : #SmockProcessData,
	#instVars : [
		'testStates'
	],
	#category : #'OpenSmock-Tests-Cases - Model'
}

{ #category : #processing }
SmockTestProcessData >> processCreatedData: aKey incoming: aSourceData with: aProducedData context: aContext [

	^ aSourceData data
]

{ #category : #processing }
SmockTestProcessData >> processDeletedData: aKey incoming: aSourceData with: aProducedData context: aContext [

	^ nil
]

{ #category : #processing }
SmockTestProcessData >> processStateChanged: aKey state: aState value: aValueOrNil with: aProducedData context: aContext [

	"Store the states to test the result with assertions"
	testStates ifNil:[ testStates := Dictionary new ].
	testStates at: aState put: aKey -> aValueOrNil.

	^ aProducedData
]

{ #category : #processing }
SmockTestProcessData >> processUpdatedData: aKey incoming: aSourceData with: aProducedData context: aContext [

	^ aSourceData data
]

{ #category : #processing }
SmockTestProcessData >> testStates [

	^ testStates
]
