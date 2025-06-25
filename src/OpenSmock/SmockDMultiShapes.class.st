"
Je suis un objet qui gère plusieurs shapes en tant qu'une seule, par exemple dans le cas de compositions de formes (SVG, VMap, formes projetées, etc.)
"
Class {
	#name : #SmockDMultiShapes,
	#superclass : #SmockDLeafShape,
	#instVars : [
		'shapes'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDMultiShapes >> = aDMultiShapes [
	"compare each values of the DMultiShapes"

	super = aDMultiShapes ifFalse: [ ^ false ].
	self shapes = aDMultiShapes shapes ifFalse: [ ^ false ].

	^ true
]

{ #category : #shapes }
SmockDMultiShapes >> addShape: aDShape [

	self shapes add: aDShape
]

{ #category : #shapes }
SmockDMultiShapes >> addShapes: aDShapeList [

	self shapes addAll: aDShapeList
]

{ #category : #copying }
SmockDMultiShapes >> copy [

	| copy |
	copy := super copy.
	copy shapes: (self shapes collect: [ :e | e copy ]).
	^ copy
]

{ #category : #shapes }
SmockDMultiShapes >> removeShapes [

	self shapes removeAll
]

{ #category : #accessing }
SmockDMultiShapes >> shapes [

	^ shapes ifNil:[ shapes := OrderedCollection new ]
]

{ #category : #accessing }
SmockDMultiShapes >> shapes: anObject [

	shapes := anObject
]
