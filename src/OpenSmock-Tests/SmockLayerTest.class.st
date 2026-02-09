"
A SmockLayerTest is a test class for testing the behavior of SmockLayer
"
Class {
	#name : #SmockLayerTest,
	#superclass : #TestCase,
	#instVars : [
		'layer'
	],
	#category : #'OpenSmock-Tests-Model'
}

{ #category : #running }
SmockLayerTest >> setUp [
	super setUp.

	layer := SmockLayer new
]

{ #category : #tests }
SmockLayerTest >> testPickable [

	self deny: layer pickable.

	layer pickable: true.
	self assert: layer pickable.

	layer pickable: false.
	self deny: layer pickable
]
