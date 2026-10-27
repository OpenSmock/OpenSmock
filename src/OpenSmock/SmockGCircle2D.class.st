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
	"Implement circle distance based on the radius"

	| distance |
	distance := self distanceToFromPosition: aPoint select: aSelectBlock.
	(distance = SmallInteger maxVal or: [ self radius isNil ]) ifTrue: [
		^ distance ].

	distance := distance > self radius
		            ifTrue: [ distance - self radius ]
		            ifFalse: [ 0 ].

	^ distance
]

{ #category : #testing }
SmockGCircle2D >> isDrawable [

	super isDrawable ifFalse: [ ^ false ].

	self position ifNil: [ ^ false ].
	self radius ifNil: [ ^ false ].
	self radius = 0 ifTrue: [ ^ false ].

	^ true
]

{ #category : #accessing }
SmockGCircle2D >> radius [

	^ radius
]

{ #category : #accessing }
SmockGCircle2D >> radius: anObject [

	radius := anObject
]
