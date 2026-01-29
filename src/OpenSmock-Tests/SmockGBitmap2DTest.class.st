"
A SmockGBitmap2DTest is a test class for testing the behavior of SmockGBitmap2D
"
Class {
	#name : #SmockGBitmap2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGBitmap2DTest >> beDrawable [

	super beDrawable.

	gShape position: 0 @ 0.
	gShape form: (self iconNamed: #pharo).
]

{ #category : #running }
SmockGBitmap2DTest >> gShapeClass [

	^ SmockGBitmap2D
]

{ #category : #tests }
SmockGBitmap2DTest >> testAlpha [

	self assert: gShape alpha equals: 1.

	gShape alpha: 0.5.
	self assert: gShape alpha equals: 0.5
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
SmockGBitmap2DTest >> testForm [

	self assert: gShape form isNil.

	gShape form: (self iconNamed: #pharo).
	self assert: gShape form isForm
]

{ #category : #tests }
SmockGBitmap2DTest >> testIsDrawable [

	super testIsDrawable.

	"test scale limit"
	gShape scale: 0.0001 asPoint.
	self deny: gShape isDrawable.

	gShape scale: 10000000 asPoint.
	self deny: gShape isDrawable
]

{ #category : #tests }
SmockGBitmap2DTest >> testMaxDrawableScale [

	self assert: gShape maxDrawableScale equals: 1000.

	gShape maxDrawableScale: 2000.
	self assert: gShape maxDrawableScale equals: 2000.

	gShape maxDrawableScale: nil.
	self assert: gShape maxDrawableScale equals: 1000
]

{ #category : #tests }
SmockGBitmap2DTest >> testMinDrawableScale [

	self assert: gShape minDrawableScale equals: 0.001.

	gShape minDrawableScale: 0.002.
	self assert: gShape minDrawableScale equals: 0.002.

	gShape minDrawableScale: nil.
	self assert: gShape minDrawableScale equals: 0.001
]

{ #category : #tests }
SmockGBitmap2DTest >> testRotation [

	self assert: gShape rotation equals: nil.

	gShape rotation: 90.
	self assert: gShape rotation equals: 90
]

{ #category : #tests }
SmockGBitmap2DTest >> testRotationInDegrees [

	self assert: gShape rotationInDegrees equals: nil.

	gShape rotationInDegrees: 90.
	self assert: gShape rotationInDegrees equals: 90
]

{ #category : #tests }
SmockGBitmap2DTest >> testScale [

	self assert: gShape scale equals: 1 asPoint.

	gShape scale: 0.5 asPoint.
	self assert: gShape scale equals: 0.5 asPoint
]
