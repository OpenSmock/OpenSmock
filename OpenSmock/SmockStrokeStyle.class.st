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

{ #category : #accessing }
SmockStrokeStyle >> borderStyle [
borderStyle ifNil:[ borderStyle := #center].
	^ borderStyle
]

{ #category : #accessing }
SmockStrokeStyle >> borderStyle: anObject [

	borderStyle := anObject
]

{ #category : #accessing }
SmockStrokeStyle >> dashOffset [
	dashOffset ifNil: [ dashOffset := 0.0 ].
	^ dashOffset
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
	lineCap ifNil:[lineCap := #butt].
	^ lineCap
]

{ #category : #accessing }
SmockStrokeStyle >> lineCap: anObject [

	lineCap := anObject
]

{ #category : #accessing }
SmockStrokeStyle >> lineJoin [
	lineJoin ifNil:[lineJoin := #mitter ].
	^ lineJoin
]

{ #category : #accessing }
SmockStrokeStyle >> lineJoin: anObject [

	lineJoin := anObject
]

{ #category : #accessing }
SmockStrokeStyle >> miterLimit [
miterLimit ifNil:[miterLimit :=4].
	^ miterLimit
]

{ #category : #accessing }
SmockStrokeStyle >> miterLimit: anObject [

	miterLimit := anObject
]

{ #category : #accessing }
SmockStrokeStyle >> width [
	width ifNil:[width := 1].
	^ width
]

{ #category : #accessing }
SmockStrokeStyle >> width: anObject [

	width := anObject
]
