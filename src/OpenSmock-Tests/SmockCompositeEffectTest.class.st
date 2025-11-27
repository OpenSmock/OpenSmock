Class {
	#name : #SmockCompositeEffectTest,
	#superclass : #SmockPaintEffectTest,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #accessing }
SmockCompositeEffectTest >> effectClass [

	^ SmockCompositeEffect 
]

{ #category : #tests }
SmockCompositeEffectTest >> testAddAll [

	effect addAll: {
			SmockDuplicateEffect new.
			SmockDuplicateEffect new }.
	
	self assert: effect notEmpty.
	self deny: effect isEmpty.
]

{ #category : #tests }
SmockCompositeEffectTest >> testCanBeAppliedTo [

	self assert: (effect canBeAppliedTo: SmockGLeafShape2D new).
	self assert: (effect canBeAppliedTo: SmockGCompositeShape2D new)
]

{ #category : #tests }
SmockCompositeEffectTest >> testEffects [

	self assert: effect effects isEmpty
]

{ #category : #tests }
SmockCompositeEffectTest >> testIsEmpty [ 

	self assert: effect isEmpty.
	
	
]

{ #category : #tests }
SmockCompositeEffectTest >> testNotEmpty [ 

	self deny: effect notEmpty.
	
	
]

{ #category : #tests }
SmockCompositeEffectTest >> testRemoveAll [

	effect addAll: {
			SmockDuplicateEffect new.
			SmockDuplicateEffect new }.
	
	effect removeAll.
	self deny: effect notEmpty.
	self assert: effect isEmpty.
]
