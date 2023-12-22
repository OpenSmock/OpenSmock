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

	dCompositeShape updateChild: dLeafShape.
	self assert: dCompositeShape dShapeList size equals: 1.
	self assert: dCompositeShape dShapeList first identicalTo: dLeafShape.
	self assert: dCompositeShape toUpdateDShapeList size equals: 1.
	self
		assert: dCompositeShape toUpdateDShapeList first
		identicalTo: dLeafShape.
	self assert: dCompositeShape toDeleteDShapeList isEmpty.

	dCompositeShape clearToUpdateDShapeList.
	self assert: dCompositeShape dShapeList size equals: 1.
	self assert: dCompositeShape dShapeList first identicalTo: dLeafShape.
	self assert: dCompositeShape toUpdateDShapeList isEmpty.
	self assert: dCompositeShape toDeleteDShapeList isEmpty.

	dCompositeShape removeChild: dLeafShape.
	self assert: dCompositeShape dShapeList size equals: 1.
	self assert: dCompositeShape dShapeList first identicalTo: dLeafShape.
	self assert: dCompositeShape toDeleteDShapeList size equals: 1.
	self
		assert: dCompositeShape toDeleteDShapeList first
		identicalTo: dLeafShape.

	dCompositeShape dShapeList removeAll.
	dCompositeShape clearToDeleteDShapeList.
	self assert: dCompositeShape dShapeList size equals: 0.
	self assert: dCompositeShape toDeleteDShapeList size equals: 0
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
SmockDCompositeShapeTest >> testGetChildren [

	| dCompositeShape dLeafShape dLeafShape2 |
	dCompositeShape := SmockDCompositeShape new.
	dLeafShape := SmockDLeafShape key: #testLeafShape.
	dLeafShape2 := SmockDLeafShape key: #testLeafShape2.

	self assert: (dCompositeShape getChild: nil) equals: nil.
	self assert: (dCompositeShape getChild: #notExistingKey) equals: nil.

	dCompositeShape addChild: dLeafShape.
	self assert: (dCompositeShape getChild: nil) equals: nil.
	self assert: (dCompositeShape getChild: #notExistingKey) equals: nil.
	self
		assert: (dCompositeShape getChild: #testLeafShape)
		identicalTo: dLeafShape.

	dCompositeShape addChild: dLeafShape2.
	self assert: (dCompositeShape getChild: nil) equals: nil.
	self assert: (dCompositeShape getChild: #notExistingKey) equals: nil.
	self
		assert: (dCompositeShape getChild: #testLeafShape)
		identicalTo: dLeafShape.
	self
		assert: (dCompositeShape getChild: #testLeafShape2)
		identicalTo: dLeafShape2
]

{ #category : #tests }
SmockDCompositeShapeTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDCompositeShape new.
	
	self deny: dShape isLeaf.
	self assert: dShape isComposite.
	self deny: dShape hasUserDrawMode.
	self assert: dShape dShapeList isEmpty.
	self assert: dShape toUpdateDShapeList isEmpty.
	self assert: dShape toDeleteDShapeList isEmpty.
]
