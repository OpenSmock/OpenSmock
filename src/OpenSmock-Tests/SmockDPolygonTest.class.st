"
A SmockDPolygonTest is a test class for testing the behavior of SmockDPolygon
"
Class {
	#name : #SmockDPolygonTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDPolygonTest >> dShapeClass [ 

	^ SmockDPolygon 
]

{ #category : #tests }
SmockDPolygonTest >> testCopy [ 
	
	super testCopy.
	
	dShape := SmockDPolygon new points: { 0@0 . 1@1 . 2@2 }.
	super testCopy.
]

{ #category : #tests }
SmockDPolygonTest >> testInitialize [ 
	
	super testInitialize.
	
	self assert: dShape points isEmpty.
]

{ #category : #tests }
SmockDPolygonTest >> testPoints [
	
	dShape points: { 0@0 . 1@1 . 2@2 }.
	self assert: dShape points equals: { 0@0 . 1@1 . 2@2 }
]
