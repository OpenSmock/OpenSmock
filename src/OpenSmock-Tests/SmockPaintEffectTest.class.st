"
A SmockPaintEffectTest is a test class for testing the behavior of SmockPaintEffect
"
Class {
	#name : #SmockPaintEffectTest,
	#superclass : #TestCase,
	#instVars : [
		'effect'
	],
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #testing }
SmockPaintEffectTest class >> isAbstract [ 

	^ self == SmockPaintEffectTest 
]

{ #category : #accessing }
SmockPaintEffectTest >> effectClass [

	self subclassResponsibility 
]

{ #category : #running }
SmockPaintEffectTest >> setUp [

	super setUp.

	effect := self effectClass new
]

{ #category : #tests }
SmockPaintEffectTest >> testCanBeAppliedTo [

	self subclassResponsibility 
]

{ #category : #tests }
SmockPaintEffectTest >> testComputeBounds [

	self assert: (effect computeBounds: (0@0 extent: 10@10)) equals: (0@0 extent: 10@10)
]
