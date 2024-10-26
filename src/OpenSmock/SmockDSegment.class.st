"
I am a Display Segment.
I am used to display a segment on a geo view.
"
Class {
	#name : #SmockDSegment,
	#superclass : #SmockDLeafShape,
	#instVars : [
		'coordinates2'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDSegment >> = aDSegment [

	super = aDSegment ifFalse: [ ^ false ].
	self coordinates2 ~= aDSegment coordinates2 ifTrue: [ ^ false ].
	
	^ true
]

{ #category : #accessing }
SmockDSegment >> coordinates2 [

	^ coordinates2
]

{ #category : #accessing }
SmockDSegment >> coordinates2: anObject [

	coordinates2 := anObject
]

{ #category : #copying }
SmockDSegment >> copy [

	| copy |
	copy := super copy.
	copy coordinates2: self coordinates2 copy.
	^ copy
]
