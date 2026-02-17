Class {
	#name : #SmockGRectangle2D,
	#superclass : #SmockGLeafShape2D,
	#traits : 'TSmockRotatable',
	#classTraits : 'TSmockRotatable classTrait',
	#instVars : [
		'length1',
		'length2'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #testing }
SmockGRectangle2D >> isDrawable [

	super isDrawable ifFalse: [ ^ false ].

	self position ifNil: [ ^ false ].
	self length1 ifNil: [ ^ false ].
	self length2 ifNil: [ ^ false ].

	^ true
]

{ #category : #accessing }
SmockGRectangle2D >> length1 [

	^ length1
]

{ #category : #accessing }
SmockGRectangle2D >> length1: anObject [

	length1 := anObject
]

{ #category : #accessing }
SmockGRectangle2D >> length2 [

	^ length2
]

{ #category : #accessing }
SmockGRectangle2D >> length2: anObject [

	length2 := anObject
]
