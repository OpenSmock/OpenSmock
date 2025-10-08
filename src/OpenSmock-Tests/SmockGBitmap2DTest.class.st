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
SmockGBitmap2DTest >> testInitialize [ 

	super testInitialize.

	self assert: gShape form isNil.
	self assert: gShape scale equals: 1@1.
	self assert: gShape rotation equals: nil.
	self assert: gShape alpha equals: 1.
]
