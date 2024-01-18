"
A TSmockGAlignableTest is a test class for testing the behavior of TSmockGAlignable
"
Class {
	#name : #TSmockGAlignableTest,
	#superclass : #TestCase,
	#instVars : [
		'object'
	],
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #running }
TSmockGAlignableTest >> setUp [

	super setUp.
	object := SmockGAlignableUserTestClass new.
]

{ #category : #running }
TSmockGAlignableTest >> tearDown [

	object := nil.
	super tearDown
]

{ #category : #tests }
TSmockGAlignableTest >> testInitialize [

	self assert: object xAlign equals: #center.
	self assert: object yAlign equals: #center.
]

{ #category : #tests }
TSmockGAlignableTest >> testSetBottomCenter [

	object setBottomCenter.
	self assert: object xAlign equals: #center.
	self assert: object yAlign equals: #bottom.
]

{ #category : #tests }
TSmockGAlignableTest >> testSetBottomLeft [

	object setBottomLeft.
	self assert: object xAlign equals: #left.
	self assert: object yAlign equals: #bottom.
]

{ #category : #tests }
TSmockGAlignableTest >> testSetBottomRight [

	object setBottomRight.
	self assert: object xAlign equals: #right.
	self assert: object yAlign equals: #bottom.
]

{ #category : #tests }
TSmockGAlignableTest >> testSetCenter [

	object setCenter.
	self assert: object xAlign equals: #center.
	self assert: object yAlign equals: #center.
]

{ #category : #tests }
TSmockGAlignableTest >> testSetLeft [

	object setLeft.
	self assert: object xAlign equals: #left.
	self assert: object yAlign equals: #center.
]

{ #category : #tests }
TSmockGAlignableTest >> testSetRight [

	object setRight.
	self assert: object xAlign equals: #right.
	self assert: object yAlign equals: #center.
]

{ #category : #tests }
TSmockGAlignableTest >> testSetTopCenter [

	object setTopCenter.
	self assert: object xAlign equals: #center.
	self assert: object yAlign equals: #top.
]

{ #category : #tests }
TSmockGAlignableTest >> testSetTopLeft [

	object setTopLeft.
	self assert: object xAlign equals: #left.
	self assert: object yAlign equals: #top.
]

{ #category : #tests }
TSmockGAlignableTest >> testSetTopRight [

	object setTopRight.
	self assert: object xAlign equals: #right.
	self assert: object yAlign equals: #top.
]
