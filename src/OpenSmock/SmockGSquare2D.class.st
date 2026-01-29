Class {
	#name : #SmockGSquare2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'sideSize'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #accessing }
SmockGSquare2D >> getSquare [

	^ self sideSize negated / 2 asPoint corner: self sideSize / 2 asPoint
]

{ #category : #testing }
SmockGSquare2D >> isDrawable [

	super isDrawable ifFalse: [ ^ false ].

	self position ifNil: [ ^ false ].
	self sideSize = 0 ifTrue: [ ^ false ].

	^ true
]

{ #category : #accessing }
SmockGSquare2D >> sideSize [

	^ sideSize ifNil: [ sideSize := 20 ]
]

{ #category : #accessing }
SmockGSquare2D >> sideSize: anObject [

	sideSize := anObject
]
