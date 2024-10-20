"
A SmockCursorTest is a test class for testing the behavior of SmockCursor
"
Class {
	#name : #SmockCursorTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - Core'
}

{ #category : #tests }
SmockCursorTest >> testInitialize [ 

	| cursor |
	cursor := SmockCursor new.
	self assert: cursor key isNil.
	self assert: cursor coordinates isNil.
	self assert: cursor event isNil.
	self assert: cursor source isNil.
]
