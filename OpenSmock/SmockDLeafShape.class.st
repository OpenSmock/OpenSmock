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

{ #category : #copying }
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
	copy zIndex: self zIndex.
	^copy
]

{ #category : #accessing }
SmockDLeafShape >> drawMode [

	^ drawMode ifNil: [ drawMode := #device ]
]

{ #category : #accessing }
SmockDLeafShape >> drawMode: anObject [
	drawMode := anObject
]

{ #category : #accessing }
SmockDLeafShape >> fillColor [

	self deprecated:'dont use fillColor, use fillStyle and detect if the style is a color'.
	^ fillStyle
]

{ #category : #accessing }
SmockDLeafShape >> fillColor: aColor [

	fillStyle := aColor ifNotNil: [ :c | c asSmockFillStyle ]
]

{ #category : #accessing }
SmockDLeafShape >> fillStyle [

	^ fillStyle
]

{ #category : #accessing }
SmockDLeafShape >> fillStyle: aFillStyle [

	fillStyle := aFillStyle
]

{ #category : #'draw mode' }
SmockDLeafShape >> isDrawModeDevice [
	^self drawMode = #device
]

{ #category : #'draw mode' }
SmockDLeafShape >> isDrawModeUser [
	^self drawMode = #user
]

{ #category : #'draw mode' }
SmockDLeafShape >> isDrawModeUserProjected [
	^self drawMode = #userProjected
]

{ #category : #'draw mode' }
SmockDLeafShape >> isLeaf [

	^ true
]

{ #category : #'draw mode' }
SmockDLeafShape >> setDrawModeDevice [
	self drawMode: #device
]

{ #category : #'draw mode' }
SmockDLeafShape >> setDrawModeUser [
	self drawMode: #user
]

{ #category : #'draw mode' }
SmockDLeafShape >> setDrawModeUserProjected [
	self drawMode: #userProjected
]

{ #category : #accessing }
SmockDLeafShape >> strokeColor [

	self deprecated:'dont use strokeColor, use strokeStyle and detect if the style is a color'.
	^ strokeStyle
]

{ #category : #accessing }
SmockDLeafShape >> strokeColor: aColor [
	"warning: this is a syntaxic sugar, if you use it you will lost previous style properties"

	strokeStyle := aColor ifNotNil: [ :c | c asSmockStrokeStyle ]
]

{ #category : #accessing }
SmockDLeafShape >> strokePattern [

	self deprecated:'use style API'.
	"^ strokePattern"
]

{ #category : #accessing }
SmockDLeafShape >> strokePattern: anArray [

	self deprecated:'use style API'.
]

{ #category : #accessing }
SmockDLeafShape >> strokeStyle [

	^ strokeStyle
]

{ #category : #accessing }
SmockDLeafShape >> strokeStyle: aStrokeStyle [

	strokeStyle := aStrokeStyle
]

{ #category : #accessing }
SmockDLeafShape >> strokeWidth [

	self deprecated:'use style API'.
]

{ #category : #accessing }
SmockDLeafShape >> strokeWidth: aFloat [

	self deprecated:'use style API'.
]
