"
A SmockLayeredViewElementTest is a test class for testing the behavior of SmockLayeredViewElement
"
Class {
	#name : #SmockDomainViewElementTest,
	#superclass : #TestCase,
	#instVars : [
		'view'
	],
	#category : #'OpenSmock-Bloc-Tests-Model'
}

{ #category : #running }
SmockDomainViewElementTest >> setUp [

	super setUp.

	view := SmockDomainViewElement new
]

{ #category : #tests }
SmockDomainViewElementTest >> testAddLayer [

	| layer |
	layer := SmockTestLayer new name: #test.
	view addLayer: layer.
	
	self assert: (view getLayer: #test) equals: layer.
]

{ #category : #tests }
SmockDomainViewElementTest >> testGetLayer [

	self assert: (view getLayer: #test) isNil
]

{ #category : #tests }
SmockDomainViewElementTest >> testGetLayers [

	self assert: view getLayers isEmpty
]

{ #category : #tests }
SmockDomainViewElementTest >> testRemoveAllLayers [

	view addLayer: (SmockTestLayer new name: #test).
	view addLayer: (SmockTestLayer new name: #test2).
	view addLayer: (SmockTestLayer new name: #test3).

	self assert: view getLayers size equals: 3.
	self assert: (view getLayer: #test) notNil.
	self assert: (view getLayer: #test2) notNil.
	self assert: (view getLayer: #test3) notNil.

	view removeAllLayers.
	self assert: view getLayers size equals: 0.
	self assert: (view getLayer: #test) isNil.
	self assert: (view getLayer: #test2) isNil.
	self assert: (view getLayer: #test3) isNil.
]

{ #category : #tests }
SmockDomainViewElementTest >> testRemoveLayer [

	| layer |
	layer := SmockTestLayer new name: #test.
	view addLayer: layer.
	view removeLayer: layer.

	self assert: view getLayers size equals: 0.
	self assert: (view getLayer: #test) isNil
]
