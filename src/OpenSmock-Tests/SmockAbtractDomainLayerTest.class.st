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
SmockAbtractDomainLayerTest >> testIsPickable [

	self deny: layer isPickable.

	layer isPickable: true.
	self assert: layer isPickable.

	layer isPickable: false.
	self deny: layer isPickable
]
