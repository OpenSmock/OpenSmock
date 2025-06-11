"
An OrderedSetTest is a test class for testing the behavior of OrderedSet
"
Class {
	#name : #OrderedSetTest,
	#superclass : #TestCase,
	#instVars : [
		'set'
	],
	#category : #'OpenSmock-Tests-Collections'
}

{ #category : #running }
OrderedSetTest >> setUp [
	super setUp.

	set := OrderedSet new
]

{ #category : #running }
OrderedSetTest >> testAdd [

	self assert: set size equals: 0.

	set add: #toto.
	self assert: set size equals: 1.
	
	set add: #tata.
	self assert: set size equals: 2
]

{ #category : #running }
OrderedSetTest >> testIncludes [

	self deny: (set includes: #toto).
	self deny: (set includes: #tata).

	set add: #toto; add: #tata.
	self assert: (set includes: #toto).
	self assert: (set includes: #tata).
]

{ #category : #running }
OrderedSetTest >> testRemove [

	set add: #toto; add: #tata.
	set remove: #tata.
	
	self assert: (set includes: #toto).
	self deny: (set includes: #tata).
]

{ #category : #running }
OrderedSetTest >> testRemoveIfAbsent [

	| trigger |
	trigger := false.
	set add: #toto; add: #tata.
	set remove: #titi ifAbsent:[ trigger := true].
	
	self assert: trigger.
]
