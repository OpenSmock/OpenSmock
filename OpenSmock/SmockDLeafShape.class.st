"
I am a Display Leaf Shape.
I display a final graphic element.
"
Class {
	#name : #SmockDLeafShape,
	#superclass : #SmockDShape,
	#instVars : [
		'strokeWidth',
		'strokePattern',
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
	copy fillColor: self fillColor copy.
	copy strokeColor: self strokeColor copy.
	copy strokeWidth: self strokeWidth.
	copy strokePattern: self strokePattern copy.
	^copy
]

{ #category : #accessing }
SmockDLeafShape >> drawMode [
	drawMode ifNil: [ ^ #device ].
	^ drawMode
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

	strokeStyle := aColor ifNotNil: [ :c | c asSmockFillStyle ]
]

{ #category : #accessing }
SmockDLeafShape >> strokePattern [

	self flag:'labordep: return strokeStyle pattern'.
	^ strokePattern
]

{ #category : #accessing }
SmockDLeafShape >> strokePattern: anArray [

	strokePattern := anArray
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

	self flag:'labordep: return strokeStyle width'.
	^ strokeWidth
]

{ #category : #accessing }
SmockDLeafShape >> strokeWidth: aFloat [

	strokeWidth := aFloat
]
