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

	self position ifNil: [ ^ false ].
	self radius ifNil: [ ^ false ].
	self radius = 0 ifTrue: [ ^ false ].

	^ super isDrawable
	
]

{ #category : #accessing }
SmockGCircle2D >> radius [

	^ radius
]

{ #category : #accessing }
SmockGCircle2D >> radius: anObject [

	radius := anObject
]
