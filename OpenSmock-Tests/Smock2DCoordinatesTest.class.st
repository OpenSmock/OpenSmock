Class {
	#name : #Smock2DCoordinatesTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
Smock2DCoordinatesTest >> testAsPoint [
	| coord |
	coord := Smock2DCoordinates x: 2 y: 5.
	self assert: coord asPoint equals: 2@5.
]

{ #category : #tests }
Smock2DCoordinatesTest >> testCopy [
	| coord copy |
	coord := Smock2DCoordinates new.
	copy := coord copy.
	self assert: copy ~~ coord.
]

{ #category : #tests }
Smock2DCoordinatesTest >> testInitialize [
	| coord |
	coord := Smock2DCoordinates new.
	self assert: coord isEmpty equals: true.
	self assert: coord isNotEmpty equals: false.
	self assert: coord isValid equals: false.
	self assert: coord asPoint equals: nil.
]

{ #category : #tests }
Smock2DCoordinatesTest >> testIsEmpty [
	| coord |
	coord := Smock2DCoordinates x: 2 y: 5.
	self deny: coord isEmpty.
	self assert: coord isNotEmpty.
]

{ #category : #tests }
Smock2DCoordinatesTest >> testIsValid [
	| coord |
	coord := Smock2DCoordinates x: 2 y: 5.
	self assert: coord isValid.
]

{ #category : #tests }
Smock2DCoordinatesTest >> testXY [
	| coord |
	coord := Smock2DCoordinates x: 2 y: 5.
	self assert: coord x equals: 2.
	self assert: coord y equals: 5.
]
