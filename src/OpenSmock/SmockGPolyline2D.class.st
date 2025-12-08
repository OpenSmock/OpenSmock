Class {
	#name : #SmockGPolyline2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'points'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #comparing }
SmockGPolyline2D >> distanceTo: aPoint select: aSelectBlock [

	| distance |

	distance := SmallInteger maxVal.
	(aSelectBlock notNil and: [ aSelectBlock value: self ]) ifFalse: [
		^ distance ].
	
	self points isEmptyOrNil ifTrue:[^distance].
	self points overlappingPairsDo: [:p1 :p2 | | newDist gSegment |
		gSegment := GSegment with: p1 with: p2.
		newDist := gSegment distanceTo: aPoint.
		newDist ifNotNil:[:e | distance := e min: distance ]
	].
	^distance
]

{ #category : #testing }
SmockGPolyline2D >> isDrawable [ 

	super isDrawable ifFalse:[ ^ false ].
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
