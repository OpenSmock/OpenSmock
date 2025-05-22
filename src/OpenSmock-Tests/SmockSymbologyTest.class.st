"
A SmockSymbologyTest is a test class for testing the behavior of SmockSymbology
"
Class {
	#name : #SmockSymbologyTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Symbology'
}

{ #category : #tests }
SmockSymbologyTest >> testAddSymbol [

	| symbology form |
	symbology := SmockSymbology new.
	form := Form new.
	symbology at: #symbol1 put: form.
	
	self assert: (symbology at: #symbol1) equals: form.
]

{ #category : #tests }
SmockSymbologyTest >> testDefaultSymbol [

	| symbology form |
	symbology := SmockSymbology new.
	self assert: symbology defaultSymbol isNil.

	form := Form new.
	symbology defaultSymbol: form.
	self assert: symbology defaultSymbol equals: form
]

{ #category : #tests }
SmockSymbologyTest >> testKey [

	| symbology |
	symbology := SmockSymbology new.
	symbology key: #MySymbology.
	self assert: symbology key equals: #MySymbology.
]

{ #category : #tests }
SmockSymbologyTest >> testName [

	| symbology |
	symbology := SmockSymbology new.
	symbology name: 'My Symbology'.
	self assert: symbology name equals: 'My Symbology'
]
