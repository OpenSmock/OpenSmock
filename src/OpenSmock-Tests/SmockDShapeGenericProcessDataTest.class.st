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
	self assert: gShape id equals: #test.
	self assert: gShape isVisible.
]

{ #category : #tests }
SmockDShapeGenericProcessDataTest >> testProcessRecycledDataIncomingWithContext [

	| processData dShape gShape |
	processData := SmockDShapeGenericProcessData new.
	dShape := SmockDShape new.
	gShape := processData processCreatedData: #test incoming: dShape with: nil context: nil.
	gShape setProperty: #test value: 1. 
	self assert: gShape hasProperties.
	
	gShape := processData processRecycledData: #test incoming: dShape with: gShape context: nil.

	self assert: gShape class equals: SmockGShape2D.
	self assert: gShape id isNil.
	self deny: gShape hasProperties.
]

{ #category : #tests }
SmockDShapeGenericProcessDataTest >> testProcessUpdatedDataIncomingWithContext [

	| processData dShape gShape |
	processData := SmockDShapeGenericProcessData new.
	dShape := SmockDShape new.
	gShape := processData processCreatedData: #test incoming: dShape with: nil context: nil.
	dShape isVisible: false.
	gShape := processData processUpdatedData: #test incoming: dShape with: gShape context: nil.

	self deny: gShape isVisible.
]
