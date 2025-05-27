Class {
	#name : #SmockGEllipse2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'radius1',
		'radius2',
		'orientation'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #testing }
SmockGEllipse2D >> isDrawable [ 

	super isDrawable ifFalse:[ ^ false ].
	self position ifNil: [ ^ false ].
	self radius1 ifNil: [ ^ false ].
	self radius1 = 0 ifTrue: [ ^ false ].
	self radius2 ifNil: [ ^ false ].
	self radius2 = 0 ifTrue: [ ^ false ].

	^ true	
]

{ #category : #accessing }
SmockGEllipse2D >> orientation [

	^ orientation
]

{ #category : #accessing }
SmockGEllipse2D >> orientation: anObject [

	orientation := anObject
]

{ #category : #accessing }
SmockGEllipse2D >> orientationInDegrees [

	^ orientation
]

{ #category : #accessing }
SmockGEllipse2D >> orientationInDegrees: anObject [

	orientation := anObject
]

{ #category : #accessing }
SmockGEllipse2D >> radius1 [

	^ radius1
]

{ #category : #accessing }
SmockGEllipse2D >> radius1: anObject [

	radius1 := anObject
]

{ #category : #accessing }
SmockGEllipse2D >> radius2 [

	^ radius2
]

{ #category : #accessing }
SmockGEllipse2D >> radius2: anObject [

	radius2 := anObject
]
