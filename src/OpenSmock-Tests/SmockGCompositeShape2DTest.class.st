"
A SmockGCompositeShape2DTest is a test class for testing the behavior of SmockGCompositeShape2D
"
Class {
	#name : #SmockGCompositeShape2DTest,
	#superclass : #SmockGShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #running }
SmockGCompositeShape2DTest >> gShapeClass [

	^ SmockGCompositeShape2D 
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testAddChild [

	| gShape |
	gShape := SmockGCompositeShape2D new.
	gShape addChild: SmockGShape2D new.
	self assert: gShape numberOfChildren equals: 1.
	self deny: gShape isEmpty.
	self assert: gShape isNotEmpty.
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testDistanceTo [

	"Cannot determine distance cases, return max distance"
	self assert: (gShape distanceTo: 0 @ 0) equals: SmallInteger maxVal.

	gShape position: 0 @ 0.
	self assert: (gShape distanceTo: 0 @ 0) equals: SmallInteger maxVal.

	gShape position: 1 @ 1.
	self assert: (gShape distanceTo: 1 @ 1) equals: SmallInteger maxVal.

	"Add child to considere a distance value"
	gShape position: 0 @ 0.
	gShape addChild: (SmockGBitmap2D new form: (self iconNamed: #smallInfo); position: 0 asPoint).
	
	"See GBitmap2D distanceTo test: do return same values"
	self assert: (gShape distanceTo: 0 @ 0) equals: 0.
	self assert: (gShape distanceTo: 1 @ 1) equals: 0.
	self assert: (gShape distanceTo: -1 @ -1) equals: 0.
	self assert: (gShape distanceTo: 8 @ 8) equals: 0.
	self assert: (gShape distanceTo: -8 @ -8) equals: 0.
	self assert: (gShape distanceTo: 16 @ 16) rounded equals: 11.
	self assert: (gShape distanceTo: -16 @ -16) rounded equals: 11.
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testGetChild [

	| gCompositeShape gLeafShape gLeafShape2 |
	gCompositeShape := SmockGCompositeShape2D new.
	gLeafShape := SmockGLeafShape2D id: #testLeafShape.
	gLeafShape2 := SmockGLeafShape2D id: #testLeafShape2.

	self assert: (gCompositeShape getChild: nil) equals: nil.
	self assert: (gCompositeShape getChild: #notExistingKey) equals: nil.

	gCompositeShape addChild: gLeafShape.
	self assert: (gCompositeShape getChild: nil) equals: nil.
	self assert: (gCompositeShape getChild: #notExistingKey) equals: nil.
	self assert: (gCompositeShape getChild: #testLeafShape) identicalTo: gLeafShape.

	gCompositeShape addChild: gLeafShape2.
	self assert: (gCompositeShape getChild: nil) equals: nil.
	self assert: (gCompositeShape getChild: #notExistingKey) equals: nil.
	self assert: (gCompositeShape getChild: #testLeafShape) identicalTo: gLeafShape.
	self assert: (gCompositeShape getChild: #testLeafShape2) identicalTo: gLeafShape2
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testIncludesChild [

	| gShape child |
	gShape := SmockGCompositeShape2D new.
	child := SmockGShape2D new.
	self deny: (gShape includesChild: child).
	
	gShape addChild: child.
	self assert: (gShape includesChild: child).
	
	gShape removeChild: child.
	self deny: (gShape includesChild: child).
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testInitialize [
	
	super testInitialize.

	self assert: gShape isEmpty.
	self deny: gShape isNotEmpty.
	self deny: gShape hasChildren.
	self assert: gShape numberOfChildren equals: 0
]

{ #category : #test }
SmockGCompositeShape2DTest >> testIsComposite [

	self assert: gShape isComposite
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testIsDrawable [
	
	super testIsDrawable.
	
	gShape addChild: SmockGShape2D new.
	self assert: gShape isDrawable.
	
	gShape removeChildren.
	self deny: gShape isDrawable.
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testIsLeaf [

	self deny: gShape isLeaf
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testRemoveChild [

	| gShape child |
	gShape := SmockGCompositeShape2D new.
	child := SmockGShape2D new.
	gShape addChild: child.
	self assert: (gShape includesChild: child).
	
	gShape removeChild: child.
	self deny: (gShape includesChild: child).
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testRemoveChildren [

	| gCompositeShape |
	gCompositeShape := SmockGCompositeShape2D new.
	gCompositeShape addChild: (SmockGLeafShape2D id: #testLeafShape).
	gCompositeShape addChild: (SmockGLeafShape2D id: #testLeafShape2).
	self deny: gCompositeShape isEmpty.
	
	gCompositeShape removeChildren.
	self assert: gCompositeShape isEmpty.
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testSortChildrenBy [

	| gCompositeShape |
	gCompositeShape := SmockGCompositeShape2D new.
	gCompositeShape addChild: (SmockGLeafShape2D id: 1).
	gCompositeShape addChild: (SmockGLeafShape2D id: 2).
	self assert: gCompositeShape gShapeList first id equals: 1.
	self assert: gCompositeShape gShapeList last id equals: 2.
		
	gCompositeShape sortChildrenBy: [ :a :b | a id > b id ].
	self assert: gCompositeShape gShapeList first id equals: 2.
	self assert: gCompositeShape gShapeList last id equals: 1.
]
