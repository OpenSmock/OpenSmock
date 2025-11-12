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

{ #category : #testing }
SmockGShape2DTest class >> isAbstract [ 

	^ self == SmockGShape2DTest 
]

{ #category : #running }
SmockGShape2DTest >> gShapeClass [

	self subclassResponsibility 
]

{ #category : #running }
SmockGShape2DTest >> setUp [

	super setUp.

	gShape := self gShapeClass id: #testGShape
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
	self deny: gShapeCopy identicalTo: gShape
]

{ #category : #tests }
SmockGShape2DTest >> testDisplayMask [

	self assert: gShape displayMask isNil.

	gShape displayMask: 0123456.
	self assert: gShape displayMask equals: 0123456
]

{ #category : #tests }
SmockGShape2DTest >> testDistanceTo [


	self subclassResponsibility 
]

{ #category : #tests }
SmockGShape2DTest >> testDistanceToSelect [

	self assert: (gShape distanceTo: 0 asPoint select: nil) equals: (SmallInteger maxVal).
	self assert: (gShape distanceTo: 0 asPoint select: [ :e | e isDrawable ]) equals: (SmallInteger maxVal).
]

{ #category : #tests }
SmockGShape2DTest >> testInitialize [

	self assert: gShape id equals: #testGShape.
	self assert: gShape position equals: nil.
]

{ #category : #tests }
SmockGShape2DTest >> testIsComposite [

	self deny: gShape isComposite
]

{ #category : #tests }
SmockGShape2DTest >> testIsDrawable [ 

	self assert: gShape isDrawable 
]

{ #category : #tests }
SmockGShape2DTest >> testIsLeaf [

	self assert: gShape isLeaf
]

{ #category : #tests }
SmockGShape2DTest >> testIsTranslatedByParent [

	self assert: gShape isTranslatedByParent
]

{ #category : #tests }
SmockGShape2DTest >> testIsVisible [

	self assert: gShape isVisible
]

{ #category : #tests }
SmockGShape2DTest >> testZIndex [

	self assert: gShape zIndex equals: 0.

	gShape zIndex: 10.
	self assert: gShape zIndex equals: 10.

	gShape zIndex: nil.
	self assert: gShape zIndex equals: 0
]
