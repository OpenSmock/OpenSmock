"
A SmockDoubleBufferedSceneTest is a test class for testing the behavior of SmockDoubleBufferedScene
"
Class {
	#name : #SmockDoubleBufferedSceneTest,
	#superclass : #TestCase,
	#instVars : [
		'scene'
	],
	#category : #'OpenSmock-Tests-Buffer'
}

{ #category : #running }
SmockDoubleBufferedSceneTest >> setUp [

	super setUp.
	scene := SmockDoubleBufferedScene new
]

{ #category : #running }
SmockDoubleBufferedSceneTest >> testBuffersAreSceneBuffers [

	self assert: (scene currentBuffer isKindOf: SmockSceneBuffer).
	self assert: (scene nextBuffer isKindOf: SmockSceneBuffer).
]

{ #category : #running }
SmockDoubleBufferedSceneTest >> testBuffersSwap [

	| beforeCurrent beforeNext |
	beforeCurrent := scene currentBuffer.
	beforeNext := scene nextBuffer.

	scene swap.

	self assert: scene currentBuffer identicalTo: beforeNext.
	self assert: scene nextBuffer identicalTo: beforeCurrent
]

{ #category : #running }
SmockDoubleBufferedSceneTest >> testInitialBuffersAreDifferent [

	self deny: scene currentBuffer identicalTo: scene nextBuffer
]
