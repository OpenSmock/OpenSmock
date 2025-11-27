"
A SmockGradientPaintTest is a test class for testing the behavior of SmockGradientPaint
"
Class {
	#name : #SmockGradientPaintTest,
	#superclass : #TestCase,
	#instVars : [
		'gradient'
	],
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #testing }
SmockGradientPaintTest class >> isAbstract [ 

	^ self == SmockGradientPaintTest 
]

{ #category : #running }
SmockGradientPaintTest >> gradientClass [

	^ self subclassResponsibility 
]

{ #category : #running }
SmockGradientPaintTest >> setUp [

	super setUp.

	gradient := self gradientClass new
]

{ #category : #running }
SmockGradientPaintTest >> testAsSmockFillStyle [

	| style |
	style := gradient asSmockFillStyle.
	self assert: (style isKindOf: SmockFillStyle)
]

{ #category : #running }
SmockGradientPaintTest >> testAsSmockStrokeStyle [

	| style |
	style := gradient asSmockStrokeStyle.
	self assert: (style isKindOf: SmockStrokeStyle)
]

{ #category : #running }
SmockGradientPaintTest >> testIsAbsolute [

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
SmockGradientPaintTest >> testIsGradient [

	self assert: gradient isGradient
]

{ #category : #running }
SmockGradientPaintTest >> testIsLinear [

	self deny: gradient isLinear
]

{ #category : #tests }
SmockGradientPaintTest >> testIsRadial [

	self deny: gradient isRadial
]

{ #category : #running }
SmockGradientPaintTest >> testIsRelative [

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

{ #category : #tests }
SmockGradientPaintTest >> testIsTransparent [

	self assert: gradient isTransparent.
	
	gradient stops: {
			(0 -> Color red).
			(1 -> Color blue) }.
	
	self deny: gradient isTransparent
]

{ #category : #running }
SmockGradientPaintTest >> testStops [

	self assert: gradient stops isEmpty.

	gradient stops: {
			(0 -> Color red).
			(1 -> Color blue) }.
			
	self assert: gradient stops size equals: 2.
	
	gradient stops: nil.
	self assert: gradient stops isEmpty.
]
