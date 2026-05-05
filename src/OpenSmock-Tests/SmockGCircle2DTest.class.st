"
A SmockGCircle2DTest is a test class for testing the behavior of SmockGCircle2D
"
Class {
	#name : #SmockGCircle2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGCircle2DTest >> beDrawable [

	super beDrawable.

	gShape position: 0 @ 0.
	gShape radius: 10
]

{ #category : #running }
SmockGCircle2DTest >> gShapeClass [

	^ SmockGCircle2D 
]

{ #category : #tests }
SmockGCircle2DTest >> testDistanceTo [

	"without position or radius : cannot determine distance, return max distance"
	self assert: (gShape distanceTo: 0 @ 0) equals: SmallInteger maxVal.

	self beDrawable.

	self assert: (gShape distanceTo: 0 @ 0) equals: 0.
	self assert: (gShape distanceTo: 1 @ 0) equals: 0.
	self assert: (gShape distanceTo: 0 @ 5) equals: 0.
	self assert: (gShape distanceTo: 10 @ 10) equals: ((200 sqrt) - 10).
	
]

{ #category : #tests }
SmockGCircle2DTest >> testIsDrawable [

	super testIsDrawable.
	
	gShape radius: 0.
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
