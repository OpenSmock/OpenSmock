"
I am a Display Polyline.
I am used to display a polyline on geo view.
"
Class {
	#name : #SmockDPolyline,
	#superclass : #SmockDLeafShape,
	#instVars : [
		'points'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDPolyline >> = aDPolyline [
	"compare each values of the aDPolyline"

	super = aDPolyline ifFalse: [ ^ false ].
	self points = aDPolyline points ifFalse:[ ^ false ].
 
	^ true
]

{ #category : #copying }
SmockDPolyline >> copy [

	| copy |
	copy := super copy.
	copy points: (self points collect: [ :p | p copy ]).
	^ copy
]

{ #category : #initialization }
SmockDPolyline >> initialize [

	super initialize.
	isTranslatedByParent := false
]

{ #category : #accessing }
SmockDPolyline >> points [
	
	^ points ifNil: [ points := OrderedCollection new ]
]

{ #category : #accessing }
SmockDPolyline >> points: anObject [

	points := anObject
]
