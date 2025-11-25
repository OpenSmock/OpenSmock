Trait {
	#name : #TSmockHavePaintStyles,
	#instVars : [
		'fillStyle',
		'strokeStyle'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #'paint styles' }
TSmockHavePaintStyles >> fillStyle [

	^ fillStyle
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> fillStyle: anObject [

	fillStyle := anObject
]

{ #category : #testing }
TSmockHavePaintStyles >> isTransparent [

	| fillTransparent strokeTransparent |
	fillTransparent := self fillStyle
		                   ifNotNil: [ :e | e isTransparent ]
		                   ifNil: [ true ].
	strokeTransparent := self strokeStyle
		                     ifNotNil: [ :e | e isTransparent ]
		                     ifNil: [ true ].

	^ fillTransparent and: [ strokeTransparent ]
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> strokeStyle [

	^ strokeStyle
]

{ #category : #'paint styles' }
TSmockHavePaintStyles >> strokeStyle: anObject [

	strokeStyle := anObject
]
