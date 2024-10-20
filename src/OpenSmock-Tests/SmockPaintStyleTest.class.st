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
	self assert: style paint isNil.
	self deny: style isColor.
	self assert: style isTransparent.
]

{ #category : #tests }
SmockPaintStyleTest >> testIsColor [

	| style |
	style := SmockPaintStyle new.
	style paint: Color blue.
	self assert: style isColor.
]

{ #category : #tests }
SmockPaintStyleTest >> testIsTransparent [

	| style |
	style := SmockPaintStyle new.
	style paint: Color blue.
	self deny: style isTransparent.
	
	style paint: (Color blue alpha: 0).
	self assert: style isTransparent.
]
