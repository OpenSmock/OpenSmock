Class {
	#name : #SmockGMultiShapes2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'shapes'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #shapes }
SmockGMultiShapes2D >> addShape: aGShape2D [

	self shapes add: aGShape2D 
]

{ #category : #shapes }
SmockGMultiShapes2D >> addShapes: aGShape2DList [

	self shapes addAll: aGShape2DList
]

{ #category : #testing }
SmockGMultiShapes2D >> isDrawable [ 

	super isDrawable ifFalse:[ ^ false ].
	self shapes ifEmpty: [ ^ false ].

	^ true
]

{ #category : #shapes }
SmockGMultiShapes2D >> removeShapes [

	self shapes removeAll
]

{ #category : #accessing }
SmockGMultiShapes2D >> shapes [

	^ shapes ifNil:[ shapes := OrderedCollection new ]
]

{ #category : #accessing }
SmockGMultiShapes2D >> shapes: anObject [

	shapes := anObject
]
