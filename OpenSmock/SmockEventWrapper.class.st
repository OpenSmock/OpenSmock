Class {
	#name : #SmockEventWrapper,
	#superclass : #Object,
	#instVars : [
		'event',
		'isConsumed'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #constructor }
SmockEventWrapper class >> wrap: anEvent [

	^ self new event: anEvent; yourself
]

{ #category : #accessing }
SmockEventWrapper >> event [

	^ event
]

{ #category : #accessing }
SmockEventWrapper >> event: anEvent [

	event := anEvent
]

{ #category : #accessing }
SmockEventWrapper >> isConsumed [

	^ isConsumed ifNil:[ isConsumed := false ]
]

{ #category : #accessing }
SmockEventWrapper >> isConsumed: anObject [

	isConsumed := anObject
]
