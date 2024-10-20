"
A SmockInputContextTest is a test class for testing the behavior of SmockInputContext
"
Class {
	#name : #SmockInputContextTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - Core'
}

{ #category : #tests }
SmockInputContextTest >> testAddSameStrategy [

	| context strategy |
	context := SmockInputContext new.
	strategy := SmockTestInputStrategy new.
	context addStrategy: strategy.
	self assert: context haveStrategies.
	self assert: context numberOfStrategies equals: 1.
	
	context addStrategy: strategy.
	self assert: context haveStrategies.
	self assert: context numberOfStrategies equals: 1.
]

{ #category : #tests }
SmockInputContextTest >> testAddStrategy [

	| context |
	context := SmockInputContext new.
	context addStrategy: SmockTestInputStrategy new.
	self assert: context haveStrategies.
	self assert: context numberOfStrategies equals: 1.
	
	context addStrategy: SmockTestInputStrategy new.
	self assert: context haveStrategies.
	self assert: context numberOfStrategies equals: 2.
]

{ #category : #tests }
SmockInputContextTest >> testHandleEvent [

	| inputContext strategy event strategy2 |
	inputContext := SmockInputContext new.
	"test without strategies"
	event := SmockEventWrapper wrap: Announcement new.
	inputContext handleEvent: event.
	
	"test with a strategy which consumed the event"
	strategy := SmockTestInputStrategy new.
	inputContext addStrategy: strategy.
	event := SmockEventWrapper wrap: Announcement new.
	inputContext handleEvent: event.
	self assert: event isConsumed.
	self assert: strategy previousEvent equals: event.
	
	"Add another strategy to test if the event is not propagated ot this new strategy, because of the first strategy consume the event"
	strategy2 := SmockTestInputStrategy new.
	inputContext addStrategy: strategy2.
	event := SmockEventWrapper wrap: Announcement new.
	inputContext handleEvent: event.
	self assert: event isConsumed.
	self assert: strategy previousEvent equals: event.
	self assert: strategy2 previousEvent isNil.
]

{ #category : #tests }
SmockInputContextTest >> testInitialize [

	| context |
	context := SmockInputContext new.
	self assert: context controller isNil.
	self deny: context haveStrategies.
	self assert: context numberOfStrategies equals: 0.
]
