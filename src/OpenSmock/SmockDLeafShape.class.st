"
I am a Display Leaf Shape.
I display a final graphic element.
"
Class {
	#name : #SmockDLeafShape,
	#superclass : #SmockDShape,
	#traits : 'TSmockHavePaintStyles',
	#classTraits : 'TSmockHavePaintStyles classTrait',
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDLeafShape >> = aDLeafShape [
	"compare each values of the DLeafShape"

	super = aDLeafShape ifFalse: [ ^ false ].
	self drawMode ~= aDLeafShape drawMode ifTrue: [ ^ false ].
	self fillStyle ~= aDLeafShape fillStyle ifTrue: [ ^ false ].
	self strokeStyle ~= aDLeafShape strokeStyle ifTrue: [ ^ false ].

	^ true
]

{ #category : #copying }
SmockDLeafShape >> copy [

	| copy |
	copy := super copy.
	copy drawMode: self drawMode.
	copy fillStyle: self fillStyle copy.
	copy strokeStyle: self strokeStyle copy.

	^copy
]

{ #category : #testing }
SmockDLeafShape >> isLeaf [

	^ true
]
