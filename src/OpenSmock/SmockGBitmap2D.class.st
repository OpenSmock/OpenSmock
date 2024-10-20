Class {
	#name : #SmockGBitmap2D,
	#superclass : #SmockGLeafShape2D,
	#traits : 'TSmockAlignable',
	#classTraits : 'TSmockAlignable classTrait',
	#instVars : [
		'form',
		'scale',
		'alpha',
		'rotationAngleInDegrees'
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
SmockGBitmap2D >> rotation [

	^ rotationAngleInDegrees ifNil: [ rotationAngleInDegrees := 0 ]
]

{ #category : #accessing }
SmockGBitmap2D >> rotation: anAngleInDegrees [

	rotationAngleInDegrees := anAngleInDegrees
]

{ #category : #accessing }
SmockGBitmap2D >> scale [

	^ scale ifNil: [ scale := 1@1 ]
]

{ #category : #accessing }
SmockGBitmap2D >> scale: aPoint [

	scale := aPoint
]
