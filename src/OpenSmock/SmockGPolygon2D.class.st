Class {
	#name : #SmockGPolygon2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'points'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #testing }
SmockGPolygon2D >> isDrawable [

	super isDrawable ifFalse: [ ^ false ].

	self points ifNil: [ ^ false ].
	self points size > 1 ifFalse: [ ^ false ].

	^ true
]

{ #category : #accessing }
SmockGPolygon2D >> points [

	^ points
]

{ #category : #accessing }
SmockGPolygon2D >> points: anObject [

	points := anObject
]
