"
I am a Display Symbol.
I am used to display a Image (using SymbolProvider and a key) on a geo view.
"
Class {
	#name : #SmockDSymbol,
	#superclass : #SmockDLeafShape,
	#instVars : [
		'symbolKey',
		'orientation'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDSymbol >> = aDSymbol [
	"compare each values of the aDSymbol"

	super = aDSymbol ifFalse: [ ^ false ].
	self symbolKey ~= aDSymbol symbolKey ifTrue: [ ^ false ].
	self orientation ~= aDSymbol orientation ifTrue: [ ^ false ].
	
	^ true
]

{ #category : #copying }
SmockDSymbol >> copy [

	| copy |
	copy := super copy.
	copy symbolKey: self symbolKey.
	copy orientation: self orientation.
	^ copy
]

{ #category : #'draw mode' }
SmockDSymbol >> defaultDrawMode [

	^ #device
]

{ #category : #accessing }
SmockDSymbol >> orientation [

	^ orientation ifNil:[ orientation := 0 ]
]

{ #category : #accessing }
SmockDSymbol >> orientation: aNumber [

	orientation := aNumber
]

{ #category : #accessing }
SmockDSymbol >> symbolKey [

	^ symbolKey
]

{ #category : #accessing }
SmockDSymbol >> symbolKey: anObject [

	symbolKey := anObject
]
