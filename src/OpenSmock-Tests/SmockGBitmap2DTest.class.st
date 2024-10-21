"
A SmockGBitmap2DTest is a test class for testing the behavior of SmockGBitmap2D
"
Class {
	#name : #SmockGBitmap2DTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #tests }
SmockGBitmap2DTest >> testInitialize [ 
	
	| gShape |
	gShape := SmockGBitmap2D new.
	self assert: gShape form isNil.
	self assert: gShape scale equals: 1@1.
	self assert: gShape rotation equals: 0.
	self assert: gShape alpha equals: 1.
]
