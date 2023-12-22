Class {
	#name : #SmockInputStrategy,
	#superclass : #Object,
	#instVars : [
		'previousEvent'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #testing }
SmockInputStrategy class >> isAbstract [ 

	^ self = SmockInputStrategy 
]

{ #category : #'event handling' }
SmockInputStrategy >> handleEvent: aSmockEventWrapper context: aSmockInputContext [

	"Process the event"
	self processEvent: aSmockEventWrapper context: aSmockInputContext.

	"Store event as previous event"
	self previousEvent: aSmockEventWrapper.
]

{ #category : #accessing }
SmockInputStrategy >> previousEvent [

	^ previousEvent
]

{ #category : #accessing }
SmockInputStrategy >> previousEvent: anObject [

	previousEvent := anObject
]

{ #category : #'event handling' }
SmockInputStrategy >> processEvent: aSmockEventWrapper context: aSmockInputContext [

	self explicitRequirement 
]
