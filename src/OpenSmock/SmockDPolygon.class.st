"
I am a Display Polygon.
I am used to display a polygon on a geo view.
"
Class {
	#name : #SmockDPolygon,
	#superclass : #SmockDLeafShape,
	#instVars : [
		'points'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDPolygon >> = aDPolygon [
	"compare each values of the aDPolygon"

	super = aDPolygon ifFalse: [ ^ false ].
	self points = aDPolygon points ifFalse: [ ^ false ].

	^ true
]

{ #category : #copying }
SmockDPolygon >> copy [

	| copy |
	copy := super copy.
	copy points: (self points collect: [ :p | p copy ]).
	
	^ copy
]

{ #category : #initialization }
SmockDPolygon >> initialize [

	super initialize.
	isTranslatedByParent := false
]

{ #category : #accessing }
SmockDPolygon >> points [

	^ points ifNil: [ points := OrderedCollection new ]
]

{ #category : #accessing }
SmockDPolygon >> points: anObject [

	points := anObject
]
