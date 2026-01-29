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

{ #category : #comparing }
SmockGBitmap2D >> distanceTo: aPoint select: aSelectBlock [

	| rectangle gRectangle distance |
	
	self flag:'labordep: refactor compute bounds with the code below'.
	
	distance := SmallInteger maxVal.
	(aSelectBlock notNil and: [ aSelectBlock value: self ]) ifFalse: [
		^ distance ].
	self position ifNil:[ ^ distance ].
	(self form isNil or:[self form width = 0 or:[ self form height = 0]]) ifTrue:[ ^ distance ].
	
	"considere the form as a rectangle without rotation as well"
	rectangle := self form boundingBox.
	rectangle := rectangle scaleBy: self scale.
	rectangle := rectangle translateBy: (self position - (rectangle extent / 2)).
	
	gRectangle := GRectangle origin: rectangle origin corner: rectangle corner.
	(gRectangle includes: aPoint) 
		ifTrue:[ ^ 0 ] 
		ifFalse:[ | gPoints gPoint |
		gPoints := gRectangle intersectionsWith: (GLine through: aPoint and: gRectangle center).
		gPoints ifEmpty:[ ^ SmallInteger maxVal ].
		
		gPoint := aPoint asGPoint.
		gPoints do:[ :p | | currentDistance |
			currentDistance := p distanceTo: gPoint.
			currentDistance = 0 ifTrue:[ ^ 0 ].
			distance := distance min: currentDistance.
		].		
		^ distance
	].
]

{ #category : #accessing }
SmockGBitmap2D >> form [

	^ form
]

{ #category : #accessing }
SmockGBitmap2D >> form: anObject [

	form := anObject
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

{ #category : #accessing }
SmockGBitmap2D >> scale [

	^ scale ifNil: [ scale := 1@1 ]
]

{ #category : #accessing }
SmockGBitmap2D >> scale: aPoint [

	scale := aPoint
]
