"
A SmockRadialGradientPaintTest is a test class for testing the behavior of SmockRadialGradientPaint
"
Class {
	#name : #SmockRadialGradientPaintTest,
	#superclass : #TestCase,
	#instVars : [
		'gradient'
	],
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #running }
SmockRadialGradientPaintTest >> setUp [
	super setUp.

	gradient := SmockRadialGradientPaint new.
]

{ #category : #running }
SmockRadialGradientPaintTest >> testAsSmockFillStyle [

	| style |
	style := gradient asSmockFillStyle.
	self assert: (style isKindOf: SmockFillStyle)
]

{ #category : #running }
SmockRadialGradientPaintTest >> testAsSmockStrokeStyle [

	| style |
	style := gradient asSmockStrokeStyle.
	self assert: (style isKindOf: SmockStrokeStyle)
]

{ #category : #running }
SmockRadialGradientPaintTest >> testIsAbsolute [

	self deny: gradient isAbsolute.
	
	gradient stops: {
			(0 -> Color red).
			(100 -> Color blue) }.
	self assert: gradient isAbsolute.
	
	gradient stops: {
			(0 -> Color red).
			(1 -> Color blue) }.
	self deny: gradient isAbsolute.
]

{ #category : #running }
SmockRadialGradientPaintTest >> testIsLinear [

	self deny: gradient isLinear
]

{ #category : #running }
SmockRadialGradientPaintTest >> testIsRadial [

	self assert: gradient isRadial
]

{ #category : #running }
SmockRadialGradientPaintTest >> testIsRelative [

	self assert: gradient isRelative.
	
	gradient stops: {
			(0 -> Color red).
			(100 -> Color blue) }.
	self deny: gradient isRelative.
	
	gradient stops: {
			(0 -> Color red).
			(1 -> Color blue) }.
	self assert: gradient isRelative.
]

{ #category : #running }
SmockRadialGradientPaintTest >> testStops [

	self assert: gradient stops isEmpty.

	gradient stops: {
			(0 -> Color red).
			(1 -> Color blue) }.
			
	self assert: gradient stops size equals: 2.
	
	gradient stops: nil.
	self assert: gradient stops isEmpty.
]
