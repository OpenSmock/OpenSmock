Class {
	#name : #SmockDCompositeShapeTest,
	#superclass : #SmockDShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDCompositeShapeTest >> dShapeClass [

	^ SmockDCompositeShape
]

{ #category : #tests }
SmockDCompositeShapeTest >> testAddChild [

	self assert: dShape getChildren isEmpty.
	
	"cannot add a child without key"
	dShape addChild: (SmockDShape new).
	self assert: dShape getChildren isEmpty.
	
	dShape addChild: (SmockDShape key: #key1).
	self assert: dShape numberOfChildren equals: 1.
	
	"cannot add child with an existing key"
	dShape addChild: (SmockDShape key: #key1).
	self assert: dShape numberOfChildren equals: 1.
		
	
]

{ #category : #tests }
SmockDCompositeShapeTest >> testAddUpdateAndDeleteChildren [

	| dLeafShape |
	dLeafShape := SmockDLeafShape key: #testLeafShape.

	dShape addChild: dLeafShape.
	self assert: dShape dShapeList size equals: 1.
	self assert: dShape dShapeList first identicalTo: dLeafShape.
	self assert: dShape toUpdateDShapeList isEmpty.
	self assert: dShape toDeleteDShapeList isEmpty.
	self deny: dShape hasDirtyChildren.

	dShape updateChild: dLeafShape.
	self assert: dShape dShapeList size equals: 1.
	self assert: dShape dShapeList first identicalTo: dLeafShape.
	self assert: dShape toUpdateDShapeList size equals: 1.
	self assert: dShape toUpdateDShapeList first identicalTo: dLeafShape.
	self assert: dShape toDeleteDShapeList isEmpty.
	self assert: dShape hasDirtyChildren.

	dShape clearToUpdateDShapeList.
	self assert: dShape dShapeList size equals: 1.
	self assert: dShape dShapeList first identicalTo: dLeafShape.
	self assert: dShape toUpdateDShapeList isEmpty.
	self assert: dShape toDeleteDShapeList isEmpty.
	self deny: dShape hasDirtyChildren.

	dShape removeChild: dLeafShape.
	self assert: dShape dShapeList size equals: 0.
	self assert: dShape toDeleteDShapeList size equals: 1.
	self assert: dShape toDeleteDShapeList first identicalTo: dLeafShape.
	self assert: dShape hasDirtyChildren.

	dShape clearToDeleteDShapeList.
	self assert: dShape toDeleteDShapeList size equals: 0.
	self deny: dShape hasDirtyChildren.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testDefaultIsTranslatedByParent [ 
	
	self assert: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDCompositeShapeTest >> testGetChild [

	| dLeafShape dLeafShape2 |
	dLeafShape := SmockDLeafShape key: #testLeafShape.
	dLeafShape2 := SmockDLeafShape key: #testLeafShape2.

	self assert: (dShape getChild: nil) equals: nil.
	self assert: (dShape getChild: #notExistingKey) equals: nil.

	dShape addChild: dLeafShape.
	self assert: (dShape getChild: nil) equals: nil.
	self assert: (dShape getChild: #notExistingKey) equals: nil.
	self assert: (dShape getChild: #testLeafShape) identicalTo: dLeafShape.

	dShape addChild: dLeafShape2.
	self assert: (dShape getChild: nil) equals: nil.
	self assert: (dShape getChild: #notExistingKey) equals: nil.
	self assert: (dShape getChild: #testLeafShape) identicalTo: dLeafShape.
	self assert: (dShape getChild: #testLeafShape2) identicalTo: dLeafShape2
]

{ #category : #tests }
SmockDCompositeShapeTest >> testGetChildren [

	self assert: dShape getChildren isEmpty.
	
	dShape addChild: (SmockDShape key: #test).
	self assert: dShape getChildren notEmpty.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testHasUserComputingChildren [

	| child1 |
	child1 := SmockDLeafShape key: #testLeafShape.
	
	dShape addChild: child1.
	self assert: dShape hasUserComputingChildren.

	child1 setDrawModeDevice.
	dShape updateChild: child1.
	dShape updateStateWithChildren.
	self assert: dShape hasUserComputingChildren.

	child1 setDrawModeDevice.
	child1 isTranslatedByParent: true.
	dShape updateChild: child1.
	dShape updateStateWithChildren.
	self deny: dShape hasUserComputingChildren.
	
	child1 setDrawModeUser.
	dShape updateChild: child1.
	dShape updateStateWithChildren.
	self assert: dShape hasUserComputingChildren.
	
	dShape removeChild: child1.
	dShape updateStateWithChildren.
	self deny: dShape hasUserComputingChildren.
	
	dShape removeChildren.
	dShape updateStateWithChildren.
	self deny: dShape hasUserComputingChildren.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testHasUserComputingChildren2 [

	| child1 |
	child1 := SmockDLeafShape key: #testLeafShape.
	
	dShape addChild: child1.
	dShape removeChildren.
	dShape updateStateWithChildren.
	self deny: dShape hasUserComputingChildren.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testInitialize [ 
	
	super testInitialize.
	
	self deny: dShape hasUserComputingChildren.
	self deny: dShape hasChildren.
	self assert: dShape isEmpty.
	self deny: dShape isNotEmpty.
	self assert: dShape toUpdateDShapeList isEmpty.
	self assert: dShape toDeleteDShapeList isEmpty.
	self deny: dShape hasDirtyChildren
]

{ #category : #tests }
SmockDCompositeShapeTest >> testIsComposite [

	self assert: dShape isComposite
]

{ #category : #tests }
SmockDCompositeShapeTest >> testIsLeaf [

	self deny: dShape isLeaf
]

{ #category : #tests }
SmockDCompositeShapeTest >> testRemoveChildren [

	dShape addChild: (SmockDLeafShape key: #testLeafShape).
	dShape addChild: (SmockDLeafShape key: #testLeafShape2).
	self deny: dShape isEmpty.
	
	dShape removeChildren.
	self assert: dShape isEmpty.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testSortChildrenBy [

	dShape addChild: ((SmockDLeafShape key: #testLeafShape) zIndex: 99).
	dShape addChild: (SmockDLeafShape key: #testLeafShape2).
	self assert: dShape dShapeList first key equals: #testLeafShape.
	self assert: dShape dShapeList last key equals: #testLeafShape2.
		
	dShape sortChildrenBy: [ :a :b | a zIndex < b zIndex ].
	self assert: dShape dShapeList first key equals: #testLeafShape2.
	self assert: dShape dShapeList last key equals: #testLeafShape.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testUpdateChildren [

	| subChild1 child2 |
	dShape updateChildren. "no effects"
	self deny: dShape hasDirtyChildren.
	
	dShape addChild: (SmockDLeafShape key: #child1).
	dShape updateChildren.
	self assert: dShape hasDirtyChildren.
	self assert: dShape toUpdateDShapeList size equals: 1.
	self assert: ((dShape toUpdateDShapeList at: 1) key) equals: #child1.
	
	"create a new child with a sub child, and reset to considere there is no update"
	subChild1 := SmockDLeafShape key: #subChild1.
	child2 := (SmockDCompositeShape key: #child2) addChild: subChild1; clearChangedDShapeLists.
	dShape addChild: child2; clearChangedDShapeLists.
	self deny: dShape hasDirtyChildren.
	
	dShape updateChildren.
	self assert: dShape hasDirtyChildren.
	self assert: dShape toUpdateDShapeList size equals: 2.
	self assert: ((dShape toUpdateDShapeList at: 1) key) equals: #child1.
	self assert: ((dShape toUpdateDShapeList at: 2) key) equals: #child2.
	
	"check than child2 child is not dirty"
	self deny: child2 hasDirtyChildren.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testUpdateChildrenInDepth [

	| subChild1 child2 |
	dShape updateChildrenInDepth . "no effects"
	self deny: dShape hasDirtyChildren.
	
	dShape addChild: (SmockDLeafShape key: #child1).
	dShape updateChildrenInDepth.
	self assert: dShape hasDirtyChildren.
	self assert: dShape toUpdateDShapeList size equals: 1.
	self assert: ((dShape toUpdateDShapeList at: 1) key) equals: #child1.
	
	"create a new child with a sub child, and reset to considere there is no update"
	subChild1 := SmockDLeafShape key: #subChild1.
	child2 := (SmockDCompositeShape key: #child2) addChild: subChild1; clearChangedDShapeLists.
	dShape addChild: child2; clearChangedDShapeLists.
	self deny: dShape hasDirtyChildren.
	
	dShape updateChildrenInDepth.
	self assert: dShape hasDirtyChildren.
	self assert: dShape toUpdateDShapeList size equals: 2.
	self assert: ((dShape toUpdateDShapeList at: 1) key) equals: #child1.
	self assert: ((dShape toUpdateDShapeList at: 2) key) equals: #child2.
	
	"check than child2 child is dirty"
	self assert: child2 hasDirtyChildren.
	self assert: child2 toUpdateDShapeList size equals: 1.
	self assert: ((child2 toUpdateDShapeList at: 1) key) equals: #subChild1.
]
