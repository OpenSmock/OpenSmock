"
A SmockSceneBufferTest is a test class for testing the behavior of SmockSceneBuffer
"
Class {
	#name : #SmockSceneBufferTest,
	#superclass : #TestCase,
	#instVars : [
		'buffer',
		'dummyContent'
	],
	#category : #'OpenSmock-Tests-Buffer'
}

{ #category : #running }
SmockSceneBufferTest >> setUp [

	buffer := SmockSceneBuffer new.
	dummyContent := Object new
]

{ #category : #running }
SmockSceneBufferTest >> testClear [

	buffer content: dummyContent.
	buffer clear.
	self assert: buffer content isNil
]

{ #category : #running }
SmockSceneBufferTest >> testContent [

	buffer content: dummyContent.
	self assert: buffer content identicalTo: dummyContent
]

{ #category : #running }
SmockSceneBufferTest >> testName [

	buffer name: 'TestBuffer'.
	self assert: buffer name equals: 'TestBuffer'
]
