Class {
	#name : #SmockEventWrapper,
	#superclass : #Object,
	#instVars : [
		'event',
		'isConsumed',
		'timestamp'
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
SmockEventWrapper >> initialize [

	super initialize.
	self timestamp: DateAndTime now.
]

{ #category : #accessing }
SmockEventWrapper >> isConsumed [

	^ isConsumed ifNil:[ isConsumed := false ]
]

{ #category : #accessing }
SmockEventWrapper >> isConsumed: anObject [

	isConsumed := anObject
]

{ #category : #accessing }
SmockEventWrapper >> timestamp [

	^ timestamp
]

{ #category : #accessing }
SmockEventWrapper >> timestamp: anObject [

	timestamp := anObject
]
