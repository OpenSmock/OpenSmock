Class {
	#name : #SmockGSegment2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'extent'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #accessing }
SmockGSegment2D >> extent [

	^ extent
]

{ #category : #accessing }
SmockGSegment2D >> extent: anObject [

	extent := anObject
]

{ #category : #testing }
SmockGSegment2D >> isDrawable [

	super isDrawable ifFalse: [ ^ false ].

	self position ifNil: [ ^ false ].
	self extent ifNil: [ ^ false ].

	^ true
]
