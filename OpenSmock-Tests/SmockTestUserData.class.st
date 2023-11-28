"
GFLModel data for testing GFLModel
"
Class {
	#name : #SmockTestUserData,
	#superclass : #Object,
	#instVars : [
		'id',
		'data'
	],
	#category : #'OpenSmock-Tests-Cases - Model'
}

{ #category : #accessing }
SmockTestUserData class >> id: anObject data: aData [
	| model |
	model := self new.
	model id: anObject.
	model data: aData.
	^model
]

{ #category : #accessing }
SmockTestUserData >> data [
	^data
]

{ #category : #accessing }
SmockTestUserData >> data: anObject [
	data := anObject
]

{ #category : #accessing }
SmockTestUserData >> id [
	^id
]

{ #category : #accessing }
SmockTestUserData >> id: anObject [
	id := anObject
]

{ #category : #accessing }
SmockTestUserData >> key [
	^self id
]
