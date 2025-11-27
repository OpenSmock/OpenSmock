"
This process data is to use as an example and for testing
"
Class {
	#name : #SmockDShapeGenericProcessData,
	#superclass : #SmockProcessData,
	#traits : 'TSmockDShapeProcessData',
	#classTraits : 'TSmockDShapeProcessData classTrait',
	#category : #'OpenSmock-DShape'
}

{ #category : #processing }
SmockDShapeGenericProcessData >> processCreatedData: aKey incoming: aDShape with: aGShape2D context: aContext [

	| gShape2D |
	gShape2D := aGShape2D ifNil:[ SmockGShape2D new ].

	self processCreatedDShape: aKey incoming: aDShape with: gShape2D context: aContext.
	
	^ gShape2D
]

{ #category : #processing }
SmockDShapeGenericProcessData >> processDeletedData: aKey incoming: aDShape with: aGShape2D context: aContext [

	^ aGShape2D
]

{ #category : #processing }
SmockDShapeGenericProcessData >> processRecycledData: aKey incoming: aDShape with: aGShape2D context: aContext [

	self processRecycledDShape: aKey incoming: aDShape with: aGShape2D context: aContext.

	^ aGShape2D
]

{ #category : #processing }
SmockDShapeGenericProcessData >> processStateChanged: aKey state: aState value: aValueOrNil with: aProducedData context: aContext [

	"do nothing"
	
	^ aProducedData
]

{ #category : #processing }
SmockDShapeGenericProcessData >> processUpdatedData: aKey incoming: aDShape with: aGShape2D context: aContext [

	self processUpdatedDShape: aKey incoming: aDShape with: aGShape2D context: aContext.

	^ aGShape2D
]
