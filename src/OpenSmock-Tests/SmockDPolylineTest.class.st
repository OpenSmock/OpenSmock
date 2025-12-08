"
A SmockDPolylineTest is a test class for testing the behavior of SmockDPolyline
"
Class {
	#name : #SmockDPolylineTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDPolylineTest >> dShapeClass [ 

	^ SmockDPolyline
]

{ #category : #tests }
SmockDPolylineTest >> testCopy [ 
	
	super testCopy.
	
	dShape points: { 0@0 . 1@1 . 2@2 }.
	super testCopy.
]

{ #category : #tests }
SmockDPolylineTest >> testInitialize [ 
	
	super testInitialize.

	self assert: dShape points isEmpty.
]

{ #category : #tests }
SmockDPolylineTest >> testPoints [
	
	dShape points: { 0@0 . 1@1 . 2@2 }.
	self assert: dShape points equals: { 0@0 . 1@1 . 2@2 }
]
