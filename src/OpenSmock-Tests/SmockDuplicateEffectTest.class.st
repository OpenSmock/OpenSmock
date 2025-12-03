Class {
	#name : #SmockDuplicateEffectTest,
	#superclass : #SmockPaintEffectTest,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #accessing }
SmockDuplicateEffectTest >> effectClass [

	^ SmockDuplicateEffect 
]

{ #category : #tests }
SmockDuplicateEffectTest >> testBeAbove [

	effect beAbove.
	self assert: effect isAbove.
]

{ #category : #tests }
SmockDuplicateEffectTest >> testBeBelow [

	effect beAbove.
	effect beBelow.
	self assert: effect isBelow.
]

{ #category : #tests }
SmockDuplicateEffectTest >> testCanBeAppliedTo [

	self assert: (effect canBeAppliedTo: SmockGLeafShape2D new).
	self deny: (effect canBeAppliedTo: SmockGCompositeShape2D new)
]

{ #category : #tests }
SmockDuplicateEffectTest >> testIsAbove [

	self deny: effect isAbove
]

{ #category : #tests }
SmockDuplicateEffectTest >> testIsBelow [

	self assert: effect isBelow
]

{ #category : #tests }
SmockDuplicateEffectTest >> testOrder [

	self assert: effect order equals: #below
]
