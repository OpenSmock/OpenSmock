Class {
	#name : #SmockStrokeStyle,
	#superclass : #SmockPaintStyle,
	#instVars : [
		'dashes',
		'dashOffset',
		'width',
		'lineJoin',
		'lineCap',
		'miterLimit',
		'borderStyle'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #'instance creation' }
SmockStrokeStyle class >> paint: aColor [

	| tmp |
	tmp := self new initialize.
	tmp paint: aColor.
	^ tmp
]

{ #category : #'instance creation' }
SmockStrokeStyle class >> paint: aColor width: aWidth [

	| tmp |
	tmp := self paint: aColor.
	tmp width: aWidth.
	^ tmp
]

{ #category : #testing }
SmockStrokeStyle >> = aStrokeStyle [

	super = aStrokeStyle ifFalse:[ ^ false ].
	self dashes = aStrokeStyle dashes ifFalse:[ ^ false ].
	self dashOffset = aStrokeStyle dashOffset ifFalse:[ ^ false ].
	self width = aStrokeStyle width ifFalse:[ ^ false ].
	self lineJoin = aStrokeStyle lineJoin ifFalse:[ ^ false ].
	self lineCap = aStrokeStyle lineCap ifFalse:[ ^ false ].
	self miterLimit = aStrokeStyle miterLimit ifFalse:[ ^ false ].
	self borderStyle = aStrokeStyle borderStyle ifFalse:[ ^ false ].
		
	^ true
]

{ #category : #accessing }
SmockStrokeStyle >> borderStyle [

	^ borderStyle ifNil: [ borderStyle := #center ]
]

{ #category : #accessing }
SmockStrokeStyle >> borderStyle: anObject [

	borderStyle := anObject
]

{ #category : #accessing }
SmockStrokeStyle >> dashOffset [

	^ dashOffset ifNil: [ dashOffset := 0.0 ]
]

{ #category : #accessing }
SmockStrokeStyle >> dashOffset: anObject [

	dashOffset := anObject
]

{ #category : #accessing }
SmockStrokeStyle >> dashes [

	^ dashes
]

{ #category : #accessing }
SmockStrokeStyle >> dashes: anObject [

	dashes := anObject
]

{ #category : #initialization }
SmockStrokeStyle >> initialize [

	super initialize.
	
	self dashOffset.
	self lineCap.
	self lineJoin.
	self miterLimit.
	self width.
	self paint: Color black.
]

{ #category : #accessing }
SmockStrokeStyle >> lineCap [

	^ lineCap ifNil: [ lineCap := #butt ]
]

{ #category : #accessing }
SmockStrokeStyle >> lineCap: anObject [

	lineCap := anObject
]

{ #category : #accessing }
SmockStrokeStyle >> lineJoin [

	^ lineJoin ifNil: [ lineJoin := #mitter ]
]

{ #category : #accessing }
SmockStrokeStyle >> lineJoin: anObject [

	lineJoin := anObject
]

{ #category : #accessing }
SmockStrokeStyle >> miterLimit [

	^ miterLimit ifNil: [ miterLimit := 4 ]
]

{ #category : #accessing }
SmockStrokeStyle >> miterLimit: anObject [

	miterLimit := anObject
]

{ #category : #accessing }
SmockStrokeStyle >> width [

	^ width ifNil: [ width := 1 ]
]

{ #category : #accessing }
SmockStrokeStyle >> width: anObject [

	width := anObject
]
