"
A SmockAbstractCoordinatesTest is a test class for testing the behavior of SmockAbstractCoordinates
"
Class {
	#name : #SmockAbstractCoordinatesTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - Core'
}

{ #category : #tests }
SmockAbstractCoordinatesTest >> testAbstractCoordinates [
	| coord |
	coord := SmockAbstractCoordinates new.
	self assert: coord isEmpty equals: true.
	self assert: coord isValid equals: false.
	self assert: coord asPoint equals: nil.
]

{ #category : #tests }
SmockAbstractCoordinatesTest >> testAbstractCoordinatesCopy [
	| coord copy |
	coord := SmockAbstractCoordinates new.
	copy := coord copy.
	self assert: copy ~~ coord.
]
