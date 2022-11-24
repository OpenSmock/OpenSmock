Class {
	#name : #OrderedSetTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #test }
OrderedSetTest >> testAddFirst [
	| set |
	set := OrderedSet new.
	set add: #alue.
	set addFirst: #anotherValue.
	self assert: set asOrderedCollection first equals: #anotherValue.
]

{ #category : #test }
OrderedSetTest >> testAddLast [
	| set |
	set := OrderedSet new.
	set add: #alue.
	set addLast: #anotherValue.
	self assert: set asOrderedCollection last equals: #anotherValue.
]

{ #category : #test }
OrderedSetTest >> testAt [
	| set error |
	set := OrderedSet new.
	[set at: 1] on: Error do:[ :e |
		error := e.
	].
	self assert: (error isKindOf: Error).
]

{ #category : #test }
OrderedSetTest >> testIncludes [
	| set |
	set := OrderedSet new.
	set add: #value.
	self assert: (set includes: #value).
]

{ #category : #test }
OrderedSetTest >> testInspect [
	"Test if there is no problem to visualy inspect this object"
	
	| set inspector |
	set := OrderedSet new.
	inspector := set inspector.
	self assert: inspector isOpen. 
	
	inspector close.
]

{ #category : #tests }
OrderedSetTest >> testOrderedSet [
	| set |
	set := OrderedSet new.
	self assert: set size equals: 0.
	self assert: set isEmpty.
]

{ #category : #test }
OrderedSetTest >> testRemoveIfAbsent [
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
