Class {
	#name : #SmockGPolygon2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'points'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #accessing }
SmockGPolygon2D >> points [

	^ points
]

{ #category : #accessing }
SmockGPolygon2D >> points: anObject [

	points := anObject
]
