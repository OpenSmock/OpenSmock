Class {
	#name : #SmockGBitmap2D,
	#superclass : #SmockGLeafShape2D,
	#traits : 'TSmockAlignable + TSmockRotatable',
	#classTraits : 'TSmockAlignable classTrait + TSmockRotatable classTrait',
	#instVars : [
		'form',
		'scale',
		'alpha',
		'minDrawableScale',
		'maxDrawableScale'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #accessing }
SmockGBitmap2D >> alpha [

	^ alpha ifNil:[ alpha := 1 ]
]

{ #category : #accessing }
SmockGBitmap2D >> alpha: anObject [

	alpha := anObject
]

{ #category : #private }
SmockGBitmap2D >> computeBounds [

	| rectangle |
	(self form isNil or: [
		 self form width = 0 or: [ self form height = 0 ] ]) ifTrue: [
		^ super computeBounds ].

	"considere the form as a rectangle without rotation as well"
	rectangle := self form boundingBox.
	rectangle := rectangle scaleBy: self scale.
	rectangle := rectangle translateBy:
		             self position - (rectangle extent / 2).

	^ rectangle
]

{ #category : #accessing }
SmockGBitmap2D >> form [

	^ form
]

{ #category : #accessing }
SmockGBitmap2D >> form: anObject [

	form ~= anObject ifFalse: [ ^ self ].
	form := anObject.

	"reset bounds"
	self bounds: nil
]

{ #category : #testing }
SmockGBitmap2D >> isDrawable [
	"GBitmap not support super isDrawable due to fill/stroke style"

	self isVisible ifFalse: [ ^ false ].
	self position ifNil: [ ^ false ].
	self form ifNil: [ ^ false ].

	"scale limitations"
	self scale ~= 1 asPoint ifTrue: [
			(self scale x
				 between: self minDrawableScale
				 and: self maxDrawableScale) ifFalse: [ ^ false ].
			(self scale y
				 between: self minDrawableScale
				 and: self maxDrawableScale) ifFalse: [ ^ false ] ].

	^ true
]

{ #category : #accessing }
SmockGBitmap2D >> maxDrawableScale [

	^ maxDrawableScale ifNil: [ maxDrawableScale := 1000 ]
]

{ #category : #accessing }
SmockGBitmap2D >> maxDrawableScale: anObject [

	maxDrawableScale := anObject
]

{ #category : #accessing }
SmockGBitmap2D >> minDrawableScale [

	^ minDrawableScale ifNil: [ minDrawableScale := 0.001 ]
]

{ #category : #accessing }
SmockGBitmap2D >> minDrawableScale: anObject [

	minDrawableScale := anObject
]

{ #category : #'private - rotation' }
SmockGBitmap2D >> rotationHasChanged: aNewValue [

	"reset bounds"
	self bounds: nil
]

{ #category : #accessing }
SmockGBitmap2D >> scale [

	^ scale ifNil: [ scale := 1@1 ]
]

{ #category : #accessing }
SmockGBitmap2D >> scale: aPoint [

	scale ~= aPoint ifFalse: [ ^ self ].
	scale := aPoint.

	"reset bounds"
	self bounds: nil
]
