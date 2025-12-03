"
A SmockRadialGradientPaintTest is a test class for testing the behavior of SmockRadialGradientPaint
"
Class {
	#name : #SmockRadialGradientPaintTest,
	#superclass : #SmockGradientPaintTest,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #running }
SmockRadialGradientPaintTest >> gradientClass [

	^ SmockRadialGradientPaint 
]

{ #category : #tests }
SmockRadialGradientPaintTest >> testIsRadial [

	self assert: gradient isRadial
]
