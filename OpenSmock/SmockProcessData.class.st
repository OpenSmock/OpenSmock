"
I am a Data processor.
"
Class {
	#name : #SmockProcessData,
	#superclass : #Object,
	#instVars : [
		'properties',
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

{ #category : #properties }
SmockProcessData >> getProperty: aKey [

	^ self properties at: aKey ifAbsent: [ nil ]
]

{ #category : #properties }
SmockProcessData >> isPropertyExists: aKey [

	^ self properties includesKey: aKey
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

{ #category : #properties }
SmockProcessData >> properties [

	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : #properties }
SmockProcessData >> properties: anObject [

	properties := anObject
]

{ #category : #properties }
SmockProcessData >> removeProperty: aKey [

	self properties removeKey: aKey ifAbsent: [ ]
]

{ #category : #properties }
SmockProcessData >> setProperty: aKey value: aValue [

	self properties at: aKey put: aValue
]
