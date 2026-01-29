"
A SmockGText2DTest is a test class for testing the behavior of SmockGText2D
"
Class {
	#name : #SmockGText2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGText2DTest >> beDrawable [

	super beDrawable.

	gShape position: 0 @ 0.
	gShape text: 'Test text'.
	gShape smockFont: (SmockFont named: 'a font')
]

{ #category : #running }
SmockGText2DTest >> gShapeClass [

	^ SmockGText2D 
]

{ #category : #tests }
SmockGText2DTest >> testSmockFont [

	| font |
	self assert: gShape smockFont isNil.

	font := SmockFont named: 'a font'.
	gShape smockFont: font.
	self assert: gShape smockFont equals: font
]

{ #category : #tests }
SmockGText2DTest >> testText [

	self assert: gShape text isNil.

	gShape text: 'Test text'.
	self assert: gShape text equals: 'Test text'
]
