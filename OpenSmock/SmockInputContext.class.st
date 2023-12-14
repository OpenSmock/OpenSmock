Class {
	#name : #SmockInputContext,
	#superclass : #Object,
	#instVars : [
		'strategies',
		'controller'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #'strategy management' }
SmockInputContext >> addStrategy: anInputStrategy [

	(self strategies includes: anInputStrategy) ifTrue:[ ^ self ].
	self strategies add: anInputStrategy.
]

{ #category : #accessing }
SmockInputContext >> controller [

	^ controller
]

{ #category : #accessing }
SmockInputContext >> controller: anObject [

	controller := anObject
]

{ #category : #'event handling' }
SmockInputContext >> handleEvent: aSmockEventWrapper [

	aSmockEventWrapper isConsumed ifTrue:[ ^ self ].

	self strategies do:[ :s | 
		s handleEvent: aSmockEventWrapper context: self.
		aSmockEventWrapper isConsumed ifTrue: [ ^ self ].
	]
]

{ #category : #testing }
SmockInputContext >> haveStrategies [

	^ self strategies notEmpty 
]

{ #category : #accessing }
SmockInputContext >> initialize [ 

	super initialize.
	strategies := OrderedCollection new.
]

{ #category : #testing }
SmockInputContext >> numberOfStrategies [

	^ self strategies size 
]

{ #category : #accessing }
SmockInputContext >> strategies [

	^ strategies
]
