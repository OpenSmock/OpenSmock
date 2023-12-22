"
A SmockGLeafShape2DTest is a test class for testing the behavior of SmockGLeafShape2D
"
Class {
	#name : #SmockGLeafShape2DTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #tests }
SmockGLeafShape2DTest >> testFillStyle [

	| gShape |	
	gShape := SmockGLeafShape2D new.
	gShape fillStyle: Color blue asSmockFillStyle.
	self assert: gShape fillStyle equals: (Color blue asSmockFillStyle).
	
]

{ #category : #tests }
SmockGLeafShape2DTest >> testInitialize [

	| gShape |
	gShape := SmockGLeafShape2D new.
	self assert: gShape fillStyle isNil.
	self assert: gShape strokeStyle isNil.
	self assert: gShape isTransparent.
	self deny: gShape isComposite.
	self deny: gShape isDrawable.
]

{ #category : #tests }
SmockGLeafShape2DTest >> testStrokeStyle [

	| gShape |
	gShape := SmockGLeafShape2D new.
	gShape strokeStyle: Color blue asSmockStrokeStyle.
	self assert: gShape strokeStyle equals: (Color blue asSmockStrokeStyle).
	
]
