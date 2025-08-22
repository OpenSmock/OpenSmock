"
A SmockGCircle2DTest is a test class for testing the behavior of SmockGCircle2D
"
Class {
	#name : #SmockGRectangle2DTest,
	#superclass : #TestCase,
	#instVars : [
		'gShape'
	],
	#category : #'OpenSmock-Tests-GShape'
}

{ #category : #running }
SmockGRectangle2DTest >> setUp [

	super setUp.

	gShape := SmockGRectangle2D new
]

{ #category : #running }
SmockGRectangle2DTest >> testIsDrawable [

	self deny: gShape isDrawable.

	gShape position: 0@0.
	gShape fillStyle: Color red asSmockFillStyle.
	self deny: gShape isDrawable.
	
	gShape length1: 10.
	self deny: gShape isDrawable.
	
	gShape length2: 20.
	self assert: gShape isDrawable.
]

{ #category : #running }
SmockGRectangle2DTest >> testLength1 [

	self assert: gShape length1 isNil.

	gShape length1: 50.
	self assert: gShape length1 equals: 50
]

{ #category : #running }
SmockGRectangle2DTest >> testLength2 [

	self assert: gShape length2 isNil.

	gShape length2: 50.
	self assert: gShape length2 equals: 50
]
