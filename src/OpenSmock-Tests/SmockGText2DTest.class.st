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
SmockGText2DTest >> testDistanceTo [ 

	self beDrawable.
	gShape position: 0@10; setLeft. "text bounds is ~ 0@3 corner: 54@10"
	
	"need to display the shape before testing because the bounds is computed in Alexandrie, here cannot display, setup manualy the bounds"
	gShape bounds: (0@3 corner: 54@10).
	
	"test outside the text"
	self assert: gShape isDrawable.
	self assert: (gShape distanceTo: 0@0) equals: 3.
	
	"test inside the text"
	self assert: (gShape distanceTo: (0@3)) equals: 0.
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
