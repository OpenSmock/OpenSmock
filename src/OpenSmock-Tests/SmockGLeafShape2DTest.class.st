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

{ #category : #private }
SmockGLeafShape2DTest >> beDrawable [

	super beDrawable.

	gShape strokeColor: Color green.
	gShape fillColor: Color blue
]

{ #category : #tests }
SmockGLeafShape2DTest >> testDistanceTo [

	"Cannot determine distance cases, return max distance, each subclasses need to implement a specific distanceTo method to considere the shape type"
	self assert: (gShape distanceTo: nil) equals: SmallInteger maxVal.
	self assert: (gShape distanceTo: 0 @ 0) equals: SmallInteger maxVal.
	self assert: (gShape distanceTo: 1 @ 1) equals: SmallInteger maxVal.
	self assert: (gShape distanceTo: -1000 @ 1000) equals: SmallInteger maxVal.
]

{ #category : #'tests - effects' }
SmockGLeafShape2DTest >> testDuplicateEffect [

	gShape effect: (SmockDuplicateEffect new strokeColor: Color black; strokeWidth: 3).
]

{ #category : #tests }
SmockGLeafShape2DTest >> testFillColor [

	gShape fillColor: Color blue.
	self assert: gShape fillPaint equals: Color blue.
]

{ #category : #tests }
SmockGLeafShape2DTest >> testFillPaint [

	self assert: gShape fillPaint isNil
]

{ #category : #tests }
SmockGLeafShape2DTest >> testFillStyle [

	self assert: gShape fillStyle isNil.

	gShape fillStyle: Color blue asSmockFillStyle.
	self assert: gShape fillStyle equals: (Color blue asSmockFillStyle).
	
	gShape fillStyle: nil.
	self assert: gShape fillStyle isNil.
]

{ #category : #tests }
SmockGLeafShape2DTest >> testInitialize [

	super testInitialize.
	
	self deny: gShape isComposite.
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
SmockGLeafShape2DTest >> testStrokePaint [

	self assert: gShape strokePaint isNil
]

{ #category : #tests }
SmockGLeafShape2DTest >> testStrokeStyle [

	self assert: gShape strokeStyle isNil.

	gShape strokeStyle: Color blue asSmockStrokeStyle.
	self assert: gShape strokeStyle equals: (Color blue asSmockStrokeStyle).
	
	gShape strokeStyle: nil.
	self assert: gShape strokeStyle isNil.
]

{ #category : #tests }
SmockGLeafShape2DTest >> testStrokeWidth [

	self assert: gShape strokeWidth isNil.
	
	gShape strokeWidth: 20.
	self assert: gShape strokeWidth equals: 20.
]
