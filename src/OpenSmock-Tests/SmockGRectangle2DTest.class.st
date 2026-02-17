"
A SmockGCircle2DTest is a test class for testing the behavior of SmockGCircle2D
"
Class {
	#name : #SmockGRectangle2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGRectangle2DTest >> beDrawable [

	super beDrawable.

	gShape position: 0 @ 0.
	gShape length1: 10.
	gShape length2: 20
]

{ #category : #running }
SmockGRectangle2DTest >> gShapeClass [

	^ SmockGRectangle2D 
]

{ #category : #running }
SmockGRectangle2DTest >> testLength1 [

	self assert: gShape length1 isNil.

	gShape length1: 50.
	self assert: gShape length1 equals: 50
]

{ #category : #running }
SmockGRectangle2DTest >> testLength2 [

	self assert: gShape length2 isNil.

	gShape length2: 50.
	self assert: gShape length2 equals: 50
]
