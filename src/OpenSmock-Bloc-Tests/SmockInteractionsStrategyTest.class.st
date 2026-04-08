"
An AbstractGeoViewInteractionsStrategyTest is a test class for testing the behavior of AbstractGeoViewInteractionsStrategy
"
Class {
	#name : #SmockInteractionsStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'strategy'
	],
	#category : #'OpenSmock-Bloc-Tests-Events'
}

{ #category : #testing }
SmockInteractionsStrategyTest class >> isAbstract [ 

	^ self == SmockInteractionsStrategyTest 
]

{ #category : #running }
SmockInteractionsStrategyTest >> setUp [

	super setUp.

	strategy := self strategyClass new
]

{ #category : #running }
SmockInteractionsStrategyTest >> strategyClass [

	self subclassResponsibility 
]

{ #category : #tests }
SmockInteractionsStrategyTest >> testAllowMultipleSelection [

	self assert: strategy allowMultipleSelection.

	strategy allowMultipleSelection: false.
	self deny: strategy allowMultipleSelection.

	strategy allowMultipleSelection: true.
	self assert: strategy allowMultipleSelection
]

{ #category : #tests }
SmockInteractionsStrategyTest >> testAllowSelection [

	self assert: strategy allowSelection.

	strategy allowSelection: false.
	self deny: strategy allowSelection.

	strategy allowSelection: true.
	self assert: strategy allowSelection
]

{ #category : #tests }
SmockInteractionsStrategyTest >> testPickingRadius [

	self assert: strategy pickingRadius equals: strategy class defaultPickingRadius.

	strategy pickingRadius: 10.
	self assert: strategy pickingRadius equals: 10.

	strategy pickingRadius: nil.
	self assert: strategy pickingRadius equals: strategy class defaultPickingRadius.
]

{ #category : #tests }
SmockInteractionsStrategyTest >> testPulseDuration [

	self assert: (strategy pulseDuration isKindOf: Duration)
]

{ #category : #tests }
SmockInteractionsStrategyTest >> testSelectionFilterBlock [

	self assert: strategy selectionFilterBlock isNil.

	strategy selectionFilterBlock: [ :e | true ].
	self assert: strategy selectionFilterBlock notNil.

	strategy selectionFilterBlock: nil.
	self assert: strategy selectionFilterBlock isNil.
]

{ #category : #tests }
SmockInteractionsStrategyTest >> testTarget [

	| target |
	target := BlElement new.

	self assert: strategy target isNil.

	strategy target: target.
	self assert: strategy target notNil.
	
	strategy target: nil.
	self assert: strategy target isNil.

]
