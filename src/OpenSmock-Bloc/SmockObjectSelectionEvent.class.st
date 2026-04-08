Class {
	#name : #SmockObjectSelectionEvent,
	#superclass : #BlEvent,
	#instVars : [
		'objectIndexesList'
	],
	#category : #'OpenSmock-Bloc-Events'
}

{ #category : #testing }
SmockObjectSelectionEvent >> isAdded [

	^ false
]

{ #category : #testing }
SmockObjectSelectionEvent >> isChanged [

	^ false
]

{ #category : #testing }
SmockObjectSelectionEvent >> isCleared [

	^ false
]

{ #category : #testing }
SmockObjectSelectionEvent >> isRemoved [

	^ false
]

{ #category : #accessing }
SmockObjectSelectionEvent >> objectIndexesList [

	^ objectIndexesList ifNil: [ objectIndexesList := OrderedCollection new ]
]

{ #category : #accessing }
SmockObjectSelectionEvent >> objectIndexesList: aList [

	objectIndexesList := aList
]
