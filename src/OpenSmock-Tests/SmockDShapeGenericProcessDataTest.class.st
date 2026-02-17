"
A SmockDShapeGenericProcessDataTest is a test class for testing the behavior of SmockDShapeGenericProcessData
"
Class {
	#name : #SmockDShapeGenericProcessDataTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDShapeGenericProcessDataTest >> testProcessCreatedDataIncomingWithContext [

	| processData dShape gShape |
	processData := SmockDShapeGenericProcessData new.
	dShape := SmockDShape new.
	gShape := processData processCreatedData: #test incoming: dShape with: nil context: nil.
	
	self assert: gShape class equals: SmockGShape2D.
	self assert: gShape id equals: #test
]

{ #category : #tests }
SmockDShapeGenericProcessDataTest >> testProcessDeletedDataIncomingWithContext [

	| processData dShape gShape |
	processData := SmockDShapeGenericProcessData new.
	dShape := SmockDShape new.
	gShape := processData processCreatedData: #test incoming: dShape with: nil context: nil.
	gShape := processData processDeletedData: #test incoming: dShape with: gShape context: nil.

	self assert: gShape notNil.
]

{ #category : #tests }
SmockDShapeGenericProcessDataTest >> testProcessRecycledDataIncomingWithContext [

	| processData dShape gShape |
	processData := SmockDShapeGenericProcessData new.
	dShape := SmockDShape new.
	gShape := processData processCreatedData: #test incoming: dShape with: nil context: nil.
	gShape isVisible: false.
	gShape isPickable: (gShape defaultIsPickable not).
	gShape zIndex: 20.
	gShape effect: SmockPaintEffect new.
	gShape isTranslatedByParent: false.
	gShape setProperty: #test value: 1. 
	self assert: gShape hasProperties.
	
	gShape := processData processRecycledData: #test incoming: dShape with: gShape context: nil.

	self assert: gShape class equals: SmockGShape2D.
	self assert: gShape id isNil.
	self assert: gShape isVisible.
	self assert: gShape zIndex equals: 0.
	self assert: gShape effect isNil.
	self assert: gShape isTranslatedByParent.
	self assert: gShape isPickable equals: gShape defaultIsPickable. 
	self deny: gShape hasProperties.
]

{ #category : #tests }
SmockDShapeGenericProcessDataTest >> testProcessStateChangedStateValueWithContext [

	| processData dShape gShape |
	processData := SmockDShapeGenericProcessData new.
	dShape := SmockDShape new.
	gShape := processData processCreatedData: #test incoming: dShape with: nil context: nil.
	gShape := processData processStateChanged: 1 state: #myState value: #myValue with: gShape context: nil. 

	self assert: gShape notNil
]

{ #category : #tests }
SmockDShapeGenericProcessDataTest >> testProcessUpdatedDataIncomingWithContext [

	| processData dShape gShape |
	processData := SmockDShapeGenericProcessData new.
	dShape := SmockDShape new.
	gShape := processData processCreatedData: #test incoming: dShape with: nil context: nil.
	
	dShape isVisible: false.
	dShape isTranslatedByParent: false.
	dShape zIndex: 10.
	dShape isPickable: false.
	dShape effect: SmockPaintEffect new.
	gShape := processData processUpdatedData: #test incoming: dShape with: gShape context: nil.

	self deny: gShape isVisible.
	self deny: gShape isTranslatedByParent.
	self assert: gShape zIndex equals: 10.
	self deny: gShape isPickable.
	self assert: gShape effect notNil.
	self assert: gShape effect equals: dShape effect.
]
