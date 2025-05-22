Class {
	#name : #SmockSymbology,
	#superclass : #Dictionary,
	#instVars : [
		'key',
		'name'
	],
	#category : #'OpenSmock-Symbology'
}

{ #category : #symbol }
SmockSymbology >> defaultSymbol [

	^ self at: #default ifAbsent: [ nil ]
]

{ #category : #symbol }
SmockSymbology >> defaultSymbol: anObject [

	self at: #default put: anObject
]

{ #category : #accessing }
SmockSymbology >> key [

	^ key
]

{ #category : #accessing }
SmockSymbology >> key: anObject [

	key := anObject
]

{ #category : #accessing }
SmockSymbology >> name [

	^ name
]

{ #category : #accessing }
SmockSymbology >> name: anObject [

	name := anObject
]
