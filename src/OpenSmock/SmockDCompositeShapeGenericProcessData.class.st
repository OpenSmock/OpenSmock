Class {
	#name : #SmockDCompositeShapeGenericProcessData,
	#superclass : #SmockDShapeGenericProcessData,
	#traits : 'TSmockDCompositeShapeProcessData',
	#classTraits : 'TSmockDCompositeShapeProcessData classTrait',
	#category : #'OpenSmock-DShape'
}

{ #category : #processing }
SmockDCompositeShapeGenericProcessData >> processCreatedData: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext [

	| gCompositeShape2D |
	gCompositeShape2D := aGCompositeShape2D ifNil:[ SmockGCompositeShape2D new ].

	super processCreatedData: aKey incoming: aDCompositeShape with: gCompositeShape2D context: aContext.
	self processCreatedDComposite: aKey incoming: aDCompositeShape with: gCompositeShape2D context: aContext.
	self processUpdatedData: aKey incoming: aDCompositeShape with: gCompositeShape2D context: aContext.
	
	^ gCompositeShape2D
]

{ #category : #processing }
SmockDCompositeShapeGenericProcessData >> processRecycledData: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext [
	"clean the GShape"

	super processRecycledData: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext.
	self processRecycledDComposite: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext.

	^ aGCompositeShape2D
]

{ #category : #processing }
SmockDCompositeShapeGenericProcessData >> processUpdatedData: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext [

	super processUpdatedData: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext.
	self processUpdatedDComposite: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext.
	
	^ aGCompositeShape2D
]
