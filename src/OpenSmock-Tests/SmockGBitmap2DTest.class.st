"
A SmockGBitmap2DTest is a test class for testing the behavior of SmockGBitmap2D
"
Class {
	#name : #SmockGBitmap2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #tests }
SmockGBitmap2DTest >> gShapeClass [

	^ SmockGBitmap2D
]

{ #category : #tests }
SmockGBitmap2DTest >> testDistanceTo [

	"without position : cannot determine distance, return max distance"
	self assert: (gShape distanceTo: 0 @ 0) equals: SmallInteger maxVal.

	"without form : cannot determine distance, return max distance"
	gShape position: 1 @ 1.
	self assert: (gShape distanceTo: 0 @ 0) equals: SmallInteger maxVal.

	gShape form: (self iconNamed: #smallInfo).
	gShape position: 0 @ 0.
	
	self assert: (gShape distanceTo: 0 @ 0) equals: 0.
	self assert: (gShape distanceTo: 1 @ 1) equals: 0.
	self assert: (gShape distanceTo: -1 @ -1) equals: 0.
	self assert: (gShape distanceTo: 8 @ 8) equals: 0.
	self assert: (gShape distanceTo: -8 @ -8) equals: 0.
	self assert: (gShape distanceTo: 16 @ 16) rounded equals: 11.
	self assert: (gShape distanceTo: -16 @ -16) rounded equals: 11.
]

{ #category : #tests }
SmockGBitmap2DTest >> testDistanceToWithScale [

	gShape form: (self iconNamed: #smallInfo).
	gShape position: 0 @ 0.
	gShape scale: 0.5 asPoint.
	
	self assert: (gShape distanceTo: 0 @ 0) equals: 0.
	self assert: (gShape distanceTo: 1 @ 1) equals: 0.
	self assert: (gShape distanceTo: -1 @ -1) equals: 0.
	self assert: (gShape distanceTo: 8 @ 8) rounded equals: 6.
	self assert: (gShape distanceTo: -8 @ -8) rounded equals: 6.
	self assert: (gShape distanceTo: 16 @ 16) rounded equals: 17.
	self assert: (gShape distanceTo: -16 @ -16) rounded equals: 17.
]

{ #category : #tests }
SmockGBitmap2DTest >> testInitialize [ 

	super testInitialize.

	self assert: gShape form isNil.
	self assert: gShape scale equals: 1@1.
	self assert: gShape rotation equals: nil.
	self assert: gShape alpha equals: 1.
]
