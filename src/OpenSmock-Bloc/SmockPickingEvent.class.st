Class {
	#name : #SmockPickingEvent,
	#superclass : #BlEvent,
	#instVars : [
		'pickingResult'
	],
	#category : #'OpenSmock-Bloc-Events'
}

{ #category : #accessing }
SmockPickingEvent >> pickingResult [

	^ pickingResult
]

{ #category : #accessing }
SmockPickingEvent >> pickingResult: anObject [

	pickingResult := anObject
]
