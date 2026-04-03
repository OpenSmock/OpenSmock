"
A SmockPickedElementTest is a test class for testing the behavior of SmockPickedElement
"
Class {
	#name : #SmockPickedElementTest,
	#superclass : #TestCase,
	#instVars : [
		'element'
	],
	#category : #'OpenSmock-Tests-Picking'
}

{ #category : #testing }
SmockPickedElementTest class >> shouldInheritSelectors [

	^ true
]

{ #category : #running }
SmockPickedElementTest >> pickedElementClass [

	^ SmockPickedElement
]

{ #category : #running }
SmockPickedElementTest >> setUp [
	super setUp.

	element := self pickedElementClass new.
]

{ #category : #tests }
SmockPickedElementTest >> testDShape [

	| shape |
	self assert: element dShape isNil.
	
	shape := SmockDShape new.
	element dShape: shape.
	self assert: element dShape equals: shape
]

{ #category : #tests }
SmockPickedElementTest >> testGShape [

	| shape |
	self assert: element gShape isNil.
	
	shape := SmockGShape2D new.
	element gShape: shape.
	self assert: element gShape equals: shape
]
