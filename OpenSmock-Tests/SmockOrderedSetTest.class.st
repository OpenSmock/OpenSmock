Class {
	#name : #SmockOrderedSetTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockOrderedSetTest >> testAddFirst [
	| set |
	set := OrderedSet new.
	set add: #alue.
	set addFirst: #anotherValue.
	self assert: set asOrderedCollection first equals: #anotherValue.
]

{ #category : #tests }
SmockOrderedSetTest >> testAddLast [
	| set |
	set := OrderedSet new.
	set add: #alue.
	set addLast: #anotherValue.
	self assert: set asOrderedCollection last equals: #anotherValue.
]

{ #category : #tests }
SmockOrderedSetTest >> testAt [
	| set error |
	set := OrderedSet new.
	[set at: 1] on: Error do:[ :e |
		error := e.
	].
	self assert: (error isKindOf: Error).
]

{ #category : #tests }
SmockOrderedSetTest >> testIncludes [
	| set |
	set := OrderedSet new.
	set add: #value.
	self assert: (set includes: #value).
]

{ #category : #tests }
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

{ #category : #tests }
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
