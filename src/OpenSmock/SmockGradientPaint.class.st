Class {
	#name : #SmockGradientPaint,
	#superclass : #Object,
	#instVars : [
		'stops'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #constructor }
SmockGradientPaint class >> from: aStartColor to: anEndColor [
	"A convenience method to create a gradient consisting out of 2 colors"

	^ self new stops: {
			  (0 -> aStartColor).
			  (1 -> anEndColor) }
]

{ #category : #testing }
SmockGradientPaint class >> isAbstract [

	^ self == SmockGradientPaint
]

{ #category : #testing }
SmockGradientPaint >> asSmockFillStyle [

	^ SmockFillStyle new paint: self; yourself
]

{ #category : #testing }
SmockGradientPaint >> asSmockStrokeStyle [

	^ SmockStrokeStyle new paint: self; yourself
]

{ #category : #testing }
SmockGradientPaint >> isAbsolute [
	"a gradient is absolute when each stops points are superior than 1 (dot proportion)"

	^ self isRelative not
]

{ #category : #testing }
SmockGradientPaint >> isGradient [

	^ true
]

{ #category : #testing }
SmockGradientPaint >> isLinear [

	^ false
]

{ #category : #testing }
SmockGradientPaint >> isRadial [

	^ false
]

{ #category : #testing }
SmockGradientPaint >> isRelative [
	"a gradient is relative when each stops points are minus that 1 (% proportion)"

	^ self stops detect: [ :stop | stop key > 1 ] ifFound: [ false ] ifNone: [ true ]
]

{ #category : #testing }
SmockGradientPaint >> isTransparent [

	^ self stops isEmpty
]

{ #category : #accessing }
SmockGradientPaint >> stops [

	^ stops ifNil: [ stops := #(  ) ]
]

{ #category : #accessing }
SmockGradientPaint >> stops: anObject [

	stops := anObject
]
