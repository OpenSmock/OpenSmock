Class {
	#name : #SmockGPolyline2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'points'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #testing }
SmockGPolyline2D >> isDrawable [

	super isDrawable ifFalse: [ ^ false ].

	self points ifNil: [ ^ false ].
	self points size > 1 ifFalse: [ ^ false ].

	^ true
]

{ #category : #accessing }
SmockGPolyline2D >> points [

	^ points
]

{ #category : #accessing }
SmockGPolyline2D >> points: anObject [

	points := anObject
]
