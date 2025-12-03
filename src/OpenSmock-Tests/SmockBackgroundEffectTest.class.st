"
A SmockBackgroundEffectTest is a test class for testing the behavior of SmockBackgroundEffect
"
Class {
	#name : #SmockBackgroundEffectTest,
	#superclass : #SmockPaintEffectTest,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #accessing }
SmockBackgroundEffectTest >> effectClass [

	^ SmockBackgroundEffect 
]

{ #category : #tests }
SmockBackgroundEffectTest >> testCanBeAppliedTo [

	self assert: (effect canBeAppliedTo: SmockGLeafShape2D new).
	self deny: (effect canBeAppliedTo: SmockGCompositeShape2D new)
]

{ #category : #tests }
SmockBackgroundEffectTest >> testPadding [

	| padding |
	padding := effect padding.
	self assert: padding notNil.
	
	"change value"
	effect padding: (SmockInsets all: 2).
	self assert: padding ~= effect padding.
	
	"reset"
	effect padding: nil.
	self assert: padding notNil.
]
