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

{ #category : #tests }
SmockGLeafShape2DTest >> testFillStyle [

	| gShape |	
	gShape := SmockGLeafShape2D new.
	gShape fillStyle: Color blue asSmockFillStyle.
	self assert: gShape fillStyle equals: (Color blue asSmockFillStyle).
	
]

{ #category : #tests }
SmockGLeafShape2DTest >> testInitialize [

	super initialize.
	
	self assert: gShape fillStyle isNil.
	self assert: gShape strokeStyle isNil.
	self assert: gShape isTransparent.
	self deny: gShape isComposite.
	self assert: gShape isLeaf.
	self deny: gShape isDrawable.
	self assert: gShape isTranslatedByParent.
]

{ #category : #tests }
SmockGLeafShape2DTest >> testIsDrawable [
	
	| gShape |
	gShape := SmockGLeafShape2D new.
	gShape fillStyle: Color blue asSmockFillStyle.
	self assert: gShape isDrawable.
	
	gShape fillStyle: nil.
	gShape strokeStyle: Color blue asSmockStrokeStyle.
	self assert: gShape isDrawable.
	
	gShape fillStyle: nil.
	gShape strokeStyle: nil.
	self deny: gShape isDrawable.
]

{ #category : #tests }
SmockGLeafShape2DTest >> testStrokeStyle [

	| gShape |
	gShape := SmockGLeafShape2D new.
	gShape strokeStyle: Color blue asSmockStrokeStyle.
	self assert: gShape strokeStyle equals: (Color blue asSmockStrokeStyle).
	
]
