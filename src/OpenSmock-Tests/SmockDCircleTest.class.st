"
A SmockDCircleTest is a test class for testing the behavior of SmockDCircle
"
Class {
	#name : #SmockDCircleTest,
	#superclass : #TestCase,
	#instVars : [
		'dShape'
	],
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDCircleTest >> setUp [

	super setUp.
	dShape := SmockDCircle new
]

{ #category : #tests }
SmockDCircleTest >> testCopy [ 
	
	| dShapeCopy |
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDCircleTest >> testInitialize [ 
	
	self deny: dShape isDrawModeDevice.
	self assert: dShape isTranslatedByParent.
	self assert: dShape radius equals: nil.
]
