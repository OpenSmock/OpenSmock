"
A TSmockGAlignableTest is a test class for testing the behavior of TSmockGAlignable
"
Class {
	#name : #TSmockAlignableTest,
	#superclass : #TestCase,
	#instVars : [
		'object'
	],
	#category : #'OpenSmock-Tests-Cases - Core'
}

{ #category : #running }
TSmockAlignableTest >> setUp [

	super setUp.
	object := SmockAlignableUserTestClass new.
]

{ #category : #running }
TSmockAlignableTest >> tearDown [

	object := nil.
	super tearDown
]

{ #category : #tests }
TSmockAlignableTest >> testInitialize [

	self assert: object xAlign equals: #center.
	self assert: object yAlign equals: #center.
]

{ #category : #tests }
TSmockAlignableTest >> testSetBottomCenter [

	object setBottomCenter.
	self assert: object xAlign equals: #center.
	self assert: object yAlign equals: #bottom.
]

{ #category : #tests }
TSmockAlignableTest >> testSetBottomLeft [

	object setBottomLeft.
	self assert: object xAlign equals: #left.
	self assert: object yAlign equals: #bottom.
]

{ #category : #tests }
TSmockAlignableTest >> testSetBottomRight [

	object setBottomRight.
	self assert: object xAlign equals: #right.
	self assert: object yAlign equals: #bottom.
]

{ #category : #tests }
TSmockAlignableTest >> testSetCenter [

	object setCenter.
	self assert: object xAlign equals: #center.
	self assert: object yAlign equals: #center.
]

{ #category : #tests }
TSmockAlignableTest >> testSetLeft [

	object setLeft.
	self assert: object xAlign equals: #left.
	self assert: object yAlign equals: #center.
]

{ #category : #tests }
TSmockAlignableTest >> testSetRight [

	object setRight.
	self assert: object xAlign equals: #right.
	self assert: object yAlign equals: #center.
]

{ #category : #tests }
TSmockAlignableTest >> testSetTopCenter [

	object setTopCenter.
	self assert: object xAlign equals: #center.
	self assert: object yAlign equals: #top.
]

{ #category : #tests }
TSmockAlignableTest >> testSetTopLeft [

	object setTopLeft.
	self assert: object xAlign equals: #left.
	self assert: object yAlign equals: #top.
]

{ #category : #tests }
TSmockAlignableTest >> testSetTopRight [

	object setTopRight.
	self assert: object xAlign equals: #right.
	self assert: object yAlign equals: #top.
]
