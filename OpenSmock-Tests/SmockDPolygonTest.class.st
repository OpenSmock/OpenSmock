"
A SmockDPolygonTest is a test class for testing the behavior of SmockDPolygon
"
Class {
	#name : #SmockDPolygonTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDPolygonTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDPolygon new points: { 0@0 . 1@1 . 2@2 }.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDPolygonTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDPolygon new.
	self assert: dShape points isEmpty.
	self deny: dShape isTranslatedByParent.
]

{ #category : #tests }
SmockDPolygonTest >> testPoints [
	
	| dShape |
	dShape := SmockDPolygon new.
	dShape points: { 0@0 . 1@1 . 2@2 }.
	self assert: dShape points equals: { 0@0 . 1@1 . 2@2 }
]
