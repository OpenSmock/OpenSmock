Class {
	#name : #SmockDCompositeShapeTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDCompositeShapeTest >> testAddUpdateAndDeleteChildren [

	| dCompositeShape dLeafShape |
	dCompositeShape := SmockDCompositeShape new.
	dLeafShape := SmockDLeafShape key: #testLeafShape.

	dCompositeShape addChild: dLeafShape.
	self assert: dCompositeShape dShapeList size equals: 1.
	self assert: dCompositeShape dShapeList first identicalTo: dLeafShape.
	self assert: dCompositeShape toUpdateDShapeList isEmpty.
	self assert: dCompositeShape toDeleteDShapeList isEmpty.
	self deny: dCompositeShape hasDirtyChildren.

	dCompositeShape updateChild: dLeafShape.
	self assert: dCompositeShape dShapeList size equals: 1.
	self assert: dCompositeShape dShapeList first identicalTo: dLeafShape.
	self assert: dCompositeShape toUpdateDShapeList size equals: 1.
	self assert: dCompositeShape toUpdateDShapeList first identicalTo: dLeafShape.
	self assert: dCompositeShape toDeleteDShapeList isEmpty.
	self assert: dCompositeShape hasDirtyChildren.

	dCompositeShape clearToUpdateDShapeList.
	self assert: dCompositeShape dShapeList size equals: 1.
	self assert: dCompositeShape dShapeList first identicalTo: dLeafShape.
	self assert: dCompositeShape toUpdateDShapeList isEmpty.
	self assert: dCompositeShape toDeleteDShapeList isEmpty.
	self deny: dCompositeShape hasDirtyChildren.

	dCompositeShape removeChild: dLeafShape.
	self assert: dCompositeShape dShapeList size equals: 0.
	self assert: dCompositeShape toDeleteDShapeList size equals: 1.
	self assert: dCompositeShape toDeleteDShapeList first identicalTo: dLeafShape.
	self assert: dCompositeShape hasDirtyChildren.

	dCompositeShape clearToDeleteDShapeList.
	self assert: dCompositeShape toDeleteDShapeList size equals: 0.
	self deny: dCompositeShape hasDirtyChildren.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDCompositeShape new.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false. 
]

{ #category : #tests }
SmockDCompositeShapeTest >> testGetChild [

	| dCompositeShape dLeafShape dLeafShape2 |
	dCompositeShape := SmockDCompositeShape new.
	dLeafShape := SmockDLeafShape key: #testLeafShape.
	dLeafShape2 := SmockDLeafShape key: #testLeafShape2.

	self assert: (dCompositeShape getChild: nil) equals: nil.
	self assert: (dCompositeShape getChild: #notExistingKey) equals: nil.

	dCompositeShape addChild: dLeafShape.
	self assert: (dCompositeShape getChild: nil) equals: nil.
	self assert: (dCompositeShape getChild: #notExistingKey) equals: nil.
	self assert: (dCompositeShape getChild: #testLeafShape) identicalTo: dLeafShape.

	dCompositeShape addChild: dLeafShape2.
	self assert: (dCompositeShape getChild: nil) equals: nil.
	self assert: (dCompositeShape getChild: #notExistingKey) equals: nil.
	self assert: (dCompositeShape getChild: #testLeafShape) identicalTo: dLeafShape.
	self assert: (dCompositeShape getChild: #testLeafShape2) identicalTo: dLeafShape2
]

{ #category : #tests }
SmockDCompositeShapeTest >> testHasDrawModeUserChildren [

	| dCompositeShape child1 |
	dCompositeShape := SmockDCompositeShape new.
	child1 := SmockDLeafShape key: #testLeafShape.
	
	dCompositeShape addChild: child1.
	self assert: dCompositeShape hasDrawModeUserChildren.

	child1 setDrawModeDevice.
	dCompositeShape updateChild: child1.
	self deny: dCompositeShape hasDrawModeUserChildren.
	
	child1 setDrawModeUser.
	dCompositeShape updateChild: child1.
	self assert: dCompositeShape hasDrawModeUserChildren.
	
	dCompositeShape removeChild: child1.
	self deny: dCompositeShape hasDrawModeUserChildren.
	
	dCompositeShape removeChildren.
	self deny: dCompositeShape hasDrawModeUserChildren.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testHasDrawModeUserChildren2 [

	| dCompositeShape child1 |
	dCompositeShape := SmockDCompositeShape new.
	child1 := SmockDLeafShape key: #testLeafShape.
	
	dCompositeShape addChild: child1.
	dCompositeShape removeChildren.
	self deny: dCompositeShape hasDrawModeUserChildren.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDCompositeShape new.
	self deny: dShape isLeaf.
	self assert: dShape isComposite.
	self deny: dShape hasDrawModeUserChildren.
	self assert: dShape isEmpty.
	self deny: dShape isNotEmpty.
	self assert: dShape toUpdateDShapeList isEmpty.
	self assert: dShape toDeleteDShapeList isEmpty.
	self deny: dShape hasDirtyChildren.
	self assert: dShape isTranslatedByParent.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testRemoveChildren [

	| dCompositeShape |
	dCompositeShape := SmockDCompositeShape new.
	dCompositeShape addChild: (SmockDLeafShape key: #testLeafShape).
	dCompositeShape addChild: (SmockDLeafShape key: #testLeafShape2).
	self deny: dCompositeShape isEmpty.
	
	dCompositeShape removeChildren.
	self assert: dCompositeShape isEmpty.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testSortChildrenBy [

	| dCompositeShape |
	dCompositeShape := SmockDCompositeShape new.
	dCompositeShape addChild: ((SmockDLeafShape key: #testLeafShape) zIndex: 99).
	dCompositeShape addChild: (SmockDLeafShape key: #testLeafShape2).
	self assert: dCompositeShape dShapeList first key equals: #testLeafShape.
	self assert: dCompositeShape dShapeList last key equals: #testLeafShape2.
		
	dCompositeShape sortChildrenBy: [ :a :b | a zIndex < b zIndex ].
	self assert: dCompositeShape dShapeList first key equals: #testLeafShape2.
	self assert: dCompositeShape dShapeList last key equals: #testLeafShape.
]
