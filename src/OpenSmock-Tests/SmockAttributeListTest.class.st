"
A SmockAttributeListTest is a test class for testing the behavior of SmockAttributeList
"
Class {
	#name : #SmockAttributeListTest,
	#superclass : #TestCase,
	#instVars : [
		'list'
	],
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #running }
SmockAttributeListTest >> setUp [

	super setUp.

	list := SmockAttributeList new
]

{ #category : #tests }
SmockAttributeListTest >> testAddAllAttributes [

	list addAllAttributes: { #typeA . #typeB . #typeB }. 
	self assert: list nbAttributes equals: 2.
	self assert: (list attributes includes: #typeA).
	self assert: (list attributes includes: #typeB).
]

{ #category : #tests }
SmockAttributeListTest >> testAddAttribute [

	list addAttribute: #typeA.
	self assert: list nbAttributes equals: 1.
	self assert: (list attributes includes: #typeA).
	
	list addAttribute: #typeB.
	self assert: list nbAttributes equals: 2.
	self assert: (list attributes includes: #typeB).
	
	list addAttribute: #typeB.
	self assert: list nbAttributes equals: 2.
	self assert: (list attributes includes: #typeB).
]

{ #category : #tests }
SmockAttributeListTest >> testAttributes [

	self assert: list attributes isEmpty
]

{ #category : #tests }
SmockAttributeListTest >> testFromObject [

	list := SmockAttributeList fromObject: #prop1.
	self assert: list attributes equals: ({ #prop1 } asSet)
]

{ #category : #tests }
SmockAttributeListTest >> testFromObjects [

	list := SmockAttributeList fromObjects: { #prop1 . #prop2 }.
	self assert: list attributes equals: ({ #prop1 . #prop2 } asSet)
]

{ #category : #tests }
SmockAttributeListTest >> testHasAttribute [

	self deny: (list hasAttribute: nil).
	self deny: (list hasAttribute: #attribute1).

	list addAttribute: #attribute1.
	self assert: (list hasAttribute: #attribute1)
]

{ #category : #tests }
SmockAttributeListTest >> testNbAttributes [

	self assert: list nbAttributes equals: 0
]

{ #category : #tests }
SmockAttributeListTest >> testRemoveAttribute [

	list addAttribute: #typeA.
	self assert: (list attributes includes: #typeA).

	list removeAttribute: #typeA.
	self deny: (list attributes includes: #typeA)
]
