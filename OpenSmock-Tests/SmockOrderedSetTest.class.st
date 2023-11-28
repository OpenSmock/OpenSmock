Class {
	#name : #SmockOrderedSetTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases'
}

{ #category : #test }
SmockOrderedSetTest >> testAddFirst [
	| set |
	set := OrderedSet new.
	set add: #alue.
	set addFirst: #anotherValue.
	self assert: set asOrderedCollection first equals: #anotherValue.
]

{ #category : #test }
SmockOrderedSetTest >> testAddLast [
	| set |
	set := OrderedSet new.
	set add: #alue.
	set addLast: #anotherValue.
	self assert: set asOrderedCollection last equals: #anotherValue.
]

{ #category : #test }
SmockOrderedSetTest >> testAt [
	| set error |
	set := OrderedSet new.
	[set at: 1] on: Error do:[ :e |
		error := e.
	].
	self assert: (error isKindOf: Error).
]

{ #category : #test }
SmockOrderedSetTest >> testIncludes [
	| set |
	set := OrderedSet new.
	set add: #value.
	self assert: (set includes: #value).
]

{ #category : #test }
SmockOrderedSetTest >> testInspect [
	"Test if there is no problem to visualy inspect this object"
	
	| set inspector |
	set := OrderedSet new.
	inspector := set inspector.
	self assert: inspector isOpen. 
	
	inspector close.
]

{ #category : #tests }
SmockOrderedSetTest >> testOrderedSet [
	| set |
	set := OrderedSet new.
	self assert: set size equals: 0.
	self assert: set isEmpty.
]

{ #category : #test }
SmockOrderedSetTest >> testRemoveIfAbsent [
	| set notRemoved |
	set := OrderedSet new.
	set add: #value.
	notRemoved := false.
	set remove: #anotherValue ifAbsent:[notRemoved := true].
	self assert: notRemoved.
	notRemoved := false.
	set remove: #value ifAbsent:[notRemoved := true].
	self assert: notRemoved equals: false.
]
