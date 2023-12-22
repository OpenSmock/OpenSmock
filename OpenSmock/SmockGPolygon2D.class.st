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

	self points ifNil: [ ^ false ].
	self points ifEmpty: [ ^ false ].

	^ super isDrawable
	
]

{ #category : #accessing }
SmockGPolygon2D >> points [

	^ points
]

{ #category : #accessing }
SmockGPolygon2D >> points: anObject [

	points := anObject
]
