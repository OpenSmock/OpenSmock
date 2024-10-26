"
A SmockGText2DTest is a test class for testing the behavior of SmockGText2D
"
Class {
	#name : #SmockGText2DTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #tests }
SmockGText2DTest >> testCopy [ 
	
	| gShape gShapeCopy |
	gShape := SmockGText2D new.
	gShapeCopy := gShape copy.
	
	self assert: gShapeCopy equals: gShape.
	self assert: (gShapeCopy == gShape) equals: false.
]

{ #category : #tests }
SmockGText2DTest >> testInitialize [ 
	
	| gShape |
	gShape := SmockGText2D new.
	self assert: gShape text isNil.
	self assert: gShape smockFont isNil.
	self deny: gShape isDrawable.
	self assert: gShape isTranslatedByParent.
]

{ #category : #tests }
SmockGText2DTest >> testIsDrawable [
	
	| gShape |
	gShape := SmockGText2D new.
	gShape position: 0@0.
	gShape fillStyle: Color blue asSmockFillStyle.
	gShape text: 'this is a text'.
	gShape smockFont: (SmockFont named:'a font').
	self assert: gShape isDrawable.
]
