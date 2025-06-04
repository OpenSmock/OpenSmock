"
A SmockGShape2DTest is a test class for testing the behavior of SmockGShape2D
"
Class {
	#name : #SmockGShape2DTest,
	#superclass : #TestCase,
	#instVars : [
		'gShape'
	],
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #running }
SmockGShape2DTest >> setUp [

	super setUp.

	gShape := SmockGShape2D id: #testGShape
]

{ #category : #tests }
SmockGShape2DTest >> testConstructor [

	self assert: gShape id equals: #testGShape
]

{ #category : #tests }
SmockGShape2DTest >> testCopy [

	| gShapeCopy |
	gShapeCopy := gShape copy.

	self assert: gShapeCopy equals: gShape.
	self assert: gShapeCopy == gShape equals: false
]

{ #category : #tests }
SmockGShape2DTest >> testDisplayMask [

	self assert: gShape displayMask isNil.

	gShape displayMask: 0123456.
	self assert: gShape displayMask equals: 0123456
]

{ #category : #test }
SmockGShape2DTest >> testDistanceTo [

	self assert: (gShape distanceTo: 0 @ 0) equals: nil.

	gShape position: 1 @ 1.
	self assert: (gShape distanceTo: 1 @ 1) equals: 0.

	gShape position: 0 @ 0.
	self assert: (gShape distanceTo: 0 @ 1) equals: 1.
	self assert: (gShape distanceTo: 1 @ 0) equals: 1
]

{ #category : #tests }
SmockGShape2DTest >> testInitialize [

	self assert: gShape id equals: #testGShape.
	self assert: gShape position equals: nil.
	self assert: gShape isVisible.
	self deny: gShape isComposite.
	self deny: gShape isLeaf.
	self assert: gShape isDrawable.
	self assert: gShape isTranslatedByParent
]

{ #category : #tests }
SmockGShape2DTest >> testIsDrawable [

	gShape isVisible: false.
	self deny: gShape isDrawable
]

{ #category : #tests }
SmockGShape2DTest >> testIsTranslatedByParent [

	gShape isTranslatedByParent: false.
	self deny: gShape isTranslatedByParent
]
