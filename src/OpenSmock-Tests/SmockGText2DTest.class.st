"
A SmockGText2DTest is a test class for testing the behavior of SmockGText2D
"
Class {
	#name : #SmockGText2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #running }
SmockGText2DTest >> gShapeClass [

	^ SmockGText2D 
]

{ #category : #tests }
SmockGText2DTest >> testInitialize [ 
	
	super testInitialize.
	
	self assert: gShape text isNil.
	self assert: gShape smockFont isNil
]

{ #category : #tests }
SmockGText2DTest >> testIsDrawable [
	
	self deny: gShape isDrawable.
	
	gShape position: 0@0.
	gShape fillStyle: Color blue asSmockFillStyle.
	gShape text: 'this is a text'.
	gShape smockFont: (SmockFont named:'a font').
	self assert: gShape isDrawable.
]
