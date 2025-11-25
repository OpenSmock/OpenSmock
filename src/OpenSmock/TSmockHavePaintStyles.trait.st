Trait {
	#name : #TSmockHavePaintStyles,
	#instVars : [
		'fillStyle',
		'strokeStyle'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #'paint styles' }
TSmockHavePaintStyles >> fillColor: aColor [
	"syntaxic sugar"

	self fillStyle ifNil: [ self initializeFillStyle ].
	self fillStyle paint: aColor
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> fillPaint [
	
	^ self fillStyle ifNil: [ nil ] ifNotNil: [ :e | e paint ]
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> fillStyle [

	^ fillStyle
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> fillStyle: anObject [

	fillStyle := anObject
]

{ #category : #private }
TSmockHavePaintStyles >> initializeFillStyle [

	fillStyle := Color white asSmockFillStyle 
]

{ #category : #private }
TSmockHavePaintStyles >> initializeStrokeStyle [

	strokeStyle := Color black asSmockStrokeStyle 
]

{ #category : #testing }
TSmockHavePaintStyles >> isTransparent [

	| fillTransparent strokeTransparent |
	fillTransparent := self fillStyle
		                   ifNotNil: [ :e | e isTransparent ]
		                   ifNil: [ true ].
	strokeTransparent := self strokeStyle
		                     ifNotNil: [ :e | e isTransparent ]
		                     ifNil: [ true ].

	^ fillTransparent and: [ strokeTransparent ]
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> strokeColor: aColor [
	"syntaxic sugar"

	self strokeStyle ifNil: [ self initializeStrokeStyle ].
	self strokeStyle paint: aColor
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> strokePaint [

	^ self strokeStyle ifNil: [ nil ] ifNotNil: [ :e | e paint ]
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> strokeStyle [

	^ strokeStyle
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> strokeStyle: anObject [

	strokeStyle := anObject
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> strokeWidth [

	^ self strokeStyle ifNil: [ nil ] ifNotNil: [ :e | e width ]
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> strokeWidth: aNumber [
	"warning: this is a syntaxic sugar"

	self strokeStyle ifNil: [ self initializeStrokeStyle ].
	self strokeStyle width: aNumber
]
