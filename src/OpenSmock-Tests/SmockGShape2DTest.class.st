"
A SmockGShape2DTest is a test class for testing the behavior of SmockGShape2D
"
Class {
	#name : #SmockGShape2DTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #tests }
SmockGShape2DTest >> testConstructor [ 
	
	| gShape |
	gShape := SmockGShape2D id: #testGShape.
	self assert: gShape id equals: #testGShape.
]

{ #category : #tests }
SmockGShape2DTest >> testCopy [ 
	
	| gShape gShapeCopy |
	gShape := SmockGShape2D new.
	gShapeCopy := gShape copy.
	
	self assert: gShapeCopy equals: gShape.
	self assert: (gShapeCopy == gShape) equals: false.
]

{ #category : #test }
SmockGShape2DTest >> testDistanceTo [

	| gShape |
	gShape := SmockGShape2D new.
	self assert: (gShape distanceTo: 0@0) equals: nil.
	
	gShape position: 1@1.
	self assert: (gShape distanceTo: 1@1) equals: 0.
	
	gShape position: 0@0.
	self assert: (gShape distanceTo: 0@1) equals: 1.
	self assert: (gShape distanceTo: 1@0) equals: 1.
]

{ #category : #tests }
SmockGShape2DTest >> testInitialize [ 
	
	| gShape |
	gShape := SmockGShape2D new.
	self assert: gShape id equals: nil.
	self assert: gShape position equals: nil.
	self assert: gShape isVisible.
	self deny: gShape isBuffered.
	self deny: gShape isComposite.
	self deny: gShape isLeaf.
	self assert: gShape isDrawable.
	self assert: gShape isTranslatedByParent.
]

{ #category : #tests }
SmockGShape2DTest >> testIsDrawable [
	
	| gShape |
	gShape := SmockGShape2D new.
	gShape isVisible: false.
	self deny: gShape isDrawable.
]

{ #category : #tests }
SmockGShape2DTest >> testIsTranslatedByParent [
	
	| gShape |
	gShape := SmockGShape2D new.
	gShape isTranslatedByParent: false.
	self deny: gShape isTranslatedByParent.
]
