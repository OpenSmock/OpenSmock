"
A SmockSelectionTest is a test class for testing the behavior of SmockSelection
"
Class {
	#name : #SmockSelectionTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Components-Tests'
}

{ #category : #tests }
SmockSelectionTest >> testInitialize [

	| selection |
	selection := SmockSelection new.
	self assert: selection origin isNil.
	self assert: selection keys isEmpty.
	self assert: selection nbKeys equals: 0.
	self assert: selection isEmpty.
	self assert: selection dateTime <= DateAndTime now.
]
