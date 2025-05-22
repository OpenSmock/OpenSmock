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
SmockDCompositeShapeTest >> testHasUserComputingChildren [

	| dCompositeShape child1 |
	dCompositeShape := SmockDCompositeShape new.
	child1 := SmockDLeafShape key: #testLeafShape.
	
	dCompositeShape addChild: child1.
	self assert: dCompositeShape hasUserComputingChildren.

	child1 setDrawModeDevice.
	dCompositeShape updateChild: child1.
	dCompositeShape updateStateWithChildren.
	self assert: dCompositeShape hasUserComputingChildren.

	child1 setDrawModeDevice.
	child1 isTranslatedByParent: true.
	dCompositeShape updateChild: child1.
	dCompositeShape updateStateWithChildren.
	self deny: dCompositeShape hasUserComputingChildren.
	
	child1 setDrawModeUser.
	dCompositeShape updateChild: child1.
	dCompositeShape updateStateWithChildren.
	self assert: dCompositeShape hasUserComputingChildren.
	
	dCompositeShape removeChild: child1.
	dCompositeShape updateStateWithChildren.
	self deny: dCompositeShape hasUserComputingChildren.
	
	dCompositeShape removeChildren.
	dCompositeShape updateStateWithChildren.
	self deny: dCompositeShape hasUserComputingChildren.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testHasUserComputingChildren2 [

	| dCompositeShape child1 |
	dCompositeShape := SmockDCompositeShape new.
	child1 := SmockDLeafShape key: #testLeafShape.
	
	dCompositeShape addChild: child1.
	dCompositeShape removeChildren.
	dCompositeShape updateStateWithChildren.
	self deny: dCompositeShape hasUserComputingChildren.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDCompositeShape new.
	self deny: dShape isLeaf.
	self assert: dShape isComposite.
	self deny: dShape hasUserComputingChildren.
	self deny: dShape hasChildren.
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

{ #category : #tests }
SmockDCompositeShapeTest >> testUpdateChildren [

	| dCompositeShape subChild1 child2 |
	dCompositeShape := SmockDCompositeShape new.
	dCompositeShape updateChildren. "no effects"
	self deny: dCompositeShape hasDirtyChildren.
	
	dCompositeShape addChild: (SmockDLeafShape key: #child1).
	dCompositeShape updateChildren.
	self assert: dCompositeShape hasDirtyChildren.
	self assert: dCompositeShape toUpdateDShapeList size equals: 1.
	self assert: ((dCompositeShape toUpdateDShapeList at: 1) key) equals: #child1.
	
	"create a new child with a sub child, and reset to considere there is no update"
	subChild1 := SmockDLeafShape key: #subChild1.
	child2 := (SmockDCompositeShape key: #child2) addChild: subChild1; clearChangedDShapeLists.
	dCompositeShape addChild: child2; clearChangedDShapeLists.
	self deny: dCompositeShape hasDirtyChildren.
	
	dCompositeShape updateChildren.
	self assert: dCompositeShape hasDirtyChildren.
	self assert: dCompositeShape toUpdateDShapeList size equals: 2.
	self assert: ((dCompositeShape toUpdateDShapeList at: 1) key) equals: #child1.
	self assert: ((dCompositeShape toUpdateDShapeList at: 2) key) equals: #child2.
	
	"check than child2 child is not dirty"
	self deny: child2 hasDirtyChildren.
]

{ #category : #tests }
SmockDCompositeShapeTest >> testUpdateChildrenInDepth [

	| dCompositeShape subChild1 child2 |
	dCompositeShape := SmockDCompositeShape new.
	dCompositeShape updateChildrenInDepth . "no effects"
	self deny: dCompositeShape hasDirtyChildren.
	
	dCompositeShape addChild: (SmockDLeafShape key: #child1).
	dCompositeShape updateChildrenInDepth.
	self assert: dCompositeShape hasDirtyChildren.
	self assert: dCompositeShape toUpdateDShapeList size equals: 1.
	self assert: ((dCompositeShape toUpdateDShapeList at: 1) key) equals: #child1.
	
	"create a new child with a sub child, and reset to considere there is no update"
	subChild1 := SmockDLeafShape key: #subChild1.
	child2 := (SmockDCompositeShape key: #child2) addChild: subChild1; clearChangedDShapeLists.
	dCompositeShape addChild: child2; clearChangedDShapeLists.
	self deny: dCompositeShape hasDirtyChildren.
	
	dCompositeShape updateChildrenInDepth.
	self assert: dCompositeShape hasDirtyChildren.
	self assert: dCompositeShape toUpdateDShapeList size equals: 2.
	self assert: ((dCompositeShape toUpdateDShapeList at: 1) key) equals: #child1.
	self assert: ((dCompositeShape toUpdateDShapeList at: 2) key) equals: #child2.
	
	"check than child2 child is dirty"
	self assert: child2 hasDirtyChildren.
	self assert: child2 toUpdateDShapeList size equals: 1.
	self assert: ((child2 toUpdateDShapeList at: 1) key) equals: #subChild1.
]
