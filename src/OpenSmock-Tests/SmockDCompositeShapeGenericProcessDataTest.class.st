"
A SmockDCompositeShapeGenericProcessDataTest is a test class for testing the behavior of SmockDCompositeShapeGenericProcessData
"
Class {
	#name : #SmockDCompositeShapeGenericProcessDataTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDCompositeShapeGenericProcessDataTest >> testProcessCreatedDataIncomingWithContext [

	| processData dShape gShape |
	processData := SmockDCompositeShapeGenericProcessData new.
	dShape := SmockDCompositeShape new.
	gShape := processData processCreatedData: #test incoming: dShape with: nil context: nil.
	
	self assert: gShape class equals: SmockGCompositeShape2D.
	self assert: gShape id equals: #test.
	
	self assert: gShape isVisible.
	self assert: gShape isVisible equals: dShape isVisible.
	self assert: gShape isTranslatedByParent.
	self assert: gShape isTranslatedByParent equals: dShape isTranslatedByParent.
]

{ #category : #tests }
SmockDCompositeShapeGenericProcessDataTest >> testProcessRecycledDataIncomingWithContext [

	| processData dShape gShape |
	processData := SmockDCompositeShapeGenericProcessData new.
	dShape := SmockDCompositeShape new.
	gShape := processData processCreatedData: #test incoming: dShape with: nil context: nil.
	gShape addChild: (SmockGShape2D new).
	self assert: gShape hasChildren.
	
	gShape := processData processRecycledData: #test incoming: dShape with: gShape context: nil.

	self deny: gShape hasChildren.
]

{ #category : #tests }
SmockDCompositeShapeGenericProcessDataTest >> testProcessUpdatedDataIncomingWithContext [

	| processData dShape gShape |
	processData := SmockDCompositeShapeGenericProcessData new.
	dShape := SmockDCompositeShape new.
	gShape := processData processCreatedData: #test incoming: dShape with: nil context: nil.
	dShape isVisible: false.
	dShape isTranslatedByParent: false.
	gShape := processData processUpdatedData: #test incoming: dShape with: gShape context: nil.

	self assert: gShape class equals: SmockGCompositeShape2D.
	self assert: gShape id equals: #test.

	self deny: gShape isVisible.
	self assert: gShape isVisible equals: dShape isVisible.
	self deny: gShape isTranslatedByParent.
	self assert: gShape isTranslatedByParent equals: dShape isTranslatedByParent.	
]
