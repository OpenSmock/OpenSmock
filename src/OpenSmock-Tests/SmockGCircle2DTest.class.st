"
A SmockGCircle2DTest is a test class for testing the behavior of SmockGCircle2D
"
Class {
	#name : #SmockGCircle2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #running }
SmockGCircle2DTest >> gShapeClass [

	^ SmockGCircle2D 
]

{ #category : #running }
SmockGCircle2DTest >> testIsDrawable [

	self deny: gShape isDrawable.

	gShape position: 0@0.
	gShape fillStyle: Color red asSmockFillStyle.
	self deny: gShape isDrawable.
	
	gShape radius: 10.
	self assert: gShape isDrawable.
]

{ #category : #running }
SmockGCircle2DTest >> testRadius [

	self assert: gShape radius isNil.

	gShape radius: 50.
	self assert: gShape radius equals: 50
]
