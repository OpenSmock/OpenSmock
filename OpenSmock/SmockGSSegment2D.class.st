Class {
	#name : #SmockGSSegment2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'extent'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #accessing }
SmockGSSegment2D >> extent [

	^ extent
]

{ #category : #accessing }
SmockGSSegment2D >> extent: anObject [

	extent := anObject
]

{ #category : #testing }
SmockGSSegment2D >> isDrawable [ 

	self position ifNil: [ ^ false ].
	self extent ifNil: [ ^ false ].

	^ super isDrawable
]
