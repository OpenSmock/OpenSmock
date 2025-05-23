"
A SmockGCompositeShape2DTest is a test class for testing the behavior of SmockGCompositeShape2D
"
Class {
	#name : #SmockGCompositeShape2DTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

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

	| gShape |
	gShape := SmockGCompositeShape2D new.
	self assert: gShape isEmpty.
	self deny: gShape isNotEmpty.
	self deny: gShape hasChildren.
	self assert: gShape numberOfChildren equals: 0.
	self assert: gShape isComposite.
	self deny: gShape isLeaf.
	self deny: gShape isDrawable.
	self assert: gShape isTranslatedByParent.
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testIsDrawable [
	
	| gShape |
	gShape := SmockGCompositeShape2D new.
	gShape addChild: SmockGShape2D new.
	self assert: gShape isDrawable.
	
	gShape removeChildren.
	self deny: gShape isDrawable.
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
