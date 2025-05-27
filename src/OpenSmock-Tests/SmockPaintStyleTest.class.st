"
A SmockPaintStyleTest is a test class for testing the behavior of SmockPaintStyle
"
Class {
	#name : #SmockPaintStyleTest,
	#superclass : #TestCase,
	#instVars : [
		'style'
	],
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #running }
SmockPaintStyleTest >> setUp [
	super setUp.

	style := SmockPaintStyle new
]

{ #category : #tests }
SmockPaintStyleTest >> testIsColor [

	self deny: style isColor.

	style paint: Color red.
	self assert: style isColor
]

{ #category : #tests }
SmockPaintStyleTest >> testIsGradient [

	self deny: style isGradient.
	
	style paint: SmockGradientPaint new.
	self assert: style isGradient
]

{ #category : #tests }
SmockPaintStyleTest >> testIsTransparent [

	self assert: style isTransparent
]

{ #category : #tests }
SmockPaintStyleTest >> testPaint [

	self assert: style paint isNil
]
