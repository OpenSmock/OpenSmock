"
A SmockPaintStyleTest is a test class for testing the behavior of SmockPaintStyle
"
Class {
	#name : #SmockPaintStyleTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - Core'
}

{ #category : #tests }
SmockPaintStyleTest >> testInitialize [

	| style |
	style := SmockPaintStyle new.
	self assert: style paint isNil
]
