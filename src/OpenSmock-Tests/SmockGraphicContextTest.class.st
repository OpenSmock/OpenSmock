"
A SmockGraphicContextTest is a test class for testing the behavior of SmockGraphicContext
"
Class {
	#name : #SmockGraphicContextTest,
	#superclass : #TestCase,
	#instVars : [
		'context'
	],
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #testing }
SmockGraphicContextTest class >> isAbstract [

	^ self == SmockGraphicContextTest
]

{ #category : #running }
SmockGraphicContextTest >> graphicContextClass [

	self subclassResponsibility 
]

{ #category : #running }
SmockGraphicContextTest >> setUp [
	super setUp.

	context := self graphicContextClass new
]

{ #category : #tests }
SmockGraphicContextTest >> testNeedToComputeBounds [

	self assert: context needToComputeBounds.
	
	context needToComputeBounds: false.
	self deny: context needToComputeBounds.
	
	context needToComputeBounds: true.
	self assert: context needToComputeBounds.
]

{ #category : #tests }
SmockGraphicContextTest >> testPropertyHasChanged [

	context propertyHasChanged: nil.
	context propertyHasChanged: #myProperty.
]
