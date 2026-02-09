"
A SmockLayerTest is a test class for testing the behavior of SmockLayer
"
Class {
	#name : #SmockAbtractDomainLayerTest,
	#superclass : #TestCase,
	#instVars : [
		'layer'
	],
	#category : #'OpenSmock-Tests-Model'
}

{ #category : #running }
SmockAbtractDomainLayerTest >> setUp [
	super setUp.

	layer := SmockTestLayer new
]

{ #category : #tests }
SmockAbtractDomainLayerTest >> testPickable [

	self deny: layer pickable.

	layer pickable: true.
	self assert: layer pickable.

	layer pickable: false.
	self deny: layer pickable
]
