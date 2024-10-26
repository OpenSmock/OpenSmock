"
A SmockDPolylineTest is a test class for testing the behavior of SmockDPolyline
"
Class {
	#name : #SmockDPolylineTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDPolylineTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDPolyline new points: { 0@0 . 1@1 . 2@2 }.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDPolylineTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDPolyline new.
	self assert: dShape isDrawModeUser.
	self deny: dShape isTranslatedByParent.
	self assert: dShape points isEmpty.
	self deny: dShape isTranslatedByParent.
]

{ #category : #tests }
SmockDPolylineTest >> testPoints [
	
	| dShape |
	dShape := SmockDPolyline new.
	dShape points: { 0@0 . 1@1 . 2@2 }.
	self assert: dShape points equals: { 0@0 . 1@1 . 2@2 }
]
