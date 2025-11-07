Class {
	#name : #SmockGBitmap2D,
	#superclass : #SmockGLeafShape2D,
	#traits : 'TSmockAlignable + TSmockRotatable',
	#classTraits : 'TSmockAlignable classTrait + TSmockRotatable classTrait',
	#instVars : [
		'form',
		'scale',
		'alpha'
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
SmockGBitmap2D >> distanceTo: aPoint [

	| bounds gRectangle |
	self position ifNil:[ ^ SmallInteger maxVal ].
	(self form isNil or:[self form width = 0 or:[ self form height = 0]]) ifTrue:[ ^ SmallInteger maxVal ].
	
	"considere the form as a rectangle without rotation as well"
	bounds := self form boundingBox.
	bounds := bounds scaleBy: self scale.
	bounds := bounds translateBy: (self position - (bounds extent / 2)).
	
	gRectangle := GRectangle origin: bounds origin corner: bounds corner.
	(gRectangle includes: aPoint) 
		ifTrue:[ ^ 0 ] 
		ifFalse:[ | gPoints gPoint distance |
		gPoints := gRectangle intersectionsWith: (GLine through: aPoint and: gRectangle center).
		gPoints ifEmpty:[ ^ SmallInteger maxVal ].
		
		distance := SmallInteger maxVal.
		gPoint := aPoint asGPoint.
		gPoints do:[ :p | | currentDistance |
			currentDistance := p distanceTo: gPoint.
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

	self isVisible ifFalse:[ ^ false ].
	self position ifNil: [ ^ false ].
	self form ifNil: [ ^ false ].
	
	^ true
]

{ #category : #accessing }
SmockGBitmap2D >> scale [

	^ scale ifNil: [ scale := 1@1 ]
]

{ #category : #accessing }
SmockGBitmap2D >> scale: aPoint [

	scale := aPoint
]
