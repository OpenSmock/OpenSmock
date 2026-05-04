Class {
	#name : #SmockGCircle2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'radius'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #comparing }
SmockGCircle2D >> distanceTo: aPoint select: aSelectBlock [

	| distance |
	distance := super distanceTo: aPoint select: aSelectBlock.
	
	self isPickModeRadius ifFalse:[^distance].
	
	distance := (distance > self radius) ifTrue:[  distance - self radius] ifFalse:[ 0].
	
	^distance
	
	
]

{ #category : #testing }
SmockGCircle2D >> isDrawable [

	super isDrawable ifFalse: [ ^ false ].

	self position ifNil: [ ^ false ].
	self radius ifNil: [ ^ false ].
	self radius = 0 ifTrue: [ ^ false ].

	^ true
]

{ #category : #picking }
SmockGCircle2D >> isPickModeRadius [

	^ self pickMode = #radius
]

{ #category : #accessing }
SmockGCircle2D >> radius [

	^ radius
]

{ #category : #accessing }
SmockGCircle2D >> radius: anObject [

	radius := anObject
]
