Class {
	#name : #SmockGCircle2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'radius'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #testing }
SmockGCircle2D >> isDrawable [ 

	super isDrawable ifFalse:[ ^ false ].
	self position ifNil: [ ^ false ].
	self radius ifNil: [ ^ false ].
	self radius = 0 ifTrue: [ ^ false ].

	^ true	
]

{ #category : #'as yet unclassified' }
SmockGCircle2D >> radius [

	^ radius
]

{ #category : #'as yet unclassified' }
SmockGCircle2D >> radius: anObject [

	radius := anObject
]
