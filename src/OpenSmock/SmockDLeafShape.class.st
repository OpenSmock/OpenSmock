"
I am a Display Leaf Shape.
I display a final graphic element.
"
Class {
	#name : #SmockDLeafShape,
	#superclass : #SmockDShape,
	#instVars : [
		'fillStyle',
		'strokeStyle'
	],
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

{ #category : #styling }
SmockDLeafShape >> fillColor: aColor [
	"warning: this is a syntaxic sugar"

	fillStyle ifNil: [ self initializeFillStyle ].
	fillStyle paint: aColor
]

{ #category : #styling }
SmockDLeafShape >> fillPaint [
	
	^ fillStyle ifNil: [ nil ] ifNotNil: [ :e | e paint ]
]

{ #category : #accessing }
SmockDLeafShape >> fillStyle [

	^ fillStyle
]

{ #category : #accessing }
SmockDLeafShape >> fillStyle: aFillStyle [

	fillStyle := aFillStyle
]

{ #category : #initialization }
SmockDLeafShape >> initializeFillStyle [

	fillStyle := Color white asSmockFillStyle 
]

{ #category : #initialization }
SmockDLeafShape >> initializeStrokeStyle [

	strokeStyle := Color black asSmockStrokeStyle 
]

{ #category : #'draw mode' }
SmockDLeafShape >> isLeaf [

	^ true
]

{ #category : #styling }
SmockDLeafShape >> strokeColor: aColor [
	"warning: this is a syntaxic sugar"

	strokeStyle ifNil: [ self initializeStrokeStyle ].
	strokeStyle paint: aColor
]

{ #category : #styling }
SmockDLeafShape >> strokePaint [

	^ strokeStyle ifNil: [ nil ] ifNotNil: [ :e | e paint ]
]

{ #category : #accessing }
SmockDLeafShape >> strokeStyle [

	^ strokeStyle
]

{ #category : #accessing }
SmockDLeafShape >> strokeStyle: aStrokeStyle [

	strokeStyle := aStrokeStyle
]

{ #category : #styling }
SmockDLeafShape >> strokeWidth [

	^ strokeStyle ifNil: [ nil ] ifNotNil: [ :e | e width ]
]

{ #category : #styling }
SmockDLeafShape >> strokeWidth: aNumber [
	"warning: this is a syntaxic sugar"

	strokeStyle ifNil: [ self initializeStrokeStyle ].
	strokeStyle width: aNumber
]
