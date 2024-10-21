"
A SmockAbstractCoordinatesTest is a test class for testing the behavior of SmockAbstractCoordinates
"
Class {
	#name : #SmockAbstractCoordinatesTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockAbstractCoordinatesTest >> testCopy [
	| coord copy |
	coord := SmockAbstractCoordinates new.
	copy := coord copy.
	self assert: copy ~~ coord.
]
