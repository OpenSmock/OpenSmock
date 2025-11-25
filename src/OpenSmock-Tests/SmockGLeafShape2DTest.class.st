"
A SmockGLeafShape2DTest is a test class for testing the behavior of SmockGLeafShape2D
"
Class {
	#name : #SmockGLeafShape2DTest,
	#superclass : #SmockGShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #testing }
SmockGLeafShape2DTest class >> isAbstract [ 

	^ self == SmockGLeafShape2DTest 
]

{ #category : #tests }
SmockGLeafShape2DTest >> testDistanceTo [

	"Cannot determine distance cases, return max distance, each subclasses need to implement a specific distanceTo method to considere the shape type"
	self assert: (gShape distanceTo: nil) equals: SmallInteger maxVal.
	self assert: (gShape distanceTo: 0 @ 0) equals: SmallInteger maxVal.
	self assert: (gShape distanceTo: 1 @ 1) equals: SmallInteger maxVal.
	self assert: (gShape distanceTo: -1000 @ 1000) equals: SmallInteger maxVal.
]

{ #category : #tests }
SmockGLeafShape2DTest >> testFillStyle [

	gShape fillStyle: Color blue asSmockFillStyle.
	self assert: gShape fillStyle equals: (Color blue asSmockFillStyle).
	
]

{ #category : #tests }
SmockGLeafShape2DTest >> testInitialize [

	super initialize.
	
	self assert: gShape fillStyle isNil.
	self assert: gShape strokeStyle isNil.
	self deny: gShape isComposite.
	self assert: gShape isLeaf.
	self assert: gShape isTranslatedByParent.
]

{ #category : #tests }
SmockGLeafShape2DTest >> testIsTransparent [

	self assert: gShape isTransparent.

	gShape strokeStyle: Color blue asSmockStrokeStyle.
	gShape fillStyle: Color green asSmockFillStyle.
	self deny: gShape isTransparent.
	
	gShape strokeStyle: nil.
	gShape fillStyle: Color green asSmockFillStyle.
	self deny: gShape isTransparent.

	gShape strokeStyle: Color blue asSmockStrokeStyle.
	gShape fillStyle: nil.
	self deny: gShape isTransparent.

	gShape strokeStyle: nil.
	gShape fillStyle: nil.
	self assert: gShape isTransparent.
	
	gShape strokeStyle: (Color blue alpha: 0) asSmockStrokeStyle.
	gShape fillStyle: (Color green alpha: 0) asSmockFillStyle.
	self assert: gShape isTransparent.
]

{ #category : #tests }
SmockGLeafShape2DTest >> testStrokeStyle [

	gShape strokeStyle: Color blue asSmockStrokeStyle.
	self assert: gShape strokeStyle equals: (Color blue asSmockStrokeStyle).
	
]
