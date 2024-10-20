"
I am a Data processor.
"
Class {
	#name : #SmockProcessData,
	#superclass : #Object,
	#traits : 'TSmockHaveProperties',
	#classTraits : 'TSmockHaveProperties classTrait',
	#instVars : [
		'processor'
	],
	#category : #'OpenSmock-Model'
}

{ #category : #accessing }
SmockProcessData class >> isAbstract [

	^ self == SmockProcessData
]

{ #category : #accessing }
SmockProcessData class >> processor: aProcessor [

	| processData |
	processData := self new.
	processData processor: aProcessor.
	^ processData
]

{ #category : #processing }
SmockProcessData >> processCreatedData: aKey incoming: aSourceData with: aProducedData context: aContext [

	self subclassResponsibility
]

{ #category : #processing }
SmockProcessData >> processDeletedData: aKey incoming: aSourceData with: aProducedData context: aContext [

	self subclassResponsibility
]

{ #category : #processing }
SmockProcessData >> processStateChanged: aKey state: aState value: aValueOrNil with: aProducedData context: aContext [

	self subclassResponsibility
]

{ #category : #processing }
SmockProcessData >> processUpdatedData: aKey incoming: aSourceData with: aProducedData context: aContext [

	self subclassResponsibility
]

{ #category : #accessing }
SmockProcessData >> processor [

	^ processor
]

{ #category : #accessing }
SmockProcessData >> processor: anObject [

	processor := anObject
]
