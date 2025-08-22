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
