Class {
	#name : #SmockGPolygon2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'points'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #comparing }
SmockGPolygon2D >> distanceTo: aPoint select: aSelectBlock [

	| maxDistance vertices |
	maxDistance := SmallInteger maxVal.
	(aSelectBlock notNil and: [ aSelectBlock value: self ]) ifFalse: [
		^ maxDistance ].
	self points isEmptyOrNil ifTrue: [ ^ maxDistance ].

	"create a list of points which is closed with the first point"
	vertices := self points asOrderedCollection add: (self points first); yourself.

	"If the polygone have fill style or not, distance has not the same behavior"
	^ self fillStyle
		  ifNil: [ self distanceTo: aPoint fromPointsPerimeter: vertices ]
		  ifNotNil: [ self distanceTo: aPoint fromPoints: vertices ]
]

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
