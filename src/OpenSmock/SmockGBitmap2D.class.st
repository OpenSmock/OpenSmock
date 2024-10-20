Class {
	#name : #SmockGBitmap2D,
	#superclass : #SmockGLeafShape2D,
	#traits : 'TSmockAlignable',
	#classTraits : 'TSmockAlignable classTrait',
	#instVars : [
		'form',
		'rotation',
		'scale',
		'alpha',
		'colorMask'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #accessing }
SmockGBitmap2D >> alpha [

	^ alpha ifNil:[ alpha := 1.0 ]
]

{ #category : #accessing }
SmockGBitmap2D >> alpha: anObject [

	alpha := anObject
]

{ #category : #accessing }
SmockGBitmap2D >> colorMask [
	
	^ colorMask
]

{ #category : #accessing }
SmockGBitmap2D >> colorMask: anObject [

	colorMask := anObject
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

	^ rotation ifNil: [ rotation := 0 ]
]

{ #category : #accessing }
SmockGBitmap2D >> rotation: anObject [

	rotation := anObject
]

{ #category : #accessing }
SmockGBitmap2D >> scale [

	^ scale ifNil: [ scale := 1.0 ]
]

{ #category : #accessing }
SmockGBitmap2D >> scale: anObject [

	scale := anObject
]
