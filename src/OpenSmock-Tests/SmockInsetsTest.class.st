"
A SmockInsetsTest is a test class for testing the behavior of SmockInsets
"
Class {
	#name : #SmockInsetsTest,
	#superclass : #TestCase,
	#instVars : [
		'insets'
	],
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #running }
SmockInsetsTest >> setUp [

	super setUp.

	insets := SmockInsets new
]

{ #category : #tests }
SmockInsetsTest >> testAsMargin [

	| margin |
	margin := insets asMargin.
	self assert: (margin isKindOf: Margin).
	self assert: margin top equals: 0.
	self assert: margin right equals: 0.
	self assert: margin bottom equals: 0.
	self assert: margin left equals: 0.
]

{ #category : #tests }
SmockInsetsTest >> testBottom [

	self assert: insets bottom equals: 0.

	insets bottom: 1.
	self assert: insets bottom equals: 1.
]

{ #category : #tests }
SmockInsetsTest >> testIsEmpty [

	self assert: insets isEmpty
]

{ #category : #tests }
SmockInsetsTest >> testIsUniform [

	self assert: insets isUniform 
]

{ #category : #tests }
SmockInsetsTest >> testLeft [

	self assert: insets left equals: 0.

	insets left: 1.
	self assert: insets left equals: 1.
]

{ #category : #tests }
SmockInsetsTest >> testRight [

	self assert: insets right equals: 0.

	insets right: 1.
	self assert: insets right equals: 1.
]

{ #category : #tests }
SmockInsetsTest >> testTop [ 

	self assert: insets top equals: 0.

	insets top: 1.
	self assert: insets top equals: 1.
]
